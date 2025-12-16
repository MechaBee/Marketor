# Capability: Schedule Post

## When to Use

User wants to add a single content post to the campaign calendar with specific date/time.

**Trigger patterns:**
- "schedule post for [date]"
- "add to calendar"
- "plan post for [date/time]"

**Don't use when:**
- User wants to schedule MULTIPLE posts interactively (use `review_drafts`)
- User wants to VIEW scheduled posts (use `list_posts`)

## Required Parameters

- **content_file_path**: Workspace path to content .md file
- **platform**: facebook | instagram | google | linkedin
- **format**: Platform-specific format (see manifest validation_rules)
- **scheduled_date**: YYYY-MM-DD (must be future date)
- **scheduled_time**: HH:MM in 24-hour format

## Optional Parameters

- **timezone**: IANA identifier (default: Europe/Budapest)
- **media_files**: Array of workspace paths to images/videos

## High-Level Process

### 1. Validate Files

Check content file exists. If media_files provided, verify each exists.
If any missing, report which files and ask for correction.

### 2. Extract Campaign and Calendar Path

Parse campaign/calendar identifier from content_file_path:

**For Campaign Content:**
```
campaigns/[campaign-name]/content-assets/... → campaign-name
Calendar path: campaigns/[campaign-name]/calendar.yaml
Relative path: content-assets/...
```

**For Regular-Social Content:**
```
regular-social/[month-folder]/[platform]/[format]/... → regular-social
Calendar path: regular-social/calendar.yaml
Relative path: [month-folder]/[platform]/[format]/...
Month folder: Extract from path (e.g., "2025-M11", "evergreen")
```

**Error Handling:**
If path doesn't match either pattern, report error with examples of valid paths.

### 3. Ensure Master Calendar Registration

For workspace consistency (and so `list_posts`/`validate_schedule` can discover calendars), ensure the calendar being updated is registered in `/calendar/master-calendar.yaml`.

- Ensure `/calendar/master-calendar.yaml` exists
  - If missing: copy `/_meta/skills/content-scheduling/templates/master-calendar-template.yaml` to `/calendar/master-calendar.yaml`
  - Replace `last_updated: "[CURRENT_DATE]"` with today's date (YYYY-MM-DD)
- Ensure an entry exists in master calendar:
  - **Campaign content** (`campaigns/[campaign-name]/...`):
    - `campaign_id: [campaign-name]`
    - `calendar_file: campaigns/[campaign-name]/calendar.yaml`
    - `type: campaign`
  - **Regular-social content** (`regular-social/...`):
    - `campaign_id: regular-social`
    - `calendar_file: regular-social/calendar.yaml`
    - `type: regular`
- If entry is missing: add it and update master `last_updated`
- If entry exists but `calendar_file` differs: warn and ask user whether to update master calendar

### 4. Read Calendar

Read campaign calendar. If doesn't exist, offer to create from template.
Initialize from `/_meta/skills/content-scheduling/templates/campaign-calendar-template.yaml`.

### 5. Validate Parameters

- Platform/format: Check against manifest validation_rules
- Date: Must be YYYY-MM-DD format and future date
- Time: Must be HH:MM format (00:00-23:59)

Report specific validation errors with correct format examples.

### 6. Check Conflicts

**Already scheduled:**
If content_file_path exists in scheduled_posts, show current schedule and ask: reschedule, cancel, or keep existing?

**Time conflict:**
If another post scheduled at same date/time/platform, warn user and suggest alternatives (±1-2 hours, next day). Let user decide.

### 7. Add to Calendar

Create entry in scheduled_posts section using **relative path**:

**For Campaign Content:**
```yaml
scheduled_posts:
  content-assets/social/meta/fb-link-post/text_example_rev1.md:  # relative to campaign
    platform: [platform]
    format: [format]
    scheduled_date: [date]
    scheduled_time: [time]
    timezone: [timezone]
    status: scheduled
    media_files: [array]  # if provided
```

