# Review Drafts - Key Examples

Interactive scheduling workflows. Basic flow covered in capability doc.

## Example 1: Suggested Schedule

**User:** "Schedule summer-travel posts"

**Agent:**
```
Found 5 unscheduled posts:
1. text_travel-tips_rev1.md (Facebook)
2. text_travel-insurance_rev1.md (Instagram reel)
3. text_travel-destinations_rev2.md (Facebook)
4. text_travel-safety_rev1.md (Instagram)
5. text_travel-search_rev1.md (Google)

A) Suggest optimal schedule
B) Schedule one-by-one
C) Show current calendar first
```

**User:** "A"

**Agent:**
```
Suggested Schedule:

1. Nov 1, 10:00 - travel-tips (Facebook) - Friday morning optimal
2. Nov 2, 20:00 - travel-insurance (IG Reel) - Saturday evening peak
3. Nov 4, 14:00 - travel-destinations (Facebook) - Monday afternoon
4. Nov 6, 12:00 - travel-safety (Instagram) - Wednesday lunch
5. Nov 7, 09:00 - travel-search (Google) - Thursday business hours

Schedule these?
```

**User:** "Yes"

**Agent:**
```
5 posts scheduled (Nov 1-7)
Calendar: [file:campaigns/summer-travel/calendar.yaml]
```

---

## Example 2: Manual One-by-One

**User:** "Schedule home-insurance posts one by one"

**Agent:**
```
Post 1 of 3: text_home-protection_rev1.md (Facebook)

Suggested:
1. Nov 1 at 10:00 (Friday morning)
2. Nov 4 at 14:00 (Monday afternoon)
3. Nov 6 at 09:00 (Wednesday)

Choose 1/2/3, specify date/time, or "skip"
```

**User:** "November 2nd at 11am"

**Agent:**
```
Scheduled → Nov 2 at 11:00

Post 2 of 3: text_home-emergency_rev1.md (Instagram reel)
...
```

---

## Example 3: Conflict Detection

**Agent:**
```
Conflict detected for post 2:

Wanted: Nov 3 at 12:00 on Instagram
Existing: Nov 3 at 20:00 on Instagram (home-emergency)

Instagram needs 6+ hour spacing.

Alternative: Nov 4 at 12:00

Schedule with alternative?
```

---

## Example 4: All Content Already Scheduled

**Agent:**
```
All content in 'travel-insurance' already scheduled!

8 posts, Nov 1-15
Facebook: 3 | Instagram: 3 | Google: 2

Options:
1. Review schedule
2. Create new content
3. Reschedule existing
```

---

## Example 5: User Stops Mid-Way

**User:** "stop"

**Agent:**
```
Scheduling paused.

Progress: 1 scheduled, 3 remaining

Options:
1. Resume later
2. Auto-schedule remaining
3. Cancel and revert

Resume with: "continue scheduling home-insurance"
```
