# Validate Schedule - Detailed Examples

Complete validation scenarios with various error types and resolutions.

## Example 1: Validation Pass (No Errors, Some Warnings)

**User:** "Validate all calendars"

**Agent Process:**
1. Read master calendar
2. Get 5 campaign calendars
3. Validate each: all parse successfully
4. Check 47 posts total
5. Find 2 warnings, 1 info
6. Generate PASS report

**Agent Response:**
```
✅ Calendar Validation: PASSED

📊 Summary:
- Calendars checked: 5
- Posts validated: 47 (42 scheduled, 5 published)
- Errors: 0
- Warnings: 2
- Info: 1

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚠️ Warnings (2):

1. Scheduling Conflict
   Calendar: [file:campaigns/summer-travel/calendar.yaml]
   Issue: Multiple posts at same time slot
   
   Nov 15, 2025 at 10:00 on Facebook:
   - text_travel-tips_rev1.md
   - text_travel-insurance_rev1.md
   
   Recommendation: Space posts 1-2 hours apart for better engagement

2. Past Scheduled Date
   Calendar: [file:campaigns/home-insurance/calendar.yaml]
   Issue: Post scheduled for past date
   
   text_home-emergency_rev1.md scheduled for Oct 20, 2025
   (Today: Oct 25, 2025)
   
   Recommendation: Reschedule to future date or mark as published

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

ℹ️ Info (1):

Missing Platform Post ID
Calendar: [file:campaigns/accident-insurance/calendar.yaml]

Published post missing platform_post_id:
- text_accident-benefits_rev1.md

Recommendation: Add platform_post_id for better tracking and analytics

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ All calendars are valid and ready for use!

💡 Next steps:
- Review warnings and adjust if needed
- Add platform_post_id to published posts
- Continue scheduling

Validated calendars:
- [file:campaigns/summer-travel/calendar.yaml]
- [file:campaigns/home-insurance/calendar.yaml]
- [file:campaigns/accident-insurance/calendar.yaml]
- [file:campaigns/travel-insurance/calendar.yaml]
- [file:campaigns/life-insurance/calendar.yaml]
```

---

## Example 2: Validation Fail (Multiple Errors)

**User:** "Validate calendars"

**Agent Process:**
1. Read 3 campaign calendars
2. Find multiple errors across calendars
3. Generate FAIL report with grouped errors

**Agent Response:**
```
❌ Calendar Validation: FAILED

📊 Summary:
- Calendars checked: 3
- Posts validated: 28
- Errors: 5
- Warnings: 1
- Info: 0

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🚨 Errors (5):

1. Content File Not Found
   Calendar: [file:campaigns/summer-travel/calendar.yaml]
   
   Post: text_travel-tips_rev1.md
   Path: campaigns/summer-travel/content-assets/social/meta/fb-link-post/text_travel-tips_rev1.md
   
   Fix: Verify file exists or remove from calendar

2. Invalid Date Format
   Calendar: [file:campaigns/home-insurance/calendar.yaml]
   
   Post: text_home-protection_rev1.md
   Current: "2025-11-1"
   Required: "2025-11-01"
   
   Fix: Use YYYY-MM-DD with zero-padding

3. Invalid Platform
   Calendar: [file:campaigns/home-insurance/calendar.yaml]
   
   Post: text_home-emergency_rev2.md
   Current platform: "twitter"
   Valid platforms: facebook, instagram, google, linkedin
   
   Fix: Change to supported platform

4. Format-Platform Mismatch
   Calendar: [file:campaigns/accident-insurance/calendar.yaml]
   
   Post: text_accident-coverage_rev1.md
   Platform: facebook
   Format: ig-reel (Instagram format)
   
   Fix: Use fb-link-post, fb-text-post, or fb-short-video

5. Media File Not Found
   Calendar: [file:campaigns/summer-travel/calendar.yaml]
   
   Post: text_travel-destinations_rev1.md
   Media: video_travel-destinations_rev1.mp4
   Path: campaigns/summer-travel/content-assets/social/meta/ig-reel/media/video_travel-destinations_rev1.mp4
   
   Fix: Verify media file exists or remove from post

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚠️ Warnings (1):

Duplicate Entry
Calendar: [file:campaigns/summer-travel/calendar.yaml]

Content file scheduled multiple times:
- text_travel-insurance_rev1.md
  * Nov 15 at 10:00
  * Nov 20 at 14:00

Recommendation: Remove duplicate or use different revisions

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

❌ Please fix errors before proceeding

💡 Priority fixes:
1. Verify all content files exist
2. Correct date formats (use YYYY-MM-DD)
3. Update platforms to supported values
4. Match formats with platforms
5. Verify media files exist

Calendars with errors:
- [file:campaigns/summer-travel/calendar.yaml] (3 errors)
- [file:campaigns/home-insurance/calendar.yaml] (2 errors)
- [file:campaigns/accident-insurance/calendar.yaml] (1 error)

Would you like help fixing these issues?
```

