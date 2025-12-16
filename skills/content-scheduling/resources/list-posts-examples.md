# List Posts - Detailed Examples

This reference provides complete output format examples and edge case handling for the `list_posts` capability.

## Output Format Examples

### Format 1: Grouped by Date (Default for Multi-Day Ranges)

**Use when:** User queries span multiple days or asks for general schedule
```
📅 Scheduled Posts: November 1-7, 2025

Total: 12 posts across 3 campaigns

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📆 Monday, November 1, 2025

🕐 10:00 Europe/Budapest
  📱 Facebook (fb-link-post)
  📁 Campaign: summer-travel
  📄 [file:campaigns/summer-travel/content-assets/social/meta/fb-link-post/text_travel-tips_rev1.md]
  🖼️  Media: image_travel-tips_rev1.png
  ✅ Status: scheduled

🕐 14:00 Europe/Budapest
  📱 Instagram (ig-reel)
  📁 Campaign: home-insurance
  📄 [file:campaigns/home-insurance/content-assets/social/meta/ig-reel/text_home-emergency_rev1.md]
  🎥 Media: video_home-emergency_rev1.mp4
  ✅ Status: scheduled

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📆 Tuesday, November 2, 2025

🕐 10:00 Europe/Budapest
  📱 Google (g-search)
  📁 Campaign: accident-insurance
  📄 [file:campaigns/accident-insurance/content-assets/social/google/g-search/text_accident-coverage_rev1.md]
  ✅ Status: scheduled

🕐 14:00 Europe/Budapest
  📱 Instagram (ig-carousel)
  📁 Campaign: summer-travel
  📄 [file:campaigns/summer-travel/content-assets/social/meta/ig-carousel/text_travel-packing_rev1.md]
  🖼️  Media: 3 images
  ✅ Status: scheduled

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[... additional dates ...]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 Summary:
- Total posts: 12
- Facebook: 4 posts
- Instagram: 5 posts
- Google: 3 posts
- Campaigns: summer-travel (5), home-insurance (4), accident-insurance (3)

💡 Next steps:
- Schedule more posts: "schedule post for [date]"
- Validate calendar: "validate calendar"
- View specific campaign: "show summer-travel schedule"
```

---

### Format 2: Grouped by Platform (Single Campaign Query)

**Use when:** User asks about specific campaign
```
📁 Summer Travel Campaign Schedule

Total: 10 posts scheduled
Date range: Nov 1 - Nov 30, 2025

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📘 Facebook (4 posts)

1. Nov 1, 10:00 | fb-link-post
   [file:campaigns/summer-travel/content-assets/social/meta/fb-link-post/text_travel-tips_rev1.md]
   Status: scheduled | Media: 1 image

2. Nov 8, 14:00 | fb-text-post
   [file:campaigns/summer-travel/content-assets/social/meta/fb-text-post/text_travel-checklist_rev1.md]
   Status: scheduled

3. Nov 15, 10:00 | fb-link-post
   [file:campaigns/summer-travel/content-assets/social/meta/fb-link-post/text_travel-insurance_rev1.md]
   Status: scheduled | Media: 1 image

4. Nov 22, 14:00 | fb-short-video
   [file:campaigns/summer-travel/content-assets/social/meta/fb-short-video/text_travel-destinations_rev1.md]
   Status: scheduled | Media: 1 video

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📷 Instagram (4 posts)

1. Nov 2, 10:00 | ig-reel
   [file:campaigns/summer-travel/content-assets/social/meta/ig-reel/text_travel-destinations_rev1.md]
   Status: scheduled | Media: 1 video

2. Nov 9, 14:00 | ig-carousel
   [file:campaigns/summer-travel/content-assets/social/meta/ig-carousel/text_travel-packing_rev1.md]
   Status: scheduled | Media: 3 images

3. Nov 16, 10:00 | ig-story
   [file:campaigns/summer-travel/content-assets/social/meta/ig-story/text_travel-tips_rev2.md]
   Status: scheduled | Media: 1 image

4. Nov 23, 14:00 | ig-reel
   [file:campaigns/summer-travel/content-assets/social/meta/ig-reel/text_travel-safety_rev1.md]
   Status: scheduled | Media: 1 video

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔍 Google (2 posts)

1. Nov 5, 10:00 | g-search
   [file:campaigns/summer-travel/content-assets/social/google/g-search/text_travel-insurance-search_rev1.md]
   Status: scheduled

2. Nov 20, 10:00 | g-display
   [file:campaigns/summer-travel/content-assets/social/google/g-display/text_travel-insurance-display_rev1.md]
   Status: scheduled | Media: 1 image

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 Summary:
- 10 posts over 30 days
- Average: 2.3 posts per week
- Most active platforms: Facebook & Instagram (4 each)

📁 Calendar: [file:campaigns/summer-travel/calendar.yaml]

💡 Next steps:
- Validate calendar: "validate summer-travel calendar"
- Schedule more posts: "schedule post for summer-travel"
- View content details: click file links above
```

