# Content Scheduling Skill

Manage content scheduling, publishing tracking, and calendar maintenance across campaigns and regular-social content.

## Which Capability?

| Goal | Capability | Example |
|------|-----------|---------||
| Add posts to calendar | `schedule_post` | "Schedule post for Nov 15th" |
| View scheduled posts | `list_posts` | "Show next week's schedule" |
| Find unscheduled content | `review_drafts` | "What's ready to schedule?" |
| Mark as published | `mark_published` | "Mark post as published" |
| Check for errors | `validate_schedule` | "Validate calendar" |
| Create campaign calendar | `initialize_calendar` | "Set up new calendar" |

## Calendar Structure

**Master Calendar**: `/calendar/master-calendar.yaml`
- Workspace index of all campaign calendars AND regular-social calendar
- Tracks campaign status (active, paused, completed)
- Regular-social calendar registered with `type: regular`

**Example master calendar structure:**
```yaml
calendar_version: "1.0"
last_updated: "2025-12-17"

campaigns:
  # Standard campaign calendar
  - campaign_id: my-campaign
    calendar_file: campaigns/my-campaign/calendar.yaml
    status: active
    type: campaign
    description: Campaign description
    created: 2025-12-01
  
  # Regular social content (non-campaign)
  - campaign_id: regular-social
    calendar_file: regular-social/calendar.yaml
    status: active
    type: regular
    description: Regular social media content organized by month folders
    created: 2025-12-17
```

**Campaign Calendars**: `campaigns/[campaign]/calendar.yaml`
- Sections: `scheduled_posts` and `published_posts`
- Stores only scheduling metadata (dates, times, status)
- Content details live in content files themselves
- File paths relative to campaign folder

**Regular-Social Calendar**: `regular-social/calendar.yaml`
- Same structure as campaign calendars (scheduled_posts, published_posts)
- Manages non-campaign recurring social content
- File paths relative to `/regular-social/` folder
- Content organized by month folders (2025-M11, 2025-M12) and `evergreen/`
- Includes `month_folder` field for time-based filtering

## Post Lifecycle
```
draft → scheduled → published
           ↓
        failed
```

## Key Principles

**File paths as identifiers**: No synthetic IDs, use workspace paths
```
campaigns/summer-travel/content-assets/social/meta/fb-link-post/text_travel-tips_rev1.md
regular-social/2025-M11/fb-link-post/text_home-winter_rev1.md
```

**Path context detection**: Skill automatically detects calendar type from file path
- Paths starting with `campaigns/[name]/` → campaign calendar
- Paths starting with `regular-social/` → regular-social calendar

**Minimal metadata**: Calendars = scheduling info only. Content files = actual content.

## Validation Rules

See `skill-manifest.yaml` for complete rules:

- **Date format**: YYYY-MM-DD
- **Time format**: HH:MM (24-hour)
- **Default timezone**: Europe/Budapest
- **Platforms**: facebook, instagram, google, linkedin
- **Statuses**: draft, scheduled, published, failed
- **Formats**: See manifest → validation_rules.supported_formats

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

### Daily Publishing
```
list_posts (today) → publish to platform →
mark_published → verify moved to history
```

## Integration Patterns

- **After scheduling**: Use `list_posts` to verify
- **Before publishing**: Use `list_posts` to identify ready posts
- **After validation**: Use `schedule_post` to fix conflicts
- **When finding content**: Use `review_drafts` then `schedule_post`

## Best Practices

1. Validate after bulk operations
2. Use consistent timezone (Europe/Budapest)
3. Verify file paths exist before scheduling
4. Space posts to avoid conflicts
5. Update calendars when files are renamed/moved

## Tools Used

- `workspace_read_operations` - Read calendars, verify files
- `workspace_write_operations` - Update calendars

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

## Regular-Social Calendar Integration

The regular-social calendar is created and managed by the **brand-onboarding** skill:

**Setup**: Use `scaffold_regular_social` capability to create:
- `/regular-social/` folder structure with month folders
- `calendar.yaml` with proper structure
- Registration in master calendar with `type: regular`

**Scheduling**: Use content-scheduling skill capabilities (this skill):
- `schedule_post` - Schedule posts in regular-social calendar (auto-detects from path)
- `review_drafts` - Find unscheduled regular content in month folders
- `list_posts` - View scheduled regular posts (filter by month_folder)
- `validate_schedule` - Validate regular-social calendar structure
- `mark_published` - Mark regular posts as published

**Content Organization**: Regular-social follows month-based structure:
- Time-bound content: `/regular-social/2025-M11/`, `/regular-social/2025-M12/`, etc.
- Timeless content: `/regular-social/evergreen/`
- Platform-specific folders created on-demand (same as campaigns)
- Same file naming conventions: `text_*.md`, `image_*.png`, etc.

## Common Patterns

### Schedule Regular Social Post
```
User: "Schedule the November Facebook post about home insurance"
Agent:
1. Search: regular-social/2025-M11/fb-link-post/*.md
2. Detect: campaign_id = "regular-social" (from path)
3. Load: regular-social/calendar.yaml
4. Ask: date, time
5. Add entry with relative path: 2025-M11/fb-link-post/text_home-winter_rev1.md
6. Include: month_folder = "2025-M11" metadata
```

### Review All Unscheduled Content (Mixed)
```
User: "What content is ready to schedule?"
Agent:
1. Ask: campaigns only, regular-social only, or both?
2. If both:
   - Run review_drafts for each active campaign
   - Run review_drafts for campaign_id: "regular-social"
   - Present organized: campaigns first, then regular-social by month
3. Guide interactive scheduling
```

### List Scheduled Posts (All Calendars)
```
User: "Show me what's scheduled for next week"
Agent:
1. Read master calendar
2. Load all calendars (campaigns + regular-social)
3. Extract scheduled posts from all
4. Filter by date range (next week)
5. Display grouped by date and calendar type
```

## See Also

Detailed capability instructions in `capabilities/` directory.
Detailed examples in `resources/` directory.
Regular-social setup: `/_meta/skills/brand-onboarding/capabilities/scaffold-regular-social.md`