---

## Example 3: Single Campaign Validation (Pass)

**User:** "Validate the summer-travel calendar"

**Agent Response:**
```
✅ Calendar Validation: PASSED

Campaign: summer-travel

📊 Summary:
- Posts validated: 10 (8 scheduled, 2 published)
- Errors: 0
- Warnings: 0
- Info: 0

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ All checks passed!

Validation details:
✅ All content files exist
✅ All media files exist
✅ Date/time formats correct
✅ Platforms valid
✅ Formats match platforms
✅ No scheduling conflicts
✅ No duplicate entries
✅ Status values valid

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📅 Schedule Overview:
- Date range: Nov 1-30, 2025
- Platforms: Facebook (4), Instagram (4), Google (2)
- All posts scheduled for future dates
- No conflicts detected

✅ Calendar ready for use!

Calendar: [file:campaigns/summer-travel/calendar.yaml]

Next: "list scheduled posts" or "schedule more posts"
```

---

## Example 4: YAML Syntax Error

**User:** "Validate home-insurance calendar"

**Agent Process:**
1. Try to read calendar
2. YAML parse fails
3. Report syntax error

**Agent Response:**
```
❌ Calendar Validation: FAILED

Campaign: home-insurance

🚨 Critical Error: Invalid YAML Syntax

Calendar: [file:campaigns/home-insurance/calendar.yaml]

Parse error at line 23:
  "scheduled_posts
     campaigns/home-insurance/content-assets..."
  
Expected: (colon after scheduled_posts)

Common YAML issues:
- Missing colons after keys
- Incorrect indentation (use spaces, not tabs)
- Unquoted special characters
- Mismatched brackets

Would you like me to:
1. Show the problematic section
2. Attempt to fix the syntax
3. Recreate calendar from template

What would you prefer?
```

---

## Example 5: No Calendars Found

**User:** "Validate calendars"

**Agent Process:**
1. Try to read master calendar
2. No campaigns found
3. Report empty state

**Agent Response:**
```
ℹ️ No campaign calendars found

No campaigns exist in the workspace yet.

To get started:
1. Create campaign folder
2. Add calendar.yaml
3. Schedule posts

Would you like me to:
- Create your first campaign
- Show campaign setup guide
- Skip validation

What would you prefer?
```

---

## Example 6: After Bulk Scheduling

**User:** "I just scheduled 10 posts, validate the calendar"

**Agent Process:**
1. Determine campaign from context
2. Validate that campaign
3. Check newly scheduled posts
4. Find one conflict

**Agent Response:**
```
✅ Calendar Validation: PASSED

Campaign: home-insurance

📊 Summary:
- Posts validated: 15 (13 scheduled, 2 published)
- Recently added: 10 posts
- Errors: 0
- Warnings: 1
- Info: 0

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚠️ Warning (1):

Scheduling Conflict Detected

Nov 15, 2025 at 10:00 on Instagram:
- text_home-protection_rev1.md (newly scheduled)
- text_home-emergency_rev1.md (existing)

Instagram posts should be spaced 6+ hours apart.

Suggested fix:
Reschedule one post to:
- Nov 15 at 16:00 (afternoon)
- Nov 16 at 10:00 (next day)

Would you like me to reschedule one of these?
```

**User:** "Yes, move the first one to 16:00"

**Agent:** [Reschedules post and re-validates]

---

## Example 7: Cross-Section Conflict

**User:** "Validate accident-insurance"

**Agent Response:**
```
❌ Calendar Validation: FAILED

Campaign: accident-insurance

🚨 Error (1):

Cross-Section Conflict

Content file appears in BOTH sections:
- text_accident-benefits_rev1.md

Found in:
- scheduled_posts (Nov 15 at 10:00)
- published_posts (published Oct 20)

This post cannot be both scheduled and published.

Fix options:
1. Remove from scheduled_posts (if already published)
2. Remove from published_posts (if needs rescheduling)

Which section should I remove it from?
```

---

## Example 8: Multiple Invalid Dates

**User:** "Validate summer-travel"

**Agent Response:**
```
❌ Calendar Validation: FAILED

Campaign: summer-travel

🚨 Errors (3):

Invalid Date Formats

1. text_travel-tips_rev1.md
   Current: "11/15/2025"
   Required: "2025-11-15"

2. text_travel-insurance_rev1.md
   Current: "2025-11-1"
   Required: "2025-11-01"

3. text_travel-destinations_rev2.md
   Current: "Nov 20, 2025"
   Required: "2025-11-20"

All dates must use YYYY-MM-DD format with zero-padding.

Would you like me to automatically fix these formats?
```

**User:** "Yes, fix them"

**Agent:**
```
✅ Fixed 3 date formats

Updated:
- "11/15/2025" → "2025-11-15"
- "2025-11-1" → "2025-11-01"
- "Nov 20, 2025" → "2025-11-20"

Re-validating...

✅ Calendar Validation: PASSED

All dates now correctly formatted!

Calendar: [file:campaigns/summer-travel/calendar.yaml]
```

