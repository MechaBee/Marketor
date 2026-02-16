# Capability: Schedule Post

Add a single content post to the campaign calendar with specific date/time.

For bulk scheduling, use `review_drafts` instead.

## Parameters

**Required:**

* content_file_path
* platform
* format
* scheduled_date (YYYY-MM-DD) (use this attribute name for all post states )
* scheduled_time (HH:MM) (use this attribute name for all post states)
* timezone (default: Europe/Budapest)
* media_files[]

See manifest for validation rules.

## Process

1. **Validate files exist** - content file and any media\_files
2. **Detect calendar type** from path:

   * `campaigns/[name]/...` → campaign calendar at `campaigns/[name]/calendar.yaml`
   * `regular-social/...` → regular-social calendar, include `month_folder` field
3. **Ensure master calendar registration** - check `calendar/master-calendar.yaml` add entry if missing
4. **Read calendar** - create from template if missing
5. **Check conflicts**:

   * Same content_file already scheduled → offer reschedule/cancel/keep
   * Same date/time/platform → warn, suggest alternatives
6. **Add to posts array** with `status: scheduled`
7. **Confirm** with file reference and next steps

## Key Behaviors

* If user gives topic instead of path, search workspace and list matches
* Always use relative paths in calendar entries
* Set `month_folder` for regular-social content (e.g., "2025-M11", "evergreen")
* Suggest `list_posts` or `validate_schedule` after success

## Example

**User:** "Schedule the travel insurance post for November 15th at 10 AM on Facebook"

**Example campaign calendar entry**
```yaml
posts:
 - content_file: content-assets/social/facebook/fb-link-post/text_example_rev1.md
   media_files:
      - media/image_example_rev1.png
   platform: facebook
   format: fb-link-post
   scheduled_date: "2025-11-15"
   scheduled_time: "18:00"
   timezone: "Europe/Budapest"
   status: published
# ...other entries
```
Notes: 
- a single `posts` array for all posts regardless of the status
- regadless of status we have `scheduled_date` and `scheduled_time` fields where both are required, and neither is a full datetime field
- 

**Mater calendar template**
Check this to see the required master calendar format:
`_meta/skills/content-scheduling/templates/master-calendar-template.yaml`

**Response:**

```
Scheduled successfully!

Content: text_travel-insurance_rev1.md
Platform: Facebook (fb-link-post)
Scheduled: Nov 15, 2025 at 10:00 Europe/Budapest

Calendar: [file:campaigns/travel-campaign/calendar.yaml]

Manual publishing required. After posting on Facebook, use mark_published.
```


See `
See `resources/schedule-post-examples.md` for conflict handling and edge cases.
