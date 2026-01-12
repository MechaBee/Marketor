# Capability: Review Drafts

Discover and interactively schedule unscheduled content in a campaign.

For scheduling a single known post, use `schedule_post` instead.

## Parameters

- **campaign_id** (optional): Campaign name or "regular-social". If omitted, ask user.

## Process

1. **Determine scope** - get campaign_id from context or ask
2. **Discover unscheduled content**:
   - List content files in campaign/regular-social folder
   - Read calendar's `posts` array
   - Filter: files NOT in posts array
3. **Present with grouping**:
   - Campaign: group by platform/format
   - Regular-social: group by month_folder first, then platform
4. **Offer scheduling approaches**:
   - A) Suggest optimal schedule (auto-assign dates/times)
   - B) Manual one-by-one (user chooses each)
   - C) Show current calendar first
   - D) Select specific posts only
5. **Execute user choice** - use `schedule_post` for each
6. **Validate and report** - run `validate_schedule`, summarize results

## Key Behaviors

- Apply platform timing rules from instructions.md when suggesting
- Check existing calendar to avoid conflicts
- Guide conversationally, explain reasoning
- If content already in posts array (any status), offer: keep/reschedule/skip
- After bulk scheduling, remind user of manual publishing workflow

## Example Session

**User:** "Schedule the summer-travel posts"

**Agent:**
```
Found 5 unscheduled posts:
1. text_travel-tips_rev1.md (Facebook, fb-link-post)
2. text_travel-insurance_rev1.md (Instagram, ig-reel)
...

A) Suggest optimal schedule
B) Schedule one-by-one
C) Show current calendar first
```

**User:** "A"

**Agent:**
```
Suggested Schedule:
1. Nov 1 10:00 - travel-tips (Facebook) - Friday morning optimal
2. Nov 2 20:00 - travel-insurance (IG Reel) - Saturday evening peak
...

Shall I schedule these?
```

**User:** "Yes"

**Agent:**
```
Scheduled 5 posts! (Nov 1-8)
Calendar: [file:campaigns/summer-travel/calendar.yaml]

Manual publishing required at scheduled times.
```

See `resources/review-drafts-examples.md` for detailed examples.
