# Schedule Post - Detailed Examples

Complete examples showing different scheduling scenarios.

## Example 1: Basic Scheduling

**User:** "Schedule the travel insurance post for November 15th at 10 AM on Facebook"

**Agent Process:**
1. Search workspace for "travel insurance" content
2. Find: `campaigns/travel-campaign/content-assets/social/meta/fb-link-post/text_travel-insurance_rev1.md`
3. Extract campaign: `travel-campaign`
4. Parse parameters:
   - platform: facebook
   - format: fb-link-post (from path)
   - date: 2025-11-15
   - time: 10:00
5. Read `campaigns/travel-campaign/calendar.yaml`
6. Validate: no conflicts
7. Add to scheduled_posts
8. Write calendar

**Agent Response:**
```
✅ Post scheduled successfully!

Content: text_travel-insurance_rev1.md
Platform: Facebook (fb-link-post)
Scheduled: November 15, 2025 at 10:00 Europe/Budapest
Status: scheduled

Calendar updated: [file:campaigns/travel-campaign/calendar.yaml]

Next steps:
- Review schedule: "show scheduled posts"
- Schedule more: "schedule another post"
- Validate: "validate calendar"
```

---

## Example 2: Scheduling with Media Files

**User:** "Schedule the home emergency reel with the kitchen video for December 1st at 2 PM on Instagram"

**Agent Process:**
1. Find content: `campaigns/home-insurance/content-assets/social/meta/ig-reel/text_home-emergency_rev1.md`
2. Find media: `campaigns/home-insurance/content-assets/social/meta/ig-reel/media/video_home-emergency-kitchen_rev1.mp4`
3. Verify both files exist
4. Parse parameters:
   - platform: instagram
   - format: ig-reel
   - date: 2025-12-01
   - time: 14:00
   - media_files: [video path]
5. Schedule with media reference

**Agent Response:**
```
✅ Instagram Reel scheduled!

Content: text_home-emergency_rev1.md
Media: video_home-emergency-kitchen_rev1.mp4
Platform: Instagram (ig-reel)
Scheduled: December 1, 2025 at 14:00 Europe/Budapest

Calendar: [file:campaigns/home-insurance/calendar.yaml]
```

---

## Example 3: Handling Ambiguous Content Reference

**User:** "Schedule the accident insurance post for November 20th"

**Agent Process:**
1. Search for "accident insurance" content
2. Find multiple matches:
   - text_accident-benefits_rev1.md
   - text_accident-benefits_rev2.md
   - text_accident-coverage_rev1.md

**Agent Response:**
```
I found multiple accident insurance posts:

1. text_accident-benefits_rev1.md (Facebook link post)
2. text_accident-benefits_rev2.md (Facebook link post)
3. text_accident-coverage_rev1.md (Instagram reel)

Which one would you like to schedule?

Please specify:
- Number (1, 2, or 3)
- Topic (benefits vs coverage)
- Revision (rev1 vs rev2)
- Platform preference
```

**User:** "The Instagram one"

**Agent:** "Got it, scheduling text_accident-coverage_rev1.md..."

---

## Example 4: Scheduling Conflict - Already Scheduled

**User:** "Schedule text_travel-tips_rev1.md for November 15th at 10 AM on Facebook"

**Agent Process:**
1. Find content file
2. Check calendar
3. Detect: content_file_path already in scheduled_posts

**Agent Response:**
```
⚠️ This content is already scheduled:

File: text_travel-tips_rev1.md
Current schedule:
- Platform: Facebook (fb-link-post)
- Date: November 10, 2025 at 14:00
- Status: scheduled

Would you like to:
1. Reschedule to November 15 at 10:00 (change date/time)
2. Cancel existing schedule (remove from calendar)
3. Keep existing schedule (do nothing)

What's your preference?
```

**User:** "Reschedule it"

**Agent:**
```
✅ Rescheduled!

Old schedule: Nov 10, 2025 at 14:00
New schedule: Nov 15, 2025 at 10:00

Calendar updated: [file:campaigns/travel-campaign/calendar.yaml]
```

---

## Example 5: Time Conflict with Another Post