---

## Example 9: Missing Files (Batch)

**User:** "Validate all calendars"

**Agent Response:**
```
❌ Calendar Validation: FAILED

🚨 Errors (4): Missing Files

Content files not found:

1. campaigns/summer-travel/calendar.yaml
   - text_old-post_rev1.md
   - text_deleted-post_rev2.md

2. campaigns/home-insurance/calendar.yaml
   - text_archived-content_rev1.md

Media files not found:

3. campaigns/accident-insurance/calendar.yaml
   - video_missing-reel_rev1.mp4

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

These files may have been:
- Deleted
- Moved to different location
- Renamed

Fix options:
1. Remove these entries from calendars
2. Restore the missing files
3. Update file paths if files were moved

Would you like me to remove these entries from the calendars?
```

---

## Example 10: Timezone Validation

**User:** "Validate travel-insurance"

**Agent Response:**
```
✅ Calendar Validation: PASSED

Campaign: travel-insurance

⚠️ Warning (1):

Invalid Timezone

Post: text_travel-promo_rev1.md
Current timezone: "EST"
Valid format: IANA identifier (e.g., "America/New_York")

System will use default: Europe/Budapest

Recommendation: Update to proper IANA timezone for accurate scheduling

Would you like me to fix this?
```

---

## Example 11: Master Calendar Issues

**User:** "Validate all calendars"

**Agent Response:**
```
✅ Calendar Validation: PASSED (with info)

📊 Summary:
- Calendars checked: 5
- Posts validated: 52
- Errors: 0
- Warnings: 0
- Info: 2

ℹ️ Info (2):

1. Campaign Not in Master Calendar
   
   Found calendar: campaigns/test-campaign/calendar.yaml
   Not registered in: calendar/master-calendar.yaml
   
   Recommendation: Add to master calendar for workspace consistency

2. Orphaned Calendar Reference
   
   Master calendar references: campaigns/old-campaign/calendar.yaml
   File doesn't exist
   
   Recommendation: Remove from master calendar or restore file

These don't affect calendar functionality but should be cleaned up.

Would you like me to:
1. Add test-campaign to master calendar
2. Remove old-campaign reference
3. Both
4. Skip
```

---

## Example 12: Format-Platform Mismatches (Batch)

**User:** "Validate all calendars"

**Agent Response:**
```
❌ Calendar Validation: FAILED

🚨 Errors (3): Format-Platform Mismatches

1. campaigns/summer-travel/calendar.yaml
   Post: text_travel-reel_rev1.md
   Platform: facebook
   Format: ig-reel ❌
   
   Instagram formats can't be used on Facebook.
   Use: fb-link-post, fb-text-post, fb-short-video

2. campaigns/home-insurance/calendar.yaml
   Post: text_home-promo_rev1.md
   Platform: instagram
   Format: fb-link-post ❌
   
   Facebook formats can't be used on Instagram.
   Use: ig-reel, ig-carousel, ig-story, ig-image-post

3. campaigns/accident-insurance/calendar.yaml
   Post: text_accident-ad_rev1.md
   Platform: linkedin
   Format: g-search ❌
   
   Google formats can't be used on LinkedIn.
   Use: li-post, li-article

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

These mismatches likely occurred from copy-paste errors.

Would you like me to suggest correct formats for each?
```

---

## Example 13: Status Inconsistencies

**User:** "Validate home-insurance"

**Agent Response:**
```
❌ Calendar Validation: FAILED

🚨 Error (1):

Status Inconsistency

Post: text_home-emergency_rev1.md
Location: scheduled_posts section
Status: "published" ❌

Published posts should be in published_posts section, not scheduled_posts.

Fix options:
1. Move to published_posts section (if actually published)
2. Change status to "scheduled" (if not yet published)

Which is correct?
```

**User:** "It's published, move it"

**Agent:**
```
✅ Fixed!

Moved text_home-emergency_rev1.md from scheduled_posts to published_posts

Re-validating...

✅ Calendar Validation: PASSED

Calendar: [file:campaigns/home-insurance/calendar.yaml]
```

---

## Error Categories Summary

### File Errors
- Content file not found
- Media file not found
- Calendar file not found
- Broken file references

### Format Errors
- Invalid date format
- Invalid time format  
- Invalid YAML syntax
- Missing required fields

### Logic Errors
- Format-platform mismatch
- Invalid platform value
- Invalid format value
- Invalid status value
- Invalid timezone

### Conflict Errors
- Duplicate entries
- Cross-section conflicts (scheduled + published)
- Time conflicts (multiple posts same slot)
- Status inconsistencies

### Warning Conditions
- Past scheduled dates
- Scheduling conflicts
- Missing platform_post_id
- Invalid timezone (non-blocking)

### Info Messages
- Campaigns not in master calendar
- Orphaned calendar references
- Missing recommended fields
