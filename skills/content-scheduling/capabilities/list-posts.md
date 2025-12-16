# Capability: List Posts

## When to Use

User wants to view, query, or review scheduled posts from campaign calendars.

**Trigger patterns:**
- "show scheduled posts"
- "what's scheduled for [date/platform/campaign]"
- "list calendar"
- "upcoming posts"
- "what are we posting next week"

**Don't use when:**
- User wants to ADD posts (use `schedule_post`)
- User wants to find UNSCHEDULED content (use `review_drafts`)
- User wants to validate calendars (use `validate_schedule`)

## Parameters

All parameters are optional (see skill manifest for validation rules):

- **date_range**: Filter by date
  - Natural language: "next week", "this month", "today"
  - Single date: "2025-11-15"
  - Range: "2025-11-01 to 2025-11-07"

- **platform**: Filter by social platform
  - Values from manifest: facebook, instagram, google, linkedin

- **campaign_id**: Filter by campaign folder name OR "regular-social"
  - Campaign examples: "summer-travel", "home-insurance"
  - Regular-social: "regular-social"

- **status**: Filter by post status
  - Values from manifest: draft, scheduled, published, failed

- **month_folder**: Filter regular-social posts by month (only applies to campaign_id="regular-social")
  - Examples: "2025-M11", "2025-M12", "evergreen"
  - Format: YYYY-M## or "evergreen"

## High-Level Process

### 1. Parse and Validate Filters

Validate user inputs against manifest rules:
- Parse date_range (handle natural language)
- Check platform exists in manifest validation_rules
- Verify campaign_id folder exists in workspace
- Validate status against manifest allowed values

If validation fails, explain the issue and show valid options from the manifest.

### 2. Determine Calendar Scope

**If campaign_id provided:**
- **For campaigns**: Read `campaigns/[campaign_id]/calendar.yaml`
- **For regular-social**: Read `regular-social/calendar.yaml`
- Verify it exists

**If campaign_id NOT provided:**
- Read master calendar: `/calendar/master-calendar.yaml`
- Extract all calendar paths (campaigns + regular-social)
- Read all calendars

Handle missing calendars gracefully - report which calendars couldn't be read but continue with successful ones.

### 3. Extract and Filter Posts

From each calendar:
- Extract `scheduled_posts` section (or `published_posts` if status filter includes "published")
- Build post entries with: campaign_id, content_file_path, platform, format, scheduled_date, scheduled_time, status, media_files
- **For regular-social**: Also extract `month_folder` field
- Apply filters: date_range, platform, campaign_id, status
- **If month_folder filter provided**: Only include regular-social posts matching month_folder
- Sort chronologically: date (asc) → time (asc) → campaign (alpha)

### 4. Format Output Intelligently

Adapt grouping to query context:

**Multi-day date range** → Group by date
**Single campaign query** → Group by platform
**Single platform query** → Group by campaign
**Default** → Group by date

Include in output:
- Summary statistics (total, by platform, by status)
- File references using `[file:path]` format
- Date range covered
- Next action suggestions
- Calendar file references

## Key Behaviors

### Intelligent Empty Results

When no posts match filters:
- Explain what filters were applied
- Show what IS available (e.g., "No Instagram posts in November, but 5 in December")
- Suggest broadening criteria
- Offer to show related data

### Error Handling Principles

**Invalid date format:**
Explain valid formats (reference manifest), ask for clarification

**Unknown platform:**
Show supported platforms from manifest validation_rules

**Campaign not found:**
List available campaigns, suggest closest matches

**Calendar read errors:**
Report which calendars failed, continue with successful reads, offer to investigate

### Output Quality

Always include:
- Clear summary statistics
- Proper file references for navigation
- Context about date ranges and filters applied
- Actionable next steps
- Visual separators for readability

Use emojis sparingly for visual hierarchy:
- 📅 for dates
- 📱 for platforms
- 📁 for campaigns
- ✅/⚠️ for status indicators

## Example Queries

**"Show me all scheduled posts"**
→ No filters, read all campaigns, group by date chronologically

**"What's scheduled for next week?"**
→ Parse "next week" to date range, filter dates, group by date

**"Instagram posts for summer-travel"**
→ Filter campaign=summer-travel AND platform=instagram, group by format

**"What's ready to publish today?"**
→ Filter scheduled_date=today AND status=scheduled, show with urgency

**"Show me failed posts"**
→ Filter status=failed, group by campaign, highlight for attention

## Integration Points

**After `schedule_post`:**
List posts to verify new scheduling, check for conflicts

**Before `mark_published`:**
List scheduled posts to identify what's ready for publication

**With `validate_schedule`:**
After validation, review posts flagged with issues

**With `review_drafts`:**
Compare scheduled vs unscheduled to identify gaps

## File References

**For context and workflows:**
See `/_meta/skills/content-scheduling/instructions.md` for calendar hierarchy, post lifecycle, and cross-capability workflows

**For validation rules:**
See `/_meta/skills/content-scheduling/skill-manifest.yaml` validation_rules section for supported platforms, formats, date formats, and status values

**For detailed examples:**
See `/_meta/skills/content-scheduling/resources/list-posts-examples.md` for complete output format examples and edge cases
