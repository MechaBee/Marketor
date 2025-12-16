# Capability: Review Drafts

## When to Use

User wants to discover and schedule unscheduled content in a campaign through an interactive, guided process.

**Trigger patterns:**
- "schedule posts"
- "what's unscheduled"
- "ready to schedule"
- "schedule campaign content"
- "review unscheduled"

**Don't use when:**
- User wants to schedule ONE specific post (use `schedule_post`)
- User wants to VIEW scheduled posts (use `list_posts`)

## Parameters

- **campaign_id** (optional): Campaign or calendar to review
  - If omitted: Use conversation context or ask user
  - Can be campaign name OR "regular-social"
  - Keeps scope manageable (workspace-wide can be overwhelming)

## High-Level Process

### 1. Determine Campaign Scope

If campaign_id not provided, check conversation context or ask user to specify.
Verify campaign exists.

### 2. Discover Unscheduled Content

**For Campaign Content:**
- List all content files: `campaigns/[campaign]/content-assets/**/*.md`
- Read calendar: `campaigns/[campaign]/calendar.yaml`
- Filter: content_files - scheduled_posts - published_posts

**For Regular-Social Content (campaign_id = "regular-social"):**
- List content in month folders: `regular-social/*/` (e.g., 2025-M11, 2025-M12)
- List content in evergreen: `regular-social/evergreen/`
- Glob patterns: `regular-social/2025-M##/**/text_*.md` and `regular-social/evergreen/**/text_*.md`
- Read calendar: `regular-social/calendar.yaml`
- Filter: content_files - scheduled_posts - published_posts

**If empty:** Report all content scheduled, offer alternatives

### 3. Present Content and Options

Show unscheduled content with:
- File name, platform, format, creation date, media files
- **For regular-social**: Include month folder (2025-M11, evergreen)
- Summary by platform (and month folder if regular-social)

**Grouping Strategy:**
- **Campaign content**: Group by platform/format
- **Regular-social content**: Group by month folder FIRST, then platform
  - Example: November (2025-M11): 3 posts, December (2025-M12): 2 posts, Evergreen: 5 posts

Offer scheduling approaches:
- **A)** Suggest optimal schedule (auto-assign dates/times)
- **B)** Manual one-by-one (user chooses each date/time)
- **C)** Show current calendar first
- **D)** Select specific posts only

### 4. Execute User Choice

**Option A - Suggested Schedule:**
- Read current calendar to avoid conflicts
- For each post, assign optimal date/time based on platform best practices
- Apply spacing rules, avoid clustering
- Present full schedule with rationale
- Get approval before scheduling

**Option B - Manual Scheduling:**
- For each post, present file details
- Suggest 3 optimal times with reasoning
- Accept user input: suggestion number, custom date/time, skip, or stop
- Validate and schedule each post
- Continue until all processed

### 5. Execute Scheduling

Use `schedule_post` capability for each approved post.
Handle errors gracefully, ask how to proceed.

### 6. Validate and Report

- Run `validate_schedule`
- Summarize: count, date range, platform breakdown
- Show calendar file reference
- Suggest next actions

## Platform Best Practices

See `resources/scheduling-best-practices.md` for detailed timing guidelines.

**Quick reference:**

| Platform | Optimal Times | Min Spacing | Posts/Day |
|----------|--------------|-------------|-----------|
| Facebook | 9-11am, 1-3pm weekdays | 4 hours | 1-2 max |
| Instagram | 11am-1pm, 7-9pm weekdays | 6 hours | 1 (stories: unlimited) |
| Google | 8-10am business hours | 24 hours | Varies by type |
| LinkedIn | 8-10am, 12-1pm, 5-6pm weekdays | 8 hours | 1 per day |

**General principles:**
- Space posts 2-3 days apart (same platform)
- Spread across week, avoid clustering
- Adjust for audience timezone (default: Europe/Budapest)

## Key Behaviors

**Intelligent Suggestions:**
Apply platform-specific optimal times, content-type preferences (e.g., reels in evening), and spacing rules.

**Conflict Detection:**
Check existing calendar, warn about conflicts, suggest alternatives, but let user decide.

**Conversational Flow:**
Guide users step-by-step, explain reasoning, provide context for suggestions, accept flexible input formats.

**Error Recovery:**
If scheduling fails, report error, offer alternatives (skip, retry different time, cancel), continue with remaining posts.

**Already Scheduled Warning:**
If content already scheduled, show current schedule and offer: keep, reschedule, or cancel.

## Example Session (Abbreviated)

**User:** "Schedule the summer-travel posts"

**Agent:** 
```
Found 5 unscheduled posts:
1. text_travel-tips_rev1.md (Facebook, fb-link-post, +media)
2. text_travel-insurance_rev1.md (Instagram, ig-reel, +video)
[...]

Would you like me to:
A) Suggest optimal schedule
B) Schedule one-by-one
C) Show current calendar first
```

**User:** "A"

**Agent:**
```
Suggested Schedule:
1. Nov 1 at 10:00 - travel-tips (Facebook)
   Reason: Friday morning optimal for weekend planning
2. Nov 2 at 20:00 - travel-insurance (Instagram Reel)
   Reason: Saturday evening peak for reels
[...]

Shall I schedule these?
```

**User:** "Yes"

**Agent:** Schedules all posts, validates, reports summary.

Full examples in `resources/review-drafts-examples.md`

## Error Handling

**Campaign not found:** List available campaigns, ask user to choose

**No unscheduled content:** Report all scheduled, offer to review schedule or create new content

**Calendar missing:** Offer to create calendar and schedule posts

**Scheduling conflict:** Warn, show conflict details, suggest alternatives, let user decide

**Invalid date/time input:** Explain valid formats, ask again

## Integration Points

**With `schedule_post`:** Uses it to execute each scheduling decision

**With `list_posts`:** Can show current schedule before suggesting new one

**With `validate_schedule`:** Always validates after bulk scheduling

**After content creation:** Natural follow-up to schedule newly created content

## File References

**Platform timing details:** `/_meta/skills/content-scheduling/resources/scheduling-best-practices.md`
**Detailed examples:** `/_meta/skills/content-scheduling/resources/review-drafts-examples.md`
**Validation rules:** `/_meta/skills/content-scheduling/skill-manifest.yaml`
