# Skill Registry Refactoring Instructions

## Overview

This document provides step-by-step instructions for refactoring the skill registry structure to improve naming consistency, logical grouping, and single-responsibility adherence.

## Pre-Refactor Checklist

Before starting:
- [ ] Back up the entire `_meta/skills/` directory
- [ ] Ensure no active processes are reading from skill manifests
- [ ] Review each change with the user before executing

---

## Phase 1: Add Category Field to Registry

**File:** `skill-registry.yaml`

**Action:** Add a `category` field to each skill entry for logical grouping.

**Categories to use:**
- `workspace` - Workspace lifecycle and setup
- `content` - Content authoring skills
- `assets` - Media and asset generation
- `knowledge` - Information ingestion and research
- `campaigns` - Campaign operations and scheduling

**Example transformation:**

```yaml
# BEFORE
- skill_id: social-authoring
  skill_path: _meta/skills/social-authoring
  manifest_file: _meta/skills/social-authoring/skill-manifest.yaml
  version: "1.0"
  status: active
  description: |
    Generate social media content...

# AFTER
- skill_id: social-authoring
  skill_path: _meta/skills/social-authoring
  manifest_file: _meta/skills/social-authoring/skill-manifest.yaml
  version: "1.0"
  status: active
  category: content  # <-- ADD THIS
  description: |
    Generate social media content...
```

**Apply these category assignments:**

| skill_id | category |
|----------|----------|
| `calendar-scheduling` | `campaigns` |
| `social-authoring` | `content` |
| `workspace-orchestration` | `workspace` |
| `blog-authoring` | `content` |
| `creative-support` | (will be split - skip for now) |
| `campaign-management` | `campaigns` |
| `landing-page-authoring` | `content` |

---

## Phase 2: Rename Skills for Clarity

### 2.1 Rename `workspace-orchestration` to `brand-onboarding`

**Rationale:** The skill handles brand setup and onboarding, not general orchestration.

**Steps:**

1. Rename directory:
   ```
   _meta/skills/workspace-orchestration/ -> _meta/skills/brand-onboarding/
   ```

2. Update `skill-manifest.yaml` inside the renamed directory:
   ```yaml
   # Change this line:
   skill_id: workspace-orchestration
   # To:
   skill_id: brand-onboarding
   ```

3. Update `skill-registry.yaml`:
   ```yaml
   # Change:
   - skill_id: workspace-orchestration
     skill_path: _meta/skills/workspace-orchestration
     manifest_file: _meta/skills/workspace-orchestration/skill-manifest.yaml

   # To:
   - skill_id: brand-onboarding
     skill_path: _meta/skills/brand-onboarding
     manifest_file: _meta/skills/brand-onboarding/skill-manifest.yaml
     category: workspace
   ```

4. Update the description to match:
   ```yaml
   description: |
     Complete brand workspace setup including directory structure, deep brand
     research, marketing plan generation, and regular social scaffolding.
   ```

### 2.2 Rename `calendar-scheduling` to `content-scheduling`

**Rationale:** The skill schedules content posts, not general calendar events.

**Steps:**

1. Rename directory:
   ```
   _meta/skills/calendar-scheduling/ -> _meta/skills/content-scheduling/
   ```

2. Update `skill-manifest.yaml`:
   ```yaml
   skill_id: content-scheduling  # was: calendar-scheduling
   ```

3. Update `skill-registry.yaml` with new paths and `category: campaigns`

4. Update description:
   ```yaml
   description: |
     Manage content post scheduling, publishing, and calendar maintenance
     across campaigns and platforms.
   ```

---

## Phase 3: Split `creative-support` into Two Skills

**Rationale:** `creative-support` violates single-responsibility by combining image generation with source ingestion.

### 3.1 Create `image-generation` skill

**Steps:**

1. Create new directory: `_meta/skills/image-generation/`

2. Create new directory: `_meta/skills/image-generation/capabilities/`

3. Move file:
   ```
   _meta/skills/creative-support/capabilities/generate-image.md
   -> _meta/skills/image-generation/capabilities/generate-image.md
   ```

4. Create `_meta/skills/image-generation/skill-manifest.yaml`:

```yaml
# Image Generation Skill Manifest

skill_id: image-generation
version: "1.0"
status: beta

description: |
  Generate AI images with optimized prompts and save them with
  documentation to workspace. Supports various aspect ratios,
  art styles, and content-aware prompt enhancement.

capabilities:
  generate_image:
    description: Generate AI images with optimized prompts and save them with documentation to workspace.
    instruction_file: capabilities/generate-image.md
    required_params:
      - workspace_id
    optional_params:
      - content_file_path
      - target_folder_path
      - aspect_ratio
      - person_generation
      - art_style
      - image_concept
    trigger_patterns:
      - "generate.*image"
      - "create.*image"
      - "need.*image.*for"
      - "make.*image"
      - "add.*image"

required_tools:
  - workspace_read_operations
  - workspace_write_operations
  - generate_image_google_ai

optional_tools:
  - system_guides_read_operations

useful_sub_agents: [content_processor]

workspace_paths:
  media_guides: "/policies/media-generation/*.md"
  campaign_assets: "/campaigns/[campaign-name]/content-assets/"

validation_rules:
  image_prompt_max_length: 2500
  prompt_file_naming: "[image-filename]-prompt.md"
  image_file_naming: "image_[topic-slug]_[context-slug]_rev[n].png"
  media_folder_location: "media/"
```

5. Add to `skill-registry.yaml`:

