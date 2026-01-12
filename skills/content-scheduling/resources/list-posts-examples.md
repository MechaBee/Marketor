# List Posts - Key Examples

Output format and edge case handling. Basic listing covered in capability doc.

## Output Formats

**Group by date** (default for multi-day ranges):
```
Scheduled Posts: Nov 1-7, 2025

Mon, Nov 1
- 10:00 Facebook: text_travel-tips_rev1.md [scheduled]
- 14:00 Instagram: text_home-emergency_rev1.md [scheduled]

Tue, Nov 2
- 10:00 Google: text_accident-coverage_rev1.md [scheduled]

Summary: 3 posts, 3 platforms
```

**Group by platform** (single campaign query):
```
Summer Travel Campaign

Facebook (4 posts)
- Nov 1, 10:00 | fb-link-post | text_travel-tips_rev1.md
- Nov 8, 14:00 | fb-text-post | text_travel-checklist_rev1.md

Instagram (3 posts)
- Nov 2, 10:00 | ig-reel | text_travel-destinations_rev1.md
...
```

**Group by campaign** (single platform query):
```
Scheduled Instagram Posts

summer-travel (7 posts)
Nov 2, 10:00 | ig-reel | travel-destinations
Nov 9, 14:00 | ig-carousel | travel-packing
...

home-insurance (5 posts)
Nov 1, 14:00 | ig-reel | home-emergency
...
```

---

## Example 1: Empty Results

**Query:** "Show LinkedIn posts for December"

**Response:**
```
No LinkedIn posts found for December 2025.

Available instead:
- LinkedIn in November: 2 posts
- December on other platforms: Facebook (8), Instagram (10)

Options:
1. Show all LinkedIn posts
2. Schedule new LinkedIn post for December
3. Show December Facebook posts
```

---

## Example 2: Calendar Read Errors

**Response:**
```
Partial Results (some calendars couldn't be read)

Failed:
- campaigns/old-campaign/calendar.yaml (not found)
- campaigns/test-campaign/calendar.yaml (invalid YAML)

Showing results from 3 successful calendars:
[... normal output ...]

Use "validate calendars" to investigate errors.
```

---

## Example 3: Mixed Status Results

**Query:** "Show next week's posts"

**Response:**
```
Posts for Nov 1-7 (15 total)

Scheduled (12 posts) - ready to publish
[... list ...]

Draft (2 posts) - need finalization
- Nov 3, 10:00 | Facebook | text_draft-post_rev1.md

Failed (1 post) - needs attention
- Nov 2, 10:00 | Instagram | text_accident-story_rev1.md

Action needed: Finalize 2 drafts, investigate 1 failure
```

---

## Example 4: Scheduling Gaps

**Response:**
```
Next Week: Nov 1-7

Mon: 2 posts
Tue: No posts
Wed: 3 posts
Thu: No posts
Fri: 1 post
Sat-Sun: No posts

Gap days: 4 of 7
Consider adding Tuesday/Thursday posts for weekday presence.
```

---

## Date Parsing

Supported natural language:
- "next week", "this month", "today", "tomorrow"
- "November", "Q4", "2025-11-15"
- "Nov 1 to Nov 7", "November 1-15"