**User:** "Schedule the travel destinations post for November 15th at 10 AM on Facebook"

**Agent Process:**
1. Find: text_travel-destinations_rev2.md
2. Check calendar
3. Detect conflict: another Facebook post at same time

**Agent Response:**
```
⚠️ Scheduling conflict detected:

You're scheduling:
- text_travel-destinations_rev2.md
- Facebook at Nov 15, 2025 10:00

Already scheduled:
- text_travel-insurance_rev1.md
- Facebook at Nov 15, 2025 10:00

Facebook posts should be spaced 4+ hours apart for optimal engagement.

Suggested alternatives:
1. Nov 15 at 11:00 (1 hour later)
2. Nov 15 at 14:00 (afternoon slot)
3. Nov 16 at 10:00 (next day)

Would you like to:
- Choose an alternative (1, 2, or 3)
- Specify different date/time
- Proceed anyway (both at 10:00)

What's your preference?
```

**User:** "Option 2"

**Agent:**
```
✅ Scheduled for Nov 15 at 14:00 instead!

Content: text_travel-destinations_rev2.md
Platform: Facebook (fb-text-post)
Scheduled: November 15, 2025 at 14:00 Europe/Budapest

No conflicts detected. Calendar updated!
```

---

## Example 6: Content File Not Found

**User:** "Schedule the summer travel post for November 20th"

**Agent Process:**
1. Search for "summer travel" content
2. No matches found

**Agent Response:**
```
❌ I couldn't find a content file matching "summer travel"

Let me help you locate it:

Would you like me to:
1. List all content in the summer-travel campaign
2. Search the entire workspace for travel-related content
3. Show recently created content files

Or you can provide the exact file path like:
campaigns/[campaign]/content-assets/social/meta/[format]/text_[name]_rev1.md
```

**User:** "List all content in summer-travel"

**Agent:**
```
📁 Content in summer-travel campaign:

Facebook:
1. text_travel-tips_rev1.md (fb-link-post)
2. text_travel-insurance_rev1.md (fb-link-post)
3. text_travel-checklist_rev1.md (fb-text-post)

Instagram:
4. text_travel-destinations_rev1.md (ig-reel)
5. text_travel-packing_rev1.md (ig-carousel)
6. text_travel-safety_rev1.md (ig-image-post)

Which one would you like to schedule?
```

---

## Example 7: Media File Not Found

**User:** "Schedule the home protection post with the infographic for December 5th at 10 AM on Facebook"

**Agent Process:**
1. Find content: text_home-protection_rev1.md
2. Search for "infographic" media
3. File not found

**Agent Response:**
```
✅ I found the content file: text_home-protection_rev1.md

❌ But I couldn't find the infographic media file

Media files in this post's directory:
- image_home-protection_rev1.png
- image_home-protection-alt_rev1.jpg

Did you mean one of these? Or would you like to:
1. Schedule without media
2. Specify the exact media file path
3. Cancel and add media first
```

**User:** "Use the first image"

**Agent:**
```
✅ Scheduled with image_home-protection_rev1.png

Content: text_home-protection_rev1.md
Media: image_home-protection_rev1.png
Platform: Facebook (fb-link-post)
Scheduled: December 5, 2025 at 10:00

Calendar: [file:campaigns/home-insurance/calendar.yaml]
```

---

## Example 8: Invalid Date Format

**User:** "Schedule the accident coverage post for 11/20/2025 at 10am"

**Agent Process:**
1. Find content file
2. Parse date: detect invalid format (MM/DD/YYYY)

**Agent Response:**
```
❌ Date format not recognized: "11/20/2025"

Please use YYYY-MM-DD format:
- Correct: 2025-11-20
- Correct: 2025-12-01

Would you like to schedule for November 20, 2025?
(Say "yes" or provide a different date)
```

**User:** "Yes"

**Agent:**
```
✅ Scheduled!

Content: text_accident-coverage_rev1.md
Platform: [detected platform]
Scheduled: November 20, 2025 at 10:00

Calendar updated!
```

---

## Example 9: Past Date Error

**User:** "Schedule the travel safety post for October 15th at 10 AM"