**For Regular-Social Content:**
```yaml
scheduled_posts:
  [YYYY]-M[##]/fb-link-post/text_home-winter_rev1.md:  # relative to regular-social/
    platform: [platform]
    format: [format]
    scheduled_date: [date]
    scheduled_time: [time]
    timezone: [timezone]
    status: scheduled
    media_files: [array]  # if provided
    month_folder: [YYYY]-M[##]  # IMPORTANT: Include for regular-social content
```

**Note**: Always use relative paths in calendar files, not absolute workspace paths.

### 8. Write and Confirm

Write updated calendar using workspace_write_operations.
Confirm success with file reference and suggest next steps.

## Key Behaviors

**Intelligent File Finding:**
If user provides topic/description instead of exact path, search workspace for matching content files. If multiple found, list options.

**Conflict Handling:**
Always check for conflicts. Warn but let user decide. Suggest alternative times based on platform spacing rules.

**Calendar Creation:**
If campaign calendar missing, offer to create from template rather than failing.

**Helpful Validation:**
When validation fails, explain what's wrong AND show correct format with examples.

**Status Assignment:**
Always set status to "scheduled" when adding new entry.

## Example Interactions

### Example 1: Schedule Campaign Post

**User:** "Schedule the travel insurance post for November 15th at 10 AM on Facebook"

**Agent:**
```
[Searches for travel insurance content]
[Finds: campaigns/travel-campaign/content-assets/social/meta/fb-link-post/text_travel-insurance_rev1.md]
[Detects: campaign = "travel-campaign"]
[Validates: no conflicts]
[Schedules]

✅ Scheduled successfully!

Content: text_travel-insurance_rev1.md
Platform: Facebook (fb-link-post)
Scheduled: Nov 15, 2025 at 10:00 Europe/Budapest

Calendar: [file:campaigns/travel-campaign/calendar.yaml]

Next: "validate calendar" or "show scheduled posts"
```

### Example 2: Schedule Regular-Social Post

**User:** "Schedule the November home insurance post for December 10th at 9 AM on Facebook"

**Agent:**
```
[Searches for content in regular-social/[YYYY]-M[##]/]
[Finds: regular-social/[YYYY]-M[##]/fb-link-post/text_home-winter_rev1.md]
[Detects: calendar = "regular-social", month_folder = "[YYYY]-M[##]"]
[Validates: no conflicts]
[Schedules with month_folder metadata]

✅ Scheduled successfully!

Content: text_home-winter_rev1.md
Month Folder: [YYYY]-M[##]
Platform: Facebook (fb-link-post)
Scheduled: Dec 10, YYYY at 09:00 Europe/Budapest

Calendar: [file:regular-social/calendar.yaml]

Next: "validate calendar" or "show scheduled posts for regular-social"
```

See `resources/schedule-post-examples.md` for detailed examples including conflicts, media files, and error scenarios.

## Error Handling

**Content file not found:**
Ask user to verify path, offer to search workspace, or list campaign content

**Media file not found:**
List which media files are missing, ask user to verify paths

**Invalid platform/format:**
Show supported platforms and formats for that platform from manifest

**Invalid date format:**
Explain YYYY-MM-DD format with examples

**Past date:**
Report current date, ask for future date

**Invalid time format:**
Explain HH:MM 24-hour format with examples

**Already scheduled:**
Show current schedule, offer: reschedule, cancel existing, or keep

**Time conflict:**
Show conflicting post, suggest alternatives, let user decide

**Calendar not found:**
Offer to create calendar from template

## Integration Points

**With content files:** Content must exist before scheduling

**With master calendar:** Ensure calendar is registered; add missing entry if needed

**After scheduling:** Suggest `list_posts` to review or `validate_schedule` to check integrity

**With `review_drafts`:** For bulk scheduling, use that capability instead

## File References

**Validation rules:** `/_meta/skills/content-scheduling/skill-manifest.yaml`
**Detailed examples:** `/_meta/skills/content-scheduling/resources/schedule-post-examples.md`
**Calendar template:** `templates/campaign-calendar-template.yaml`
