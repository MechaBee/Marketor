# Capability: List Posts

Query and list scheduled posts with optional filtering.

## Parameters

All optional (see manifest for validation):

- **date_range**: "next week", "today", "2025-11-01 to 2025-11-07"
- **platform**: facebook, instagram, google, linkedin
- **campaign_id**: campaign folder name or "regular-social"
- **status**: draft, scheduled, published, failed
- **month_folder**: For regular-social filtering ("2025-M11", "evergreen")

## Process

1. **Parse filters** - validate against manifest, handle natural language dates
2. **Determine scope**:
   - If campaign_id provided → read that calendar
   - Otherwise → read all calendars from master
3. **Extract and filter** posts from `posts` arrays
4. **Sort** chronologically (date → time → campaign)
5. **Format output** with grouping based on query context:
   - Multi-day range → group by date
   - Single campaign → group by platform
   - Single platform → group by campaign

## Output Includes

- Summary statistics (total, by platform, by status)
- File references using `[file:path]` format
- Date range covered
- Next action suggestions

## Key Behaviors

- When no matches: explain filters applied, show what IS available, suggest broadening
- For "today" queries with status=scheduled: remind user these need manual publishing
- Handle calendar read errors gracefully - continue with successful reads

## Example

**User:** "Show me next week's scheduled posts"

**Response:**
```
Scheduled Posts: Nov 18-24, 2025

Nov 18 (Mon)
- 10:00 Facebook: text_travel-tips_rev1.md [scheduled]

Nov 20 (Wed)
- 09:00 Instagram: text_home-winter_rev1.md [scheduled]
- 14:00 LinkedIn: text_industry-news_rev1.md [scheduled]

Summary: 3 posts across 3 platforms

Remember: These posts require manual publishing on each platform.
```

See `resources/list-posts-examples.md` for filtering examples and edge cases.