---

### Format 3: Grouped by Campaign (Single Platform Query)

**Use when:** User asks about specific platform across campaigns
```
📱 Scheduled Instagram Posts

Total: 15 posts across 4 campaigns
Date range: Nov 1 - Dec 10, 2025

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📁 summer-travel (7 posts)

Nov 2, 10:00 | ig-reel | text_travel-destinations_rev1.md
Nov 9, 14:00 | ig-carousel | text_travel-packing_rev1.md
Nov 16, 10:00 | ig-story | text_travel-tips_rev2.md
Nov 23, 14:00 | ig-reel | text_travel-safety_rev1.md
Nov 30, 10:00 | ig-image-post | text_travel-quotes_rev1.md
Dec 5, 14:00 | ig-reel | text_winter-travel_rev1.md
Dec 10, 10:00 | ig-carousel | text_holiday-travel_rev1.md

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📁 home-insurance (5 posts)

Nov 1, 14:00 | ig-reel | text_home-emergency_rev1.md
Nov 7, 16:00 | ig-carousel | text_home-protection_rev1.md
Nov 14, 10:00 | ig-image-post | text_home-safety_rev1.md
Nov 21, 14:00 | ig-reel | text_winter-prep_rev1.md
Nov 28, 10:00 | ig-story | text_home-tips_rev1.md

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📁 accident-insurance (2 posts)

Nov 5, 16:00 | ig-image-post | text_accident-benefits_rev1.md
Nov 19, 14:00 | ig-carousel | text_accident-coverage_rev1.md

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📁 life-insurance (1 post)

Nov 12, 10:00 | ig-reel | text_life-protection_rev1.md

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 Summary by Format:
- Reels: 8 posts (most common)
- Carousels: 4 posts
- Image Posts: 2 posts
- Stories: 1 post

📊 Summary by Campaign:
- summer-travel: 7 posts (47%)
- home-insurance: 5 posts (33%)
- accident-insurance: 2 posts (13%)
- life-insurance: 1 post (7%)

💡 Next steps:
- Balance campaigns: Consider more posts for accident/life insurance
- Schedule more reels: They're your most common format
- Fill gaps: Some campaigns have sparse schedules
```

---

### Format 4: Compact List (Quick Reference)