**Agent Process:**
1. Find content file
2. Parse date: 2025-10-15
3. Check if past (assuming today is Oct 28, 2025)

**Agent Response:**
```
❌ Cannot schedule for past date

You requested: October 15, 2025
Today is: October 28, 2025

Please provide a future date. Suggestions:
- Tomorrow: October 29, 2025
- Next week: November 4, 2025
- Next month: November 15, 2025

When would you like to schedule this post?
```

---

## Example 10: Calendar Doesn't Exist

**User:** "Schedule the new campaign post for December 1st"

**Agent Process:**
1. Find content in campaigns/new-campaign/...
2. Try to read campaigns/new-campaign/calendar.yaml
3. Calendar doesn't exist

**Agent Response:**
```
ℹ️ Campaign 'new-campaign' doesn't have a calendar yet

Would you like me to create one?

I'll use the standard template which includes:
- Scheduled posts section
- Published posts section
- Campaign metadata

Create calendar for 'new-campaign'? (yes/no)
```

**User:** "Yes"

**Agent:**
```
✅ Calendar created: campaigns/new-campaign/calendar.yaml

Now scheduling your post...

✅ Scheduled successfully!

Content: [filename]
Scheduled: December 1, 2025 at [time]

Calendar: [file:campaigns/new-campaign/calendar.yaml]
```

---

## Example 11: Invalid Platform/Format Combination

**User:** "Schedule the travel post as an Instagram story on Facebook"

**Agent Process:**
1. Find content file
2. Detect inconsistency: platform=facebook, format=ig-story

**Agent Response:**
```
❌ Format mismatch detected

You specified:
- Platform: Facebook
- Format: ig-story (Instagram Story)

Instagram formats cannot be used on Facebook.

For Facebook, valid formats are:
- fb-link-post
- fb-text-post
- fb-short-video

For Instagram, valid formats are:
- ig-reel
- ig-carousel
- ig-story
- ig-image-post

Which platform and format did you mean?
```

---

## Example 12: Custom Timezone

**User:** "Schedule the LinkedIn article for December 1st at 9 AM Eastern Time"

**Agent Process:**
1. Find content file
2. Parse timezone: "Eastern Time" → America/New_York
3. Convert to IANA identifier

**Agent Response:**
```
✅ Scheduled with custom timezone!

Content: [filename]
Platform: LinkedIn (li-article)
Scheduled: December 1, 2025 at 09:00 America/New_York
(14:00 Europe/Budapest)

Calendar: [file:campaigns/[campaign]/calendar.yaml]

Note: Time shown in workspace default timezone (Europe/Budapest) for reference.
```

---

## Complex Scenario: Multi-Step Resolution

**User:** "Schedule the insurance post for next Friday"

**Agent:** "I found 3 insurance posts. Which campaign: home, accident, or travel?"

**User:** "Home"

**Agent:** "Found 2 home insurance posts: home-protection and home-emergency. Which one?"

**User:** "Protection"

**Agent:** "Which platform: Facebook or Instagram?"

**User:** "Facebook"

**Agent:** "What time on Friday, November 1st?"

**User:** "10am"

**Agent:**
```
✅ Scheduled!

Content: text_home-protection_rev1.md
Platform: Facebook (fb-link-post)
Scheduled: November 1, 2025 at 10:00 Europe/Budapest

Calendar: [file:campaigns/home-insurance/calendar.yaml]
```

---

## Edge Case: Rescheduling with Conflict

**User:** "Reschedule travel-tips from November 10 to November 15 at 10am"

**Agent Process:**
1. Find existing schedule for travel-tips
2. Check November 15 at 10:00
3. Detect conflict at new time

**Agent Response:**
```
⚠️ I can reschedule, but there's a conflict at the new time:

Current schedule:
- travel-tips: Nov 10 at 14:00

Requested reschedule:
- travel-tips: Nov 15 at 10:00

Conflict:
- travel-insurance already scheduled Nov 15 at 10:00

Suggested alternatives:
1. Nov 15 at 11:00 (1 hour later)
2. Nov 15 at 14:00 (afternoon)
3. Nov 16 at 10:00 (next day)
4. Proceed anyway (both at 10:00)

What's your preference?
```