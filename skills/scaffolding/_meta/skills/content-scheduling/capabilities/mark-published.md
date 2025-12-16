# Capability: Mark Published

## When to Use

User confirms a post has been published on-platform and wants the calendar updated by moving the entry from `scheduled_posts` to `published_posts`.

**Trigger patterns:**
- "publish post"
- "mark published"
- "post went live"

**Don't use when:**
- User wants to schedule a post (use `schedule_post`)
- User wants to review scheduled content (use `list_posts`)

## Required Parameters

- **content_file_path**: Workspace path to content `.md` file
- **published_date**: Publication date (YYYY-MM-DD or ISO 8601 string)

## Optional Parameters

- **platform_post_id**: Platform-assigned post ID
- **platform_url**: Direct link to the published post

## High-Level Process

### 1. Validate Content File

Verify `content_file_path` exists. If missing, stop and ask for the correct path.

### 2. Detect Calendar Context

Determine the calendar based on `content_file_path`:

**Campaign content**
```
campaigns/[campaign-name]/content-assets/... → campaign-name
Calendar path: campaigns/[campaign-name]/calendar.yaml
Relative key: content-assets/...
```

**Regular-social content**
```
regular-social/[month-folder]/[platform]/[format]/... → regular-social
Calendar path: regular-social/calendar.yaml
Relative key: [month-folder]/[platform]/[format]/...
```

If the path matches neither pattern, report an error and provide examples of valid paths.

### 3. Read Calendar

Read the calendar file. If it doesn't exist, report the missing calendar and offer to create/initialize it first.

### 4. Move Entry (Scheduled → Published)

Using the **relative key**:
- If the entry is in `scheduled_posts`, remove it.
- Add/update the entry in `published_posts` with:
  - `published_date`
  - `platform_post_id` (if provided)
  - `platform_url` (if provided)

**Already published**
- If the entry already exists in `published_posts`, report it and ask whether to update `published_date` / `platform_url`.

**Not found**
- If the entry is not found in either section, add it to `published_posts` (user-confirmed publish), and note that no scheduled entry was found.

### 5. Write and Confirm

Write the updated calendar via `workspace_write_operations`.
Confirm the update with a file reference and the published metadata recorded.

## Example Interaction

**User:** "Mark this post as published today: campaigns/summer-travel/.../text_travel-tips_rev1.md"

**Agent:**
```
✅ Marked published

Content: text_travel-tips_rev1.md
Published date: 2025-12-13

Calendar updated: [file:campaigns/summer-travel/calendar.yaml]
```