**Use when:** User wants quick overview or list is very long
```
📋 Scheduled Posts (Compact View)

Filters: Platform=Instagram, Status=scheduled
Found: 15 posts

 1. Nov 1, 10:00 | summer-travel | ig-reel | travel-destinations
 2. Nov 2, 14:00 | home-insurance | ig-carousel | home-protection
 3. Nov 3, 10:00 | summer-travel | ig-story | travel-tips
 4. Nov 5, 16:00 | accident-insurance | ig-image-post | accident-benefits
 5. Nov 7, 10:00 | summer-travel | ig-reel | travel-safety
 6. Nov 8, 14:00 | home-insurance | ig-reel | home-emergency
 7. Nov 9, 14:00 | summer-travel | ig-carousel | travel-packing
 8. Nov 12, 10:00 | life-insurance | ig-reel | life-protection
 9. Nov 14, 10:00 | home-insurance | ig-image-post | home-safety
10. Nov 16, 10:00 | summer-travel | ig-story | travel-tips-2
11. Nov 19, 14:00 | accident-insurance | ig-carousel | accident-coverage
12. Nov 21, 14:00 | home-insurance | ig-reel | winter-prep
13. Nov 23, 14:00 | summer-travel | ig-reel | travel-safety
14. Nov 28, 10:00 | home-insurance | ig-story | home-tips
15. Nov 30, 10:00 | summer-travel | ig-image-post | travel-quotes

💡 Use "show details for post [number]" to see full information
```

---

## Edge Case Examples

### Example 1: Empty Results with Helpful Suggestions

**Query:** "Show me LinkedIn posts scheduled for December"

**No matches found:**
```
🔍 No LinkedIn posts found for December 2025

Filters applied:
- Platform: LinkedIn
- Date range: Dec 1-31, 2025

However, I found:
✅ LinkedIn posts in other months:
   - November 2025: 2 posts
   - January 2026: 1 post

✅ Other platforms in December:
   - Facebook: 8 posts
   - Instagram: 10 posts
   - Google: 4 posts

Would you like to:
1. See LinkedIn posts for all dates → "show all LinkedIn posts"
2. Schedule new LinkedIn posts for December → "schedule LinkedIn post"
3. View posts for a different platform in December → "show December Facebook posts"

What would you prefer?
```

---

### Example 2: Calendar Read Errors

**Some calendars failed to read:**
```
⚠️ Partial Results: Some calendars couldn't be read

Failed to read:
- campaigns/old-campaign/calendar.yaml (file not found)
- campaigns/test-campaign/calendar.yaml (invalid YAML syntax)

Successfully read:
- campaigns/summer-travel/calendar.yaml ✅
- campaigns/home-insurance/calendar.yaml ✅
- campaigns/accident-insurance/calendar.yaml ✅

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Showing results from 3 successfully read calendars:

[... normal output continues ...]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚠️ Note: Results are incomplete due to calendar read errors.

Would you like me to:
1. Investigate the calendar errors → "validate calendars"
2. Continue with available results → (no action needed)
3. Try reading specific campaign → "show [campaign] calendar"
```

---

### Example 3: Mixed Status Results

**Query:** "Show me posts for next week"

**Mix of scheduled, draft, and failed statuses:**
```
📅 Posts for Next Week: Nov 1-7, 2025

Total: 15 posts (12 scheduled, 2 draft, 1 failed)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ Scheduled (12 posts)

[... scheduled posts ...]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📝 Draft (2 posts - need finalization)

Nov 3, 10:00 | Facebook | summer-travel
[file:campaigns/summer-travel/content-assets/social/meta/fb-text-post/text_draft-post_rev1.md]
⚠️ Status: draft - needs review before publication

Nov 5, 14:00 | Instagram | home-insurance
[file:campaigns/home-insurance/content-assets/social/meta/ig-reel/text_draft-reel_rev1.md]
⚠️ Status: draft - needs review before publication

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

❌ Failed (1 post - needs attention)

Nov 2, 10:00 | Instagram | accident-insurance
[file:campaigns/accident-insurance/content-assets/social/meta/ig-story/text_accident-story_rev1.md]
❌ Status: failed - previous publication attempt failed
💡 Investigate error and reschedule

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 Summary:
- Scheduled: 12 (80%) - ready to publish
- Draft: 2 (13%) - need finalization
- Failed: 1 (7%) - needs attention

⚠️ Action Required:
1. Finalize 2 draft posts
2. Investigate 1 failed post
3. Consider rescheduling failed post

Next steps:
- Finalize drafts: "update post status to scheduled"
- Investigate failure: "show details for failed post"
- Reschedule: "reschedule post for [new date]"
```

