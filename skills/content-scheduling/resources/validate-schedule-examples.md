# Validate Schedule - Key Examples

Error scenarios and resolutions. Basic validation covered in capability doc.

## Example 1: Pass with Warnings

**Response:**
```
PASSED (5 calendars, 47 posts)

Warnings (2):
1. Scheduling Conflict (summer-travel)
   Nov 15, 10:00 Facebook: 2 posts scheduled
   Fix: Space 1-2 hours apart

2. Past Date (home-insurance)
   text_home-emergency_rev1.md for Oct 20 (today: Oct 25)
   Fix: Reschedule or mark as published
```

---

## Example 2: Fail - Multiple Errors

**Response:**
```
FAILED (3 calendars, 28 posts)

Errors (5):

1. Content File Not Found (summer-travel)
   text_travel-tips_rev1.md
   Fix: Verify file exists or remove entry

2. Invalid Date Format (home-insurance)
   "2025-11-1" → should be "2025-11-01"

3. Invalid Platform (home-insurance)
   "twitter" → use: facebook, instagram, google, linkedin

4. Format-Platform Mismatch (accident-insurance)
   Platform: facebook, Format: ig-reel
   Fix: Use fb-link-post, fb-text-post, or fb-short-video

5. Media File Not Found (summer-travel)
   video_travel-destinations_rev1.mp4
```

---

## Example 3: YAML Syntax Error

**Response:**
```
FAILED - Invalid YAML Syntax

Error at line 23:
  "scheduled_posts..."
  Expected: colon after key

Options:
1. Show problematic section
2. Attempt auto-fix
3. Recreate from template
```

---

## Example 4: Post-Bulk Scheduling Validation

**Response:**
```
PASSED (15 posts, 10 newly added)

Warning: Conflict detected
Nov 15, 10:00 Instagram:
- text_home-protection_rev1.md (new)
- text_home-emergency_rev1.md (existing)

Instagram needs 6+ hour spacing.
Reschedule to Nov 15 at 16:00 or Nov 16 at 10:00?
```

---

## Example 5: Auto-Fix Date Formats

**User:** "Fix them"

**Response:**
```
Fixed 3 date formats:
- "11/15/2025" → "2025-11-15"
- "2025-11-1" → "2025-11-01"
- "Nov 20, 2025" → "2025-11-20"

Re-validating... PASSED
```

---

## Error Categories

| Category | Examples |
|----------|----------|
| File | Content/media not found, calendar missing |
| Format | Invalid date/time, bad YAML syntax |
| Logic | Platform mismatch, invalid values |
| Conflict | Duplicates, time overlaps, status issues |
| Warning | Past dates, missing platform_post_id |