```yaml
- skill_id: image-generation
  skill_path: _meta/skills/image-generation
  manifest_file: _meta/skills/image-generation/skill-manifest.yaml
  version: "1.0"
  status: beta
  category: assets
  description: |
    Generate AI images with optimized prompts and documentation.
```

### 3.2 Create `source-ingestion` skill

**Steps:**

1. Create new directory: `_meta/skills/source-ingestion/`

2. Create new directory: `_meta/skills/source-ingestion/capabilities/`

3. Move file:
   ```
   _meta/skills/creative-support/capabilities/summarize-external-source.md
   -> _meta/skills/source-ingestion/capabilities/summarize-external-source.md
   ```

4. Create `_meta/skills/source-ingestion/skill-manifest.yaml`:

```yaml
# Source Ingestion Skill Manifest

skill_id: source-ingestion
version: "1.0"
status: beta

description: |
  Ingest and summarize external URLs, documents, and web content
  into workspace knowledge files. Transforms external information
  into reusable campaign knowledge.

capabilities:
  summarize_external_source:
    description: Ingest and summarize external URLs or documents into workspace knowledge.
    instruction_file: capabilities/summarize-external-source.md
    required_params:
      - source_url
      - target_path
    optional_params:
      - summary_style
      - sections_of_interest
    trigger_patterns:
      - "summarize.*url"
      - "ingest.*article"
      - "capture.*website.*info"
      - "add.*source.*to.*knowledge"

required_tools:
  - workspace_read_operations
  - workspace_write_operations

optional_tools:
  - system_guides_read_operations
  - web_ingest_operations

workspace_paths:
  knowledge_root: "/campaigns/[campaign-name]/knowledge/"
  general_knowledge: "/knowledge/"

validation_rules:
  output_format: "markdown"
  required_sections:
    - source_url
    - summary
    - key_points
```

5. Add to `skill-registry.yaml`:

```yaml
- skill_id: source-ingestion
  skill_path: _meta/skills/source-ingestion
  manifest_file: _meta/skills/source-ingestion/skill-manifest.yaml
  version: "1.0"
  status: beta
  category: knowledge
  description: |
    Ingest and summarize external URLs and documents into workspace knowledge.
```

### 3.3 Remove old `creative-support` skill

1. Remove from `skill-registry.yaml` the entire `creative-support` entry

2. Delete directory: `_meta/skills/creative-support/` (after confirming all files moved)

---

## Phase 4: Standardize Capability Names

Update capability names in manifests to follow `verb_noun` pattern consistently.

### 4.1 In `content-scheduling/skill-manifest.yaml` (formerly calendar-scheduling)

```yaml
# Change:
initialize_campaign_calendar -> initialize_calendar
list_scheduled -> list_posts
review_unscheduled -> review_drafts
publish_post -> mark_published
validate_calendar -> validate_schedule
```

Update the `instruction_file` paths to match if files are renamed.

### 4.2 In `blog-authoring/skill-manifest.yaml`

```yaml
# Change:
blog_idea_generation_from_source -> generate_ideas

# Update instruction_file path:
instruction_file: capabilities/generate-ideas.md  # was: blog-idea-generation-from-source.md
```

Rename the actual file:
```
capabilities/blog-idea-generation-from-source.md -> capabilities/generate-ideas.md
```

### 4.3 In `campaign-management/skill-manifest.yaml`

```yaml
# Change:
register_campaign_idea -> create_idea
update_campaign_summary -> update_summary
```

Update instruction file paths accordingly.

---

## Phase 5: Update Registry File Order

Reorder `skill-registry.yaml` entries by category for readability:

```yaml
skills:
  # === WORKSPACE LIFECYCLE ===
  - skill_id: brand-onboarding
    category: workspace
    # ...

  # === CONTENT AUTHORING ===
  - skill_id: social-authoring
    category: content
    # ...

  - skill_id: blog-authoring
    category: content
    # ...

  - skill_id: landing-page-authoring
    category: content
    # ...

  # === ASSET GENERATION ===
  - skill_id: image-generation
    category: assets
    # ...

  # === KNOWLEDGE MANAGEMENT ===
  - skill_id: source-ingestion
    category: knowledge
    # ...

  # === CAMPAIGN OPERATIONS ===
  - skill_id: campaign-management
    category: campaigns
    # ...

  - skill_id: content-scheduling
    category: campaigns
    # ...
```

---

## Phase 6: Update Registry Metadata

Update the registry header:

```yaml
registry_version: "2.0"  # Increment version
last_updated: "[TODAY'S DATE]"
```

---

## Validation Checklist

After completing all phases:

- [ ] All skill directories exist with correct names
- [ ] All `skill-manifest.yaml` files have matching `skill_id` values
- [ ] All `skill-registry.yaml` paths are valid
- [ ] All capability `instruction_file` paths point to existing files
- [ ] No orphaned files in old directories
- [ ] `creative-support` directory fully removed

---

## Summary of Changes

| Before | After | Type |
|--------|-------|------|
| `workspace-orchestration` | `brand-onboarding` | Rename |
| `calendar-scheduling` | `content-scheduling` | Rename |
| `creative-support` | `image-generation` + `source-ingestion` | Split |
| `initialize_campaign_calendar` | `initialize_calendar` | Capability rename |
| `blog_idea_generation_from_source` | `generate_ideas` | Capability rename |
| `register_campaign_idea` | `create_idea` | Capability rename |
| (none) | `category` field on all skills | Addition |

---

## Rollback Plan

If issues occur, restore from the backup created in pre-refactor checklist.
