#!/usr/bin/env zsh
# release.zsh - Semantic versioned release management for Marketor
# Usage: ./scripts/release.zsh [--dry-run] [--help]

set -euo pipefail

# Configuration
readonly SCRIPT_DIR="${0:A:h}"
readonly PROJECT_ROOT="${SCRIPT_DIR:h}"
readonly VERSION_FILE="${PROJECT_ROOT}/VERSION"
readonly README_FILE="${PROJECT_ROOT}/README.md"
readonly SKILLS_DIR="${PROJECT_ROOT}/skills"
readonly BUNDLE_NAME="skills.zip"
readonly REMOTE_NAME="origin"
readonly MAIN_BRANCH="main"

# State
DRY_RUN=false
NEW_VERSION=""
BUMP_TYPE=""
CHANGELOG_ENTRIES=()

# ============================================================================
# Utility Functions
# ============================================================================

print_error() { print -P "%F{red}ERROR:%f $1" >&2 }
print_success() { print -P "%F{green}SUCCESS:%f $1" }
print_info() { print -P "%F{blue}INFO:%f $1" }
print_warning() { print -P "%F{yellow}WARNING:%f $1" }

confirm() {
    local prompt="$1"
    local response
    print -n "$prompt [y/N]: "
    read -r response
    [[ "$response" =~ ^[Yy]$ ]]
}

cleanup() {
    local exit_code=$?
    if [[ -f "${PROJECT_ROOT}/${BUNDLE_NAME}" ]]; then
        rm -f "${PROJECT_ROOT}/${BUNDLE_NAME}"
    fi
    exit $exit_code
}

# ============================================================================
# Validation Functions
# ============================================================================

