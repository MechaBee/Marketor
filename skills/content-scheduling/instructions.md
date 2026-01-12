# Content Scheduling Skill

Manage content scheduling and calendar maintenance across campaigns and regular-social content.

**IMPORTANT: Manual Publishing Only**The agent does NOT publish directly to external platforms (Facebook, Instagram, LinkedIn, Google Ads). All status changes are for record-keeping only. Users publish manually on each platform, then report back to update the calendar.

## Which Capability?

| Goal | Capability | Example |
|------|-----------|---------||
| Add posts to calendar | `schedule_post` | "Schedule post for Nov 15th" |
| View posts | `list_posts` | "Show next week's schedule" |
| Find unscheduled content | `review_drafts` | "What's ready to schedule?" |
| Record publish result | `mark_published` | "I published the post" |
| Record publish failure | `mark_failed` | "The post failed to publish" |
| Check for errors | `validate_schedule` | "Validate calendar" |
| Create campaign calendar | `initialize_calendar` | "Set up new calendar" |

## Calendar Structure

**Master Calendar**: `/calendar/master-calendar.yaml`

* Workspace index of all campaign calendars AND regular-social calendar
* Tracks campaign status (active, paused, completed)
* Regular-social calendar registered with `type: regular`

**Campaign Calendars**: `campaigns/[campaign]/calendar.yaml`

* Single `posts` array containing all post entries
* Each entry has `status` field tracking lifecycle
* Stores only scheduling metadata (dates, times, status)
* File paths relative to campaign folder

**Regular-Social Calendar**: `regular-social/calendar.yaml`

* Same structure as campaign calendars
* Manages non-campaign recurring social content
* File paths relative to `/regular-social/` folder
* Content organized by month folders (2025-M11, 2025-M12) and `evergreen/`
* Includes `month_folder` field for time-based filtering

## Calendar Entry Format

All posts are stored in a single `posts` array:

```yaml
campaign_id: my-campaign
status: active

posts:
  - content_file: content-assets/social/facebook/fb-link-post/text_example_rev1.md
    media_files:
      - media/image_example_rev1.png
    platform: facebook
    format: fb-link-post
    scheduled_date: "2025-11-15" # use this attribute name for all states
    scheduled_time: "10:00" # use this attribute name for all states
    timezone: "Europe/Budapest"
    status: scheduled  # draft | scheduled | published | failed

    # Added when status becomes 'published':
    # scheduled_date: "2025-11-15T10:05:00Z"
    # scheduled_time: "10:00"
    # platform_post_id: "fb_123456789"
    # platform_url: "https://facebook.com/..."
    # status: published

    # Added when status becomes 'failed':
    # failure_reason: "Image dimensions not supported"
```

## Post Lifecycle

```
draft → scheduled → published
           ↓
        failed (can retry → scheduled)
```

* **draft**: Content ready, not yet scheduled for publishing
* **scheduled**: Ready for user to publish manually on platform
* **published**: User reported successful publish (with metadata)
* **failed**: User reported publishing failed (with reason)

## Manual Publishing Workflow

1. **Schedule post**: Agent adds entry to calendar with `status: scheduled`
2. **Publish manually**: User publishes on platform (Facebook, Instagram, etc.)
3. **Report result**: User tells agent the outcome

   * Success: "I published the Facebook post" → `mark_published`
   * Failure: "The post failed - image too large" → `mark_failed`
4. **Agent updates**: Status and metadata updated for record-keeping

## Key Principles

**File paths as identifiers**: No synthetic IDs, use workspace paths
**`content_file` as attribute**: Path is stored as a value, not as a dictionary key

```yaml
# Correct (new format):
posts:
  - content_file: content-assets/social/facebook/fb-link-post/text_example_rev1.md
    platform: facebook
    ...

# Old format (deprecated):
# scheduled_posts:
#   content-assets/social/facebook/fb-link-post/text_example_rev1.md:
#     platform: facebook
```

**Path context detection**: Skill automatically detects calendar type from file path

* Paths starting with `campaigns/[name]/` → campaign calendar
* Paths starting with `regular-social/` → regular-social calendar

## Validation Rules

See `skill-manifest.yaml` for complete rules:

* **Date format**: YYYY-MM-DD
* **Time format**: HH:MM (24-hour)
* **Default timezone**: Europe/Budapest
* **Platforms**: facebook, instagram, google, linkedin
* **Statuses**: draft, scheduled, published, failed
* **Formats**: See manifest → validation\_rules.supported\_formats

## Common Workflows

### Weekly Planning

```
list_posts (next week) → identify gaps →
review_drafts → schedule_post → validate_schedule
```

### Campaign Launch

```
initialize_calendar → schedule_post (bulk) →
list_posts (verify) → validate_schedule
```

### Daily Publishing (Manual)

```
list_posts (today) → manually publish on platform →
mark_published (report to agent) → verify status updated
```

### Failed Publishing

```
list_posts (today) → attempt publish on platform → fails →
mark_failed (report reason) → reschedule or fix content
```

## Integration Patterns

* **After scheduling**: Use `list_posts` to verify
* **Before publishing**: Use `list_posts` to see what's ready
* **After manual publish**: Use `mark_published` to record
* **When publish fails**: Use `mark_failed` to record reason
* **After validation**: Use `schedule_post` to fix conflicts
* **When finding content**: Use `review_drafts` then `schedule_post`

## Platform Timing Quick Reference

| Platform   | Best Times    | Min Spacing | Best Days |
| ---------- | ------------- | ----------- | --------- |
| Facebook   | 9-11, 13-15   | 4 hours     | Wed-Fri   |
| Instagram  | 11-13, 19-21  | 6 hours     | Tue-Thu   |
| LinkedIn   | 8-10, 12-13   | 8 hours     | Tue-Thu   |
| Google Ads | 9-10 (launch) | 24 hours    | Mon-Thu   |

## Error Handling Patterns

Standard responses for common errors (capabilities should follow these patterns):

| Error             | Response Pattern                                     |
| ----------------- | ---------------------------------------------------- |
| File not found    | List similar files, offer to search workspace        |
| Calendar missing  | Offer to create from template                        |
| Invalid format    | Show valid options from manifest                     |
| Date conflict     | Show conflict, suggest alternatives, let user decide |
| Past date         | Show current date, ask for future date               |
| Already scheduled | Show existing entry, offer: reschedule/cancel/keep   |

## Tools Used

* `workspace_read_operations` - Read calendars, verify files
* `workspace_write_operations` - Update calendars

## File Structure

```
calendar/
  master-calendar.yaml
campaigns/
  [campaign]/
    calendar.yaml
    content-assets/social/[platform]/[format]/
      text_[name]_rev[n].md
      media/[files]
regular-social/
  calendar.yaml
  2025-M11/[platform]/[format]/
    text_[name]_rev[n].md
    media/[files]
  2025-M12/[platform]/[format]/
  evergreen/[platform]/[format]/
```

## See Also

Detailed capability instructions in `capabilities/` directory.
Detailed examples in `resources/` directory.
Regular-social setup: `/_meta/skills/brand-onboarding/capabilities/scaffold-regular-social.md`
