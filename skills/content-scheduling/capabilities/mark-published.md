# Capability: Mark Published / Mark Failed

Record that user manually published a post (or that publishing failed). This is for record-keeping only.

## Parameters

**mark_published:**
- **content_file_path** (required): Path to content file
- **published_date** (required): YYYY-MM-DD or ISO 8601
- **platform_post_id** (optional): Platform-assigned ID
- **platform_url** (optional): Link to published post

**mark_failed:**
- **content_file_path** (required): Path to content file
- **failure_reason** (optional): Why publishing failed

## Process

1. **Validate** content file exists
2. **Detect calendar** from path (campaign vs regular-social)
3. **Find entry** in posts array by content_file
4. **Update status and metadata**:
   - `scheduled` → `published`: Add published_date, platform_post_id, platform_url
   - `scheduled` → `failed`: Add failure_reason
   - `failed` → `published`: Retry succeeded
   - Not found → Add new entry (untracked publish)
5. **Confirm** with file reference

## Status Transitions

| From | To Published | To Failed |
|------|--------------|-----------|
| scheduled | Add publish metadata | Add failure_reason |
| draft | Warn, allow | Warn |
| published | Ask to update | Cannot |
| failed | Retry succeeded | Update reason |

## Examples

**User:** "I published the travel tips post. Link: https://facebook.com/posts/123"

**Agent:**
```
Marked as published!
Content: text_travel-tips_rev1.md
Published: 2025-11-15T10:05:00Z
URL: https://facebook.com/posts/123
Calendar: [file:campaigns/summer-travel/calendar.yaml]
```

---

**User:** "The Instagram reel failed - video too long"

**Agent:**
```
Marked as failed.
Content: text_travel-reel_rev1.md
Reason: Video too long

Would you like to reschedule or edit content?
```