check_prerequisites() {
    local missing=()

    command -v git &>/dev/null || missing+=("git")
    command -v gh &>/dev/null || missing+=("gh (GitHub CLI)")
    command -v zip &>/dev/null || missing+=("zip")

    if (( ${#missing[@]} > 0 )); then
        print_error "Missing required tools: ${missing[*]}"
        return 1
    fi

    if ! gh auth status &>/dev/null; then
        print_error "GitHub CLI not authenticated. Run 'gh auth login' first."
        return 1
    fi

    if ! git -C "$PROJECT_ROOT" rev-parse --git-dir &>/dev/null; then
        print_error "Not in a git repository"
        return 1
    fi

    if [[ ! -f "$VERSION_FILE" ]]; then
        print_error "VERSION file not found at $VERSION_FILE"
        return 1
    fi

    if [[ ! -f "$README_FILE" ]]; then
        print_error "README.md not found at $README_FILE"
        return 1
    fi

    print_success "All prerequisites satisfied"
    return 0
}

check_git_state() {
    if ! git -C "$PROJECT_ROOT" diff-index --quiet HEAD -- 2>/dev/null; then
        print_error "Working directory has uncommitted changes. Please commit or stash them first."
        git -C "$PROJECT_ROOT" status --short
        return 1
    fi

    local untracked
    untracked=$(git -C "$PROJECT_ROOT" ls-files --others --exclude-standard)
    if [[ -n "$untracked" ]]; then
        print_warning "Untracked files detected (will be ignored):"
        echo "$untracked" | sed 's/^/  /'
    fi

    local current_branch
    current_branch=$(git -C "$PROJECT_ROOT" rev-parse --abbrev-ref HEAD)
    if [[ "$current_branch" != "$MAIN_BRANCH" ]]; then
        print_warning "Not on $MAIN_BRANCH branch (currently on $current_branch)"
        if ! confirm "Continue anyway?"; then
            return 1
        fi
    fi

    git -C "$PROJECT_ROOT" fetch "$REMOTE_NAME" --quiet 2>/dev/null || true
    local local_commit remote_commit
    local_commit=$(git -C "$PROJECT_ROOT" rev-parse HEAD)
    remote_commit=$(git -C "$PROJECT_ROOT" rev-parse "${REMOTE_NAME}/${current_branch}" 2>/dev/null || echo "")

    if [[ -n "$remote_commit" && "$local_commit" != "$remote_commit" ]]; then
        print_warning "Local branch differs from remote"
        if ! confirm "Continue anyway?"; then
            return 1
        fi
    fi

    print_success "Git state validated"
    return 0
}

validate_version() {
    local version="$1"
    if [[ ! "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        print_error "Invalid version format: $version (expected X.Y.Z)"
        return 1
    fi
    return 0
}

# ============================================================================
# Version Management
# ============================================================================

get_current_version() {
    local version
    version=$(<"$VERSION_FILE")
    version="${version//[$'\t\r\n ']}"
    validate_version "$version" || return 1
    echo "$version"
}

bump_version() {
    local current="$1"
    local bump_type="$2"

    local major minor patch
    IFS='.' read -r major minor patch <<< "$current"

    case "$bump_type" in
        major)
            ((major++))
            minor=0
            patch=0
            ;;
        minor)
            ((minor++))
            patch=0
            ;;
        patch)
            ((patch++))
            ;;
        *)
            print_error "Invalid bump type: $bump_type"
            return 1
            ;;
    esac

    echo "${major}.${minor}.${patch}"
}

write_version() {
    local version="$1"
    if [[ "$DRY_RUN" == true ]]; then
        print_info "[DRY RUN] Would write version $version to $VERSION_FILE"
    else
        echo "$version" > "$VERSION_FILE"
        print_success "Updated VERSION file to $version"
    fi
}

# ============================================================================
# Changelog Management
# ============================================================================

get_unreleased_changes() {
    local in_unreleased=false
    local changes=()

    while IFS= read -r line; do
        if [[ "$line" =~ ^###[[:space:]]*\[Unreleased\] ]]; then
            in_unreleased=true
            continue
        fi
        if [[ "$in_unreleased" == true && "$line" =~ ^###[[:space:]]*\[ ]]; then
            break
        fi
        if [[ "$in_unreleased" == true && -n "${line// }" ]]; then
            if [[ ! "$line" =~ ^-[[:space:]]*_No[[:space:]]unreleased ]]; then
                changes+=("$line")
            fi
        fi
    done < "$README_FILE"

    printf '%s\n' "${changes[@]}"
}

prompt_changelog_entries() {
    local existing_changes
    existing_changes=$(get_unreleased_changes)

    print_info "Current unreleased changes:"
    if [[ -n "$existing_changes" ]]; then
        echo "$existing_changes"
    else
        echo "  (none)"
    fi
    echo

    if [[ -n "$existing_changes" ]]; then
        if confirm "Use existing unreleased changes?"; then
            CHANGELOG_ENTRIES=("${(f)existing_changes}")
            return 0
        fi
    fi

    print_info "Enter changelog entries (one per line, empty line to finish):"
    print_info "Prefix with category (Added/Changed/Fixed/Removed) or leave plain"

    local entry
    CHANGELOG_ENTRIES=()
    while true; do
        print -n "> "
        read -r entry
        [[ -z "$entry" ]] && break
        CHANGELOG_ENTRIES+=("- $entry")
    done

    if (( ${#CHANGELOG_ENTRIES[@]} == 0 )); then
        print_error "No changelog entries provided"
        return 1
    fi

    return 0
}

update_changelog() {
    local version="$1"
    local date_str
    date_str=$(date +%Y-%m-%d)

    if [[ "$DRY_RUN" == true ]]; then
        print_info "[DRY RUN] Would update changelog with version $version"
        print_info "Changelog entries:"
        printf '  %s\n' "${CHANGELOG_ENTRIES[@]}"
        return 0
    fi

    local new_section="### [$version] - $date_str"
    for entry in "${CHANGELOG_ENTRIES[@]}"; do
        new_section+="\n$entry"
    done

    local tmp_file
    tmp_file=$(mktemp)

    local in_unreleased=false

    while IFS= read -r line || [[ -n "$line" ]]; do
        if [[ "$line" =~ ^###[[:space:]]*\[Unreleased\] ]]; then
            echo "$line" >> "$tmp_file"
            echo "- _No unreleased changes yet_" >> "$tmp_file"
            echo "" >> "$tmp_file"
            echo -e "$new_section" >> "$tmp_file"
            in_unreleased=true
            continue
        fi

        if [[ "$in_unreleased" == true ]]; then
            if [[ "$line" =~ ^###[[:space:]]*\[ ]]; then
                in_unreleased=false
                echo "" >> "$tmp_file"
                echo "$line" >> "$tmp_file"
            fi
            continue
        fi

        echo "$line" >> "$tmp_file"
    done < "$README_FILE"

    mv "$tmp_file" "$README_FILE"
    print_success "Updated changelog in README.md"
}

# ============================================================================
# Bundle Creation
# ============================================================================

create_skills_bundle() {
    local bundle_path="${PROJECT_ROOT}/${BUNDLE_NAME}"

    if [[ "$DRY_RUN" == true ]]; then
        print_info "[DRY RUN] Would create $BUNDLE_NAME from skills directory"
        return 0
    fi

    rm -f "$bundle_path"

    (cd "$PROJECT_ROOT" && zip -rq "$BUNDLE_NAME" skills -x "*.DS_Store")

    if [[ -f "$bundle_path" ]]; then
        local size
        size=$(du -h "$bundle_path" | cut -f1)
        print_success "Created $BUNDLE_NAME ($size)"
        echo "$bundle_path"
    else
        print_error "Failed to create skills bundle"
        return 1
    fi
}

# ============================================================================
# Git Operations
# ============================================================================

create_commit() {
    local version="$1"
    local message="Release v${version}"

    if [[ "$DRY_RUN" == true ]]; then
        print_info "[DRY RUN] Would create commit: $message"
        print_info "Files to commit: VERSION, README.md"
        return 0
    fi

    git -C "$PROJECT_ROOT" add VERSION README.md
    git -C "$PROJECT_ROOT" commit -m "$message"
    print_success "Created commit: $message"
}

create_tag() {
    local version="$1"
    local tag="v${version}"

    if git -C "$PROJECT_ROOT" rev-parse "$tag" &>/dev/null; then
        print_error "Tag $tag already exists"
        return 1
    fi

    if [[ "$DRY_RUN" == true ]]; then
        print_info "[DRY RUN] Would create tag: $tag"
        return 0
    fi

    git -C "$PROJECT_ROOT" tag -a "$tag" -m "Release $tag"
    print_success "Created tag: $tag"
}

push_to_remote() {
    local version="$1"
    local tag="v${version}"

    if [[ "$DRY_RUN" == true ]]; then
        print_info "[DRY RUN] Would push to $REMOTE_NAME with tags"
        return 0
    fi

    git -C "$PROJECT_ROOT" push "$REMOTE_NAME" HEAD
    git -C "$PROJECT_ROOT" push "$REMOTE_NAME" "$tag"
    print_success "Pushed to $REMOTE_NAME with tag $tag"
}

# ============================================================================
# GitHub Operations
# ============================================================================

create_github_release() {
    local version="$1"
    local bundle_path="$2"
    local tag="v${version}"

    local release_notes="## What's Changed\n\n"
    for entry in "${CHANGELOG_ENTRIES[@]}"; do
        release_notes+="$entry\n"
    done

    if [[ "$DRY_RUN" == true ]]; then
        print_info "[DRY RUN] Would create GitHub release $tag"
        print_info "Release notes:"
        echo -e "$release_notes" | sed 's/^/  /'
        print_info "Would attach: $bundle_path"
        return 0
    fi

    gh release create "$tag" \
        --title "Release $tag" \
        --notes "$(echo -e "$release_notes")" \
        "$bundle_path"

    print_success "Created GitHub release: $tag"
    print_info "Release URL: $(gh repo view --json url -q .url)/releases/tag/$tag"
}

# ============================================================================
# Main Workflow
# ============================================================================

show_help() {
    cat << 'EOF'
Marketor Release Script

Usage: release.zsh [options]

Options:
  --dry-run    Simulate the release without making changes
  --help       Show this help message

Workflow:
  1. Validates prerequisites (git, gh CLI, clean state)
  2. Prompts for version bump type (major/minor/patch)
  3. Prompts for changelog entries
  4. Updates VERSION file and README.md changelog
  5. Creates git commit and tag
  6. Pushes to remote
  7. Creates GitHub release with skills.zip bundle

Example:
  ./scripts/release.zsh           # Normal release
  ./scripts/release.zsh --dry-run # Preview without changes
EOF
}

parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --dry-run)
                DRY_RUN=true
                print_warning "DRY RUN MODE - No changes will be made"
                shift
                ;;
            --help|-h)
                show_help
                exit 0
                ;;
            *)
                print_error "Unknown option: $1"
                show_help
                exit 1
                ;;
        esac
    done
}

prompt_bump_type() {
    echo
    print_info "Select version bump type:"
    echo "  1) patch - Bug fixes, minor updates (1.0.0 -> 1.0.1)"
    echo "  2) minor - New features, backwards compatible (1.0.0 -> 1.1.0)"
    echo "  3) major - Breaking changes (1.0.0 -> 2.0.0)"
    echo

    local choice
    while true; do
        print -n "Enter choice [1-3]: "
        read -r choice
        case "$choice" in
            1) BUMP_TYPE="patch"; break ;;
            2) BUMP_TYPE="minor"; break ;;
            3) BUMP_TYPE="major"; break ;;
            *) print_error "Invalid choice, please enter 1, 2, or 3" ;;
        esac
    done
}

main() {
    parse_arguments "$@"

    echo "========================================"
    echo "  Marketor Release Script"
    echo "========================================"
    echo

    trap cleanup EXIT

    print_info "Checking prerequisites..."
    check_prerequisites || exit 1

    print_info "Checking git state..."
    check_git_state || exit 1

    local current_version
    current_version=$(get_current_version) || exit 1
    print_info "Current version: $current_version"

    prompt_bump_type

    NEW_VERSION=$(bump_version "$current_version" "$BUMP_TYPE")
    print_info "New version will be: $NEW_VERSION"
    echo

    prompt_changelog_entries || exit 1

    echo
    echo "========================================"
    echo "  Release Summary"
    echo "========================================"
    echo "  Version: $current_version -> $NEW_VERSION"
    echo "  Bump type: $BUMP_TYPE"
    echo "  Changelog entries: ${#CHANGELOG_ENTRIES[@]}"
    echo "========================================"
    echo

    if [[ "$DRY_RUN" == false ]]; then
        if ! confirm "Proceed with release?"; then
            print_info "Release cancelled"
            exit 0
        fi
    fi

    print_info "Updating version..."
    write_version "$NEW_VERSION"

    print_info "Updating changelog..."
    update_changelog "$NEW_VERSION"

    print_info "Creating skills bundle..."
    local bundle_path
    bundle_path=$(create_skills_bundle) || exit 1

    print_info "Creating commit..."
    create_commit "$NEW_VERSION"

    print_info "Creating tag..."
    create_tag "$NEW_VERSION"

    print_info "Pushing to remote..."
    push_to_remote "$NEW_VERSION"

    print_info "Creating GitHub release..."
    create_github_release "$NEW_VERSION" "${PROJECT_ROOT}/${BUNDLE_NAME}"

    rm -f "${PROJECT_ROOT}/${BUNDLE_NAME}"

    echo
    echo "========================================"
    print_success "Release v${NEW_VERSION} completed successfully!"
    echo "========================================"
}

main "$@"
