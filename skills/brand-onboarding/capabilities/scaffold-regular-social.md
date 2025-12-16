# Capability: scaffold_regular_social

Initialize a sparse regular social content structure in the workspace for non-campaign social media posts.

## Purpose

Create a time-organized folder structure for regular (non-campaign) social media content with monthly folders and an evergreen section. The structure is intentionally sparse - only month-level folders are pre-created, while platform-specific format folders (fb-link-post, ig-reel, etc.) are generated as content is developed.

## Preconditions

* Workspace exists and is accessible
* Marketing strategy exists at `/policies/digital-marketing-plan.md` (to understand targeted platforms)
* Current date is available in context

## Required Parameters

None - operates on current workspace context

## Optional Parameters

* `months_ahead` - Number of months to scaffold (default: from current moth to end ofyear)
* `include_readme` - Generate README.md with usage instructions (default: true)

## Workflow

### 1. Validate Prerequisites

* Confirm workspace is accessible
* Check if `/regular-social/` already exists

  * If exists: Ask user if they want to proceed (may overwrite calendar.yaml and README.md)
  * If not exists: Proceed with scaffolding

### 2. Determine Time Range

* Get current date from context (format: YYYY-MM-DD)
* Calculate starting month (current month)
* Generate list of month identifiers for next N months (default: 12)

  * Format: `YYYY-M##` (e.g., 2025-M01, 2025-M02, ...)
  * Example: If current date is 2025-11-11, create: 2025-M11, 2025-M12, 2026-M01, ..., 2026-M10

### 3. Read Marketing Strategy (Optional)

* Read `/policies/digital-marketing-plan.md`
* Extract targeted social platforms and formats
* This information is for README documentation only
* Do NOT pre-create format folders

### 4. Create Sparse Folder Structure

Create only top-level month folders:

```
/regular-social/
  ├── 2025-M11/          # Current month
  ├── 2025-M12/
  ├── 2026-M01/
  ├── 2026-M02/
  ├── ...
  ├── 2026-M10/          # 12 months ahead
  └── evergreen/         # Timeless content
```

**Important:** Do NOT create platform-specific subfolders (fb-link-post/, ig-reel/, etc.). These will be created automatically when content is generated.

### 5. Create calendar.yaml

Generate `/regular-social/calendar.yaml` with structure:

```yaml
# Regular Social Content Calendar
# Manages scheduling for non-campaign social media posts

calendar_version: "1.0"
last_updated: "[CURRENT_DATE]"
campaign_id: "regular-social"

# Scheduled posts organized by month folders and evergreen content
scheduled_posts:
  # Example entry structure:
  # 2025-M01/fb-link-post/text_home-insurance-winter_rev1.md:
  #   platform: facebook
  #   format: fb-link-post
  #   scheduled_date: "2025-01-15"
  #   scheduled_time: "10:00"
  #   timezone: "Europe/Budapest"
  #   status: scheduled
  #   media_files:
  #     - 2025-M01/fb-link-post/image_home-insurance-winter_rev1.png
  #   month_folder: "2025-M01"

# Published posts archive
published_posts:
  # Posts move here after publication with published_date and platform_post_id

# Notes:
# - All file paths are relative to /regular-social/
# - month_folder helps filter and organize by time period
# - Use "evergreen" for timeless content
# - Supported platforms: facebook, instagram, google, linkedin
# - Status values: draft, scheduled, published, failed
```

### 6. Create README.md

Generate `/regular-social/README.md` with:

* Purpose and structure explanation
* Month folder naming convention
* Evergreen content guidelines
* Supported platforms and formats (from marketing strategy)
* Calendar usage instructions
* Content naming conventions
* Example workflows

**Template structure:**

```markdown
# Regular Social Content

Non-campaign social media posts organized by month and content type.

## Structure

- **Monthly folders** (`YYYY-M##`): Time-bound content for specific months
- **Evergreen folder**: Timeless content that can be reused
- **Sparse design**: Format folders (fb-link-post/, ig-reel/) are created as content is developed

## Supported Platforms

[List from marketing strategy]

## Content Naming

- Text: `text_[topic-slug]_[context-slug]_rev[n].md`
- Images: `image_[topic-slug]_[context-slug]_rev[n].[ext]`

## Scheduling

Use `/regular-social/calendar.yaml` for scheduling posts.

## Workflows

1. Generate content → Saved to appropriate month/evergreen folder
2. Schedule post → Added to calendar.yaml
3. Publish → Moved to published_posts in calendar
```

### 7. Update Master Calendar

* Read `/calendar/master-calendar.yaml`
* Check if `regular-social` entry exists
* If not exists: Add entry:

```yaml
campaigns:
  - campaign_id: regular-social
    calendar_file: regular-social/calendar.yaml
    status: active
    type: regular
```

* If exists: Skip (already configured)

### 8. Confirm Completion

Report to user:

* Number of month folders created
* Date range covered
* Location of calendar.yaml and README.md
* Next steps (e.g., "Ready to generate regular content")

## Validation Checklist

* [ ] Month folders created for specified range
* [ ] Evergreen folder created
* [ ] calendar.yaml exists with proper structure
* [ ] README.md exists with usage instructions
* [ ] Master calendar updated with regular-social entry
* [ ] No format subfolders pre-created (sparse structure)

## Example Usage

**User request:**

```
"Setup regular social content structure"
"Initialize regular posts for the next year"
"Scaffold regular social folders"
```

**Agent actions:**

1. Determine current date: 2025-11-10
2. Calculate months: 2025-M10 through 2025-M12
3. Create 3 month folders + evergreen
4. Generate calendar.yaml and README.md
5. Update master-calendar.yaml
6. Confirm: "Regular social structure ready for 2025-M10 to 2026-M12"

## Integration with Content Generation

When content is generated:

1. Agent determines target month (or evergreen)
2. Agent determines platform and format
3. Agent creates format folder if needed: `/regular-social/2025-M11/fb-link-post/`
4. Agent saves content files
5. Agent can schedule via calendar.yaml

## Maintenance

* **Monthly rollover**: When entering a new month, consider scaffolding additional months
* **Archive old months**: Beginning a new year YYYY,  archive to `/archive/regular-social-[yyyy]/`
* **Calendar cleanup**: Periodically review and archive published posts

## Escalation Patterns

* If workspace access denied: Report error and request user intervention
* If marketing strategy missing: Proceed with default platform list, notify user
* If regular-social already exists: Ask user for confirmation before overwriting files
* If master-calendar.yaml missing: Create it with regular-social as first entry