---

### Example 4: Scheduling Gaps Identified

**Query:** "Show me next week's schedule"

**User has gaps in scheduling:**
```
📅 Next Week Schedule: Nov 1-7, 2025

Total: 6 posts scheduled

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📆 Monday, Nov 1
✅ 2 posts scheduled

📆 Tuesday, Nov 2
⚠️ No posts scheduled

📆 Wednesday, Nov 3
✅ 3 posts scheduled

📆 Thursday, Nov 4
⚠️ No posts scheduled

📆 Friday, Nov 5
✅ 1 post scheduled

📆 Saturday, Nov 6
⚠️ No posts scheduled

📆 Sunday, Nov 7
⚠️ No posts scheduled

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[... detailed post listings ...]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 Summary:
- Total posts: 6
- Active days: 3 of 7 (43%)
- Gap days: 4 (Tuesday, Thursday, Saturday, Sunday)

💡 Suggestions:
Your schedule has several gaps. Consider:
1. Scheduling posts for Tuesday and Thursday (weekday presence)
2. Adding weekend content (Saturday/Sunday engagement)
3. Maintaining 5-7 posts/week for consistent presence

Would you like to:
- Review unscheduled content → "show unscheduled posts"
- Schedule more posts → "schedule post for Tuesday"
- View content ideas → "suggest post ideas for gaps"
```

---

### Example 5: Platform-Specific Insights

**Query:** "Show Instagram posts for summer-travel"

**Campaign-platform analysis:**
```
📷 Instagram Posts: Summer Travel Campaign

Total: 7 posts
Date range: Nov 1 - Dec 10, 2025

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🎬 Reels (4 posts - 57%)

Nov 2, 10:00 | text_travel-destinations_rev1.md
Nov 23, 14:00 | text_travel-safety_rev1.md
Dec 5, 14:00 | text_winter-travel_rev1.md

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📸 Carousels (2 posts - 29%)

Nov 9, 14:00 | text_travel-packing_rev1.md (3 images)
Dec 10, 10:00 | text_holiday-travel_rev1.md (5 images)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🖼️ Image Posts (1 post - 14%)

Nov 30, 10:00 | text_travel-quotes_rev1.md

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📖 Stories (0 posts)

No Instagram Stories scheduled

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📊 Format Analysis:
- Reels dominate (57%) - great for reach
- No Stories scheduled - consider adding for engagement
- Balanced mix otherwise

📊 Posting Frequency:
- November: 4 posts (1.3/week)
- December: 3 posts (0.75/week)
- Overall: ~1 post/week

💡 Recommendations:
1. Add Instagram Stories for daily engagement
2. Increase posting frequency to 2-3 posts/week
3. Maintain reel focus (they perform well)
4. Consider adding more carousels (educational content)

Next steps:
- Schedule Stories → "schedule Instagram Story for summer-travel"
- View content library → "show unscheduled Instagram content"
- Analyze performance → "compare with other campaigns"
```

---

## Natural Language Date Parsing Examples

User input variations that should be handled:

- "next week" → Nov 1-7, 2025 (current date + 7 days)
- "this month" → Nov 1-30, 2025
- "next month" → Dec 1-31, 2025
- "today" → Nov 1, 2025
- "tomorrow" → Nov 2, 2025
- "this week" → Oct 26 - Nov 1, 2025 (current week)
- "November" → Nov 1-30, 2025
- "Q4" → Oct 1 - Dec 31, 2025
- "2025-11-15" → Nov 15, 2025 (single date)
- "November 15" → Nov 15, 2025
- "Nov 1 to Nov 7" → Nov 1-7, 2025
- "November 1-15" → Nov 1-15, 2025

When date parsing fails, ask for clarification with examples of valid formats.
