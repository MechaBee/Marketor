# Capability: Validate Social Posts

## When to Use

Validate social post format compliance against current standards.

**Trigger patterns:**
- "validate campaign [name]"
- "validate file [path]"
- "validate all social posts in campaign [name]"
- "check social format"

**Don't use when:**
- User wants to validate calendar/scheduling (different skill)
- User wants content quality review (different capability)
- Content validation (use content review capability)

## Required Parameters

- **workspace_id**: Workspace identifier
- **scope_type**: "campaign" | "file"
- **scope_value**: Campaign name or file path

## Optional Parameters

- **auto_fix**: Boolean, default false (prompt for each fix)

## High-Level Process

### 1. Determine Scope

**scope_type = "campaign":**
- Discover all social post files in campaign
- Pattern: `campaigns/[campaign]/content-assets/social/**/*.md`
- Filter: `text_*_rev*.md` naming pattern

**scope_type = "file":**
- Validate single file at scope_value path

### 2. Parse and Validate Files

For each file:
- Check metadata section format
- Validate required fields
- Check platform-specific structure
- Verify file naming compliance
- Categorize issues by severity

### 3. Report Issues

Group by severity:
- **Critical Errors**: Must fix to conform
- **Warnings**: Should review
- **Info**: Suggestions for optimization

### 4. Interactive Fixing

For each non-conforming file:
- Show current format snippet
- Show proposed corrected format
- Explain changes
- Ask: "Fix this file? (yes/no/skip all)"
- Apply fix if confirmed
- Create backup before modification

NOTE: you do the modifications yourself, you do not delegate it to sub agents.

### 5. Generate Summary Report

Statistics + detailed issues + file references

## Validation Checks

### Critical Errors (Must Fix)

**Metadata Section:**
- Missing `## Post Metadata` header (must be h2 '##' )
- Using YAML frontmatter format (legacy)
- Missing required fields: Platform, Format, Topic, Revision, Target Audience, Objective, Created, Status
- Invalid platform value (not in: facebook, instagram, google, linkedin)
- Invalid format for platform (check manifest validation_rules)
- Malformed metadata structure

**Content Structure:**
- Missing `---` separator after metadata
- Missing `## Post Content` header, (must be h2 '##' )

**File Naming:**
- Pattern mismatch: `text_[topic-slug]_[context-slug]_rev[n].md`
- Invalid characters in slugs (use lowercase, hyphens only)
- Missing or invalid revision number

### Warnings (Should Review)

- Missing optional metadata fields (CTA URL, Hashtags, Associated Media, Updated)
- Missing platform-specific content sections
- Inconsistent metadata field formatting
- Non-standard date format (should be YYYY-MM-DD)

### Info (Suggestions)

- Suboptimal content structure for platform
- Missing media descriptions
- Could benefit from additional fields

## Modification Workflow

### For Each Non-Conforming File:

1. **Present Issue:**
   ```
   File: [file:campaigns/summer-travel/.../text_travel-insurance_rev1.md]
   Issue: YAML frontmatter detected (legacy format)
   ```

2. **Show Current Format:**
   ```markdown
   ---
   platform: meta
   format: fb-link-post
   campaign: summer-travel
   ---
   # Title
   ```

3. **Show Proposed Fix:**
   ```markdown
   # Title

   ## Post Metadata

   **Platform**: facebook
   **Format**: fb-link-post
   **Topic**: travel-insurance
   **Revision**: 1
   **Target Audience**: young-travelers
   **Objective**: engagement
   **Created**: 2025-10-29
   **Status**: draft

   ---

   ## Post Content
   ```

4. **Ask Confirmation:**
   ```
   Changes:
   - Migrate YAML frontmatter → Markdown header
   - Add required fields: Topic, Revision, Target Audience, Objective, Created, Status
   - Add content structure separator

   Fix this file? (yes/no/skip all)
   ```

5. **Apply Fix:**
   - Create backup: `.filename.md.backup-[timestamp]`
   - Apply modifications
   - Preserve all content/copy
   - Confirm success

### Batch Operations:

**"Skip all" behavior:**
- Stop prompting for fixes
- Continue validation
- Report all remaining issues in final summary

## Key Behaviors

**Continue on Error:**
- Don't fail entire validation on single file error
- Report issues, continue to next file
- Accumulate all issues for final report

**Preserve Content:**
- Only modify format/structure
- Never change actual copy/wording
- Preserve whitespace in content sections
- Keep all original content sections

**Intelligent Defaults:**
- Extract Topic from filename when missing
- Extract Revision from filename when missing
- Default Status: draft
- Default Objective: engagement
- Prompt for Target Audience if missing

**File Safety:**
- Create backup before any modification
- Verify write succeeded before confirming
- Report any file operation errors

**Grouping:**
- Group similar issues across files
- Report file counts per issue type
- Use file references for navigation: `[file:path]`

## Integration Points

**Auto-triggered after create_social_post:**
- If auto_validate parameter is true
- Run validation on newly created file
- Report issues immediately
- Offer to fix before suggesting next steps

**Manual invocation:**
- Campaign-wide validation
- Single file validation
- Explicit validation requests

**References:**
- Format standard: [capabilities/create-social-post.md](capabilities/create-social-post.md) lines 88-121
- Platform structures: [resources/platform-content-structures-*.md](resources/)
- Validation patterns: [resources/validation-patterns.md](resources/validation-patterns.md)

## Error Handling

**Campaign not found:**
- List available campaigns
- Offer to create campaign structure

**File not found:**
- Verify path spelling
- List similar files in campaign

**No social posts found:**
- Report empty result
- Suggest creating content first

**Parse errors:**
- Report malformed file
- Show problematic section
- Offer to review manually or attempt auto-fix

**Write permission errors:**
- Report permission issue
- Suggest running with appropriate access
- Offer read-only validation report

## Example Interaction

**User:** "validate campaign summer-travel"

**Agent:**
```
Discovering social posts in campaign "summer-travel"...
✅ Found 23 social post files

Validating format compliance...

📊 Validation Report

Files Checked: 23
✅ Conforming: 18 (78%)
⚠️ Issues Found: 5 (22%)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔴 CRITICAL ERRORS (2 files)

[file:campaigns/summer-travel/.../text_travel-insurance_rev1.md]
- YAML frontmatter format (should be markdown header)
- Missing required field: Target Audience

[file:campaigns/summer-travel/.../text_reel-hook_rev2.md]
- Invalid platform value: "Instagram" (should be: instagram)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚠️ WARNINGS (3 files)

[file:campaigns/summer-travel/.../text_insurance-tips_rev1.md]
- Missing optional field: CTA URL
- Missing platform-specific section: Engagement Prompt

[...]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Would you like to review and fix critical errors? (yes/no)
```

**User:** "yes"

**Agent:** [Iterates through each critical error, shows proposal, asks confirmation]

## File References

**Validation rules:** `/_meta/skills/social-authoring/skill-manifest.yaml`
**Format standard:** `/_meta/skills/social-authoring/capabilities/create-social-post.md` (lines 88-121)
**Platform structures:**
  - Meta: `resources/platform-content-structures-meta.md`
  - Google: `resources/platform-content-structures-google.md`
  - LinkedIn: `resources/platform-content-structures-linkedin.md`
