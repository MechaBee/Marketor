# Review Drafts - Detailed Examples

Complete walkthrough examples showing different scheduling scenarios.

## Example 1: Suggested Schedule (Full Flow)

**User:** "I'm ready to schedule the posts for summer-travel"

**Agent:**
```
📋 Unscheduled Content in summer-travel:

Found 5 unscheduled posts:

1. text_travel-tips_rev1.md
   - Platform: Facebook (fb-link-post)
   - Created: Oct 25, 2025
   - Media: image_travel-tips_rev1.png

2. text_travel-insurance_rev1.md
   - Platform: Instagram (ig-reel)
   - Created: Oct 25, 2025
   - Media: video_travel-insurance_rev1.mp4

3. text_travel-destinations_rev2.md
   - Platform: Facebook (fb-text-post)
   - Created: Oct 26, 2025
   - Media: None

4. text_travel-safety_rev1.md
   - Platform: Instagram (ig-image-post)
   - Created: Oct 26, 2025
   - Media: image_travel-safety_rev1.png

5. text_travel-insurance-search_rev1.md
   - Platform: Google (g-search)
   - Created: Oct 27, 2025
   - Media: None

Summary:
- Facebook: 2 posts
- Instagram: 2 posts
- Google: 1 ad

Would you like me to:
A) Suggest an optimal schedule for all posts
B) Schedule them one by one (I'll guide you)
C) Show me the current calendar first
D) Select specific posts to schedule
```

**User:** "Suggest an optimal schedule"

**Agent:**
```
📅 Suggested Schedule:

Based on platform best practices:

1. Nov 1, 2025 at 10:00 (Friday)
   text_travel-tips_rev1.md on Facebook
   → Friday morning optimal for weekend travel planning

2. Nov 2, 2025 at 20:00 (Saturday)
   text_travel-insurance_rev1.md on Instagram (Reel)
   → Saturday evening peak time for reels

3. Nov 4, 2025 at 14:00 (Monday)
   text_travel-destinations_rev2.md on Facebook
   → Monday afternoon good for inspiration content

4. Nov 6, 2025 at 12:00 (Wednesday)
   text_travel-safety_rev1.md on Instagram (Image)
   → Mid-week lunch time, high engagement

5. Nov 7, 2025 at 09:00 (Thursday)
   text_travel-insurance-search_rev1.md on Google
   → Thursday morning, business hours start

Schedule benefits:
- 7-day spread with good distribution
- Platform-specific optimal times
- 2-3 day spacing between posts
- Alternates platforms for variety

Shall I schedule these?
```

**User:** "Schedule them"

**Agent:**
```
Scheduling...

✅ text_travel-tips_rev1.md → Nov 1 at 10:00
✅ text_travel-insurance_rev1.md → Nov 2 at 20:00
✅ text_travel-destinations_rev2.md → Nov 4 at 14:00
✅ text_travel-safety_rev1.md → Nov 6 at 12:00
✅ text_travel-insurance-search_rev1.md → Nov 7 at 09:00

Validating calendar... ✅

📊 Complete:
- 5 posts scheduled (Nov 1-7, 2025)
- Facebook: 2 | Instagram: 2 | Google: 1

Calendar: [file:campaigns/summer-travel/calendar.yaml]

Next: "show scheduled posts" or "create more content"
```

---

## Example 2: Manual Scheduling (Interactive)

**User:** "Schedule the home-insurance posts one by one"

**Agent:**
```
📋 Found 3 unscheduled posts in home-insurance

Let's schedule them interactively.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📄 Post 1 of 3

File: text_home-protection_rev1.md
Platform: Facebook (fb-link-post)
Media: image_home-protection_rev1.png

Suggested times:
1. Nov 1 at 10:00 (Friday morning - high engagement)
2. Nov 4 at 14:00 (Monday afternoon - planning time)
3. Nov 6 at 09:00 (Wednesday morning - mid-week)

Choose: 1/2/3, specify date/time, or "skip"
```

**User:** "November 2nd at 11am"

**Agent:**
```
✅ Scheduled → Nov 2 at 11:00

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📄 Post 2 of 3

File: text_home-emergency_rev1.md
Platform: Instagram (ig-reel)
Media: video_home-emergency_rev1.mp4

Suggested times:
1. Nov 3 at 20:00 (Saturday evening - peak reel time)
2. Nov 5 at 19:00 (Tuesday evening - high engagement)
3. Nov 7 at 21:00 (Thursday evening - pre-weekend)

Choose: 1/2/3, specify date/time, or "skip"
```

**User:** "1"

**Agent:**
```
✅ Scheduled → Nov 3 at 20:00

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📄 Post 3 of 3

File: text_home-insurance-benefits_rev1.md
Platform: Facebook (fb-text-post)
Media: None

Suggested times:
1. Nov 5 at 14:00 (Tuesday afternoon - text posts)
2. Nov 8 at 10:00 (Friday morning - weekend planning)
3. Nov 11 at 13:00 (Monday lunch)

Choose: 1/2/3, specify date/time, or "skip"
```

**User:** "2"

**Agent:**
```
✅ Scheduled → Nov 8 at 10:00

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 Complete:
- 3 posts scheduled (Nov 2-8)
- Facebook: 2 | Instagram: 1

Calendar: [file:campaigns/home-insurance/calendar.yaml]
```

