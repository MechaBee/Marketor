# Calendar Manifest System

## Overview

The calendar manifest system provides a lightweight, file-based approach to scheduling and tracking social media posts across campaigns. It uses YAML files as a "text-based database" with minimal metadata, keeping detailed content information in the actual post files.

## Structure

```
/calendar/
  ├── master-calendar.yaml          # Workspace-level index of all campaigns
  ├── campaign-calendar-template.yaml  # Template for new campaign calendars
  └── README.md                     # This file

/campaigns/[campaign-name]/
  └── calendar.yaml                 # Campaign-specific scheduling manifest
```

## Design Principles

1. **File Path as Identifier**: Content files are identified by their workspace-relative paths, not synthetic IDs
2. **Minimal Metadata**: Calendar only stores scheduling/status data; content details live in post files
3. **Single Source of Truth**: Post content, hashtags, audience targeting, etc. are in the content files
4. **Text-Based Database**: YAML format enables version control and easy querying

## Master Calendar

**Location**: `/calendar/master-calendar.yaml`

**Purpose**: Workspace-level index of all campaign calendars

**Schema**:
```yaml
workspace_id: [workspace-name]
calendar_version: "1.0"
last_updated: "YYYY-MM-DD"

campaigns:
  - campaign_id: [campaign-folder-name]
    calendar_file: campaigns/[campaign-folder-name]/calendar.yaml
    status: active  # active | paused | archived
```

## Campaign Calendar

**Location**: `/campaigns/[campaign-name]/calendar.yaml`

**Purpose**: Campaign-specific post scheduling and publishing history

**Schema**:
```yaml
campaign_id: [campaign-folder-name]
status: active  # active | paused | completed

scheduled_posts:
  [content-file-path]:
    media_files: [list-of-media-paths]  # Optional
    platform: [facebook|instagram|google|linkedin]
    format: [platform-specific-format]
    scheduled_date: "YYYY-MM-DD"
    scheduled_time: "HH:MM"
    timezone: "[IANA-timezone]"
    status: [draft|scheduled|published|failed]

published_posts:
  [content-file-path]:
    published_date: "YYYY-MM-DDTHH:MM:SSZ"
    platform_post_id: "[platform-id]"
    platform_url: "[optional-url]"
```

## Field Definitions

### Scheduled Posts

- **Key (content-file-path)**: Workspace-relative path to the content markdown file
  - Example: `content-assets/social/meta/fb-link-post/text_travel-tips_rev1.md`
  
- **media_files**: (Optional) List of workspace-relative paths to associated media
  - Example: `["content-assets/social/meta/fb-link-post/media/image_travel-tips_rev1.png"]`
  
- **platform**: Target social media platform
  - Values: `facebook`, `instagram`, `google`, `linkedin`
  
- **format**: Platform-specific post format
  - Facebook: `fb-link-post`, `fb-text-post`, `fb-short-video`
  - Instagram: `ig-reel`, `ig-carousel`, `ig-story`, `ig-image-post`
  - Google: `g-search`, `g-display`, `g-pmax`, `g-discovery`
  
- **scheduled_date**: Publication date in YYYY-MM-DD format
  
- **scheduled_time**: Publication time in HH:MM (24-hour) format
  
- **timezone**: IANA timezone identifier (e.g., `Europe/Budapest`, `America/New_York`)
  
- **status**: Current state of the post
  - `draft`: Content created but not finalized
  - `scheduled`: Ready and queued for publication
  - `published`: Successfully published (moves to published_posts)
  - `failed`: Publication attempt failed

### Published Posts

- **Key (content-file-path)**: Same as scheduled posts
  
- **published_date**: Actual publication timestamp in ISO 8601 format
  - Example: `2025-10-20T10:00:00Z`
  
- **platform_post_id**: Platform-assigned unique identifier
  - Example: `fb_123456789`, `ig_ABC123XYZ`
  
- **platform_url**: (Optional) Direct link to the published post
  - Example: `https://facebook.com/posts/123456789`

## Usage Examples

### Creating a New Campaign Calendar

1. Copy the template:
   ```bash
   cp calendar/campaign-calendar-template.yaml campaigns/my-campaign/calendar.yaml
   ```

2. Update campaign_id:
   ```yaml
   campaign_id: my-campaign
   ```

3. Add to master calendar:
   ```yaml
   campaigns:
     - campaign_id: my-campaign
       calendar_file: campaigns/my-campaign/calendar.yaml
       status: active
   ```

### Scheduling a Post

```yaml
scheduled_posts:
  content-assets/social/meta/fb-link-post/text_summer-travel_rev1.md:
    media_files:
      - content-assets/social/meta/fb-link-post/media/image_summer-travel_rev1.png
    platform: facebook
    format: fb-link-post
    scheduled_date: "2025-11-15"
    scheduled_time: "10:00"
    timezone: "Europe/Budapest"
    status: scheduled
```

### Recording a Published Post

After publication, move the entry from `scheduled_posts` to `published_posts`:

```yaml
published_posts:
  content-assets/social/meta/fb-link-post/text_summer-travel_rev1.md:
    published_date: "2025-11-15T10:00:00Z"
    platform_post_id: "fb_987654321"
    platform_url: "https://facebook.com/yourbrand/posts/987654321"
```

## Query Patterns

### Get All Scheduled Posts for a Week

```python
week_posts = [
    (path, post) 
    for path, post in calendar['scheduled_posts'].items()
    if '2025-11-01' <= post['scheduled_date'] <= '2025-11-07'
]
```

### Get Platform-Specific Posts

```python
ig_posts = [
    (path, post)
    for path, post in calendar['scheduled_posts'].items()
    if post['platform'] == 'instagram'
]
```

### Get Posts by Status

```python
draft_posts = [
    (path, post)
    for path, post in calendar['scheduled_posts'].items()
    if post['status'] == 'draft'
]
```

## File Renaming

If you rename a content file, you must update the corresponding calendar entry:

**Before**:
```yaml
scheduled_posts:
  content-assets/social/meta/fb-link-post/text_old-name_rev1.md:
    ...
```

**After**:
```yaml
scheduled_posts:
  content-assets/social/meta/fb-link-post/text_new-name_rev1.md:
    ...
```

## Best Practices

1. **Keep calendars in sync**: When creating new content, add it to the calendar immediately
2. **Use consistent timezones**: Stick to one timezone per workspace (e.g., Europe/Budapest)
3. **Archive completed campaigns**: Move finished campaigns to `archived-campaigns/` and update master calendar status
4. **Version control**: Commit calendar changes alongside content changes
5. **Validate dates**: Ensure scheduled_date is in the future and properly formatted
6. **Clean up published posts**: Periodically archive old published_posts entries to keep calendars manageable

## Integration with Content Files

Content files should include metadata that complements the calendar:

```markdown
# Facebook Post: Summer Travel Tips

**Metadata:**
Platform: Facebook
Format: fb-link-post
Campaign: summer-travel-campaign
Target Audience: young-travelers, budget-conscious
Hashtags: #SummerTravel #TravelTips #YourBrand

**Post Text:**
☀️ Planning your summer getaway? Here are 5 essential travel tips...
```

The calendar references the file, but detailed content metadata stays in the file itself.

## Future Enhancements

- **Validation tools**: Scripts to validate calendar schema and file references
- **Migration tools**: Automated tools for moving posts between scheduled/published
- **Query API**: Programmatic interface for calendar queries
- **Calendar views**: Generate daily/weekly/monthly calendar visualizations
- **Analytics integration**: Link published posts to engagement metrics