---

## Example 3: Conflict Detection and Resolution

**User:** "Schedule accident-insurance posts"

**Agent:**
```
📋 Found 2 unscheduled posts

Would you like me to:
A) Suggest optimal schedule
B) Schedule one-by-one
C) Show current calendar first
```

**User:** "A"

**Agent:**
```
📅 Suggested Schedule:

1. Nov 1 at 10:00 (Friday)
   text_accident-coverage_rev1.md on Facebook
   → Friday morning, insurance awareness content

⚠️ Conflict detected:

For post 2, I wanted to suggest Nov 3 at 12:00 for:
text_accident-benefits_rev1.md on Instagram

But you already have scheduled:
text_home-emergency_rev1.md at Nov 3 20:00 on Instagram

Instagram posts need 6+ hour spacing, so I'm suggesting:

2. Nov 4 at 12:00 (Monday)
   text_accident-benefits_rev1.md on Instagram
   → Monday lunch, good for image posts, avoids conflict

Schedule benefits:
- 4-day spread
- Avoids Instagram conflict
- Platform best practices maintained

Shall I schedule these?
```

**User:** "Yes"

**Agent:**
```
✅ text_accident-coverage_rev1.md → Nov 1 at 10:00
✅ text_accident-benefits_rev1.md → Nov 4 at 12:00

Validating... ✅ No conflicts

📊 Complete:
- 2 posts scheduled (Nov 1-4)
- Facebook: 1 | Instagram: 1

All scheduled successfully with no conflicts!
```

---

## Example 4: No Unscheduled Content

**User:** "Schedule posts for travel-insurance"

**Agent:**
```
✅ All content in 'travel-insurance' already scheduled!

Current schedule:
- 8 posts scheduled
- Nov 1-15, 2025
- Facebook: 3 | Instagram: 3 | Google: 2

Options:
1. Review schedule
2. Create new content
3. Reschedule existing posts
4. Different campaign

What would you like?
```

**User:** "1"

**Agent:** [Executes `list_posts` capability]

---

## Example 5: Calendar Doesn't Exist Yet

**User:** "Schedule the new-campaign posts"

**Agent:**
```
ℹ️ Campaign 'new-campaign' has no calendar yet

Found 4 unscheduled posts. Shall I:
1. Create calendar and schedule posts
2. Show posts first
3. Cancel

What would you like?
```

**User:** "1"

**Agent:**
```
Creating calendar for new-campaign...

[Uses initialize_calendar]

✅ Calendar created

Now let's schedule the 4 posts.

Would you like me to:
A) Suggest optimal schedule
B) Schedule one-by-one
```

---

## Example 6: Partial Scheduling (User Stops Mid-Way)

**User:** "Schedule home-insurance posts one by one"

**Agent:** [Shows post 1 with suggestions]

**User:** "Nov 5 at 2pm"

**Agent:**
```
✅ Scheduled → Nov 5 at 14:00

📄 Post 2 of 4
[...]
```

**User:** "stop"

**Agent:**
```
⏸️ Scheduling stopped

📊 Progress:
- Scheduled: 1 post
- Remaining: 3 unscheduled posts

What would you like to do:
1. Resume scheduling later
2. Auto-schedule remaining posts
3. Cancel and revert

Choose an option or just say "done" to finish
```

**User:** "done"

**Agent:**
```
✅ Saved progress

You have 3 posts still unscheduled in home-insurance.

Resume anytime with: "continue scheduling home-insurance"
```

---

## Example 7: User Overrides Suggestions

**User:** "Schedule summer-travel posts"

**Agent:** [Suggests optimal schedule]

**User:** "Change post 3 to November 10th at 3pm"

**Agent:**
```
Updated schedule:

1. Nov 1 at 10:00 - travel-tips (Facebook) ✓
2. Nov 2 at 20:00 - travel-insurance (Instagram) ✓
3. Nov 10 at 15:00 - travel-destinations (Facebook) ← Changed
4. Nov 6 at 12:00 - travel-safety (Instagram) ✓
5. Nov 7 at 09:00 - travel-search (Google) ✓

⚠️ Note: Nov 10 at 3pm is outside optimal Facebook hours (9-11am, 1-3pm)
This may reduce engagement. Proceed anyway?
```

**User:** "Yes, that's fine"

**Agent:**
```
✅ Understood, scheduling with your preference

[Schedules all posts including the custom timing]

📊 Complete: 5 posts scheduled
```

---

## Natural Language Input Examples

User can say dates/times in various formats:

**Accepted formats:**
- "November 15 at 10am"
- "Nov 15 at 10:00"
- "2025-11-15 at 10:00"
- "next Friday at 2pm"
- "tomorrow at 9am"
- "Monday at 14:00"
- "15th at 10am" (assumes current month)

**How agent parses:**
```
"next Friday at 2pm"
→ Calculates next Friday from current date
→ Converts "2pm" to "14:00"
→ Uses default timezone (Europe/Budapest)
→ Formats as: 2025-11-01 at 14:00
```

**Invalid inputs trigger clarification:**
```
User: "sometime next week"

Agent: "I need a specific date and time.

Try:
- "November 5 at 10am"
- "next Wednesday at 2pm"
- Or choose a suggestion (1, 2, 3)

When should I schedule this?"
```
