# Schedule Post - Key Examples


## Essential content examples:

  Example: Draft post (content ready, not yet scheduled)
   - content_file: content-assets/social/instagram/ig-reel/text_example_rev1.md
     media_files:  # Optional - list of associated media files RELATIVE to the post file
       - media/video_example_rev1.mp4
     platform: instagram  # facebook | instagram | google | linkedin
     format: ig-reel  # Platform-specific format (fb-link-post, ig-reel, g-search, etc.)
     scheduled_date: "2025-11-01"  # YYYY-MM-DD
     scheduled_time: "10:00"  # HH:MM (24-hour format)
     timezone: "Europe/Budapest"  # IANA timezone identifier
     status: draft  # draft | scheduled | published | failed

   Example: Scheduled post (ready for manual publishing)
   - content_file: content-assets/social/facebook/fb-link-post/text_example_rev1.md
     media_files:
       - media/image_example_rev1.png
     platform: facebook
     format: fb-link-post
     scheduled_date: "2025-11-15"
     scheduled_time: "18:00"
     timezone: "Europe/Budapest"
     status: scheduled

  # Example: Published post (user reported successful manual publish)
   - content_file: content-assets/social/linkedin/li-post/text_example_rev1.md
     media_files:
       - media/image_example_rev1.png
     platform: linkedin
     format: li-post
     scheduled_date: "2025-10-20"
     scheduled_time: "10:00"
     timezone: "Europe/Budapest"
     status: published
     published_date: "2025-10-20T10:00:00Z"  # ISO 8601 - added when published
     platform_post_id: "li_123456789"  # User-provided platform ID
     platform_url: "https://linkedin.com/posts/123456789"  # User-provided URL



## Essential scenarios showing non-obvious behavior. Basic scheduling is covered in the capability doc.

### Example 1: Already Scheduled Conflict

**User:** "Schedule text\_travel-tips\_rev1.md for November 15th at 10 AM on Facebook"

**Response:**

```
This content is already scheduled:
- Platform: Facebook
- Date: November 10, 2025 at 14:00
- Status: scheduled

Options:
1. Reschedule to November 15 at 10:00
2. Cancel existing schedule
3. Keep existing

What's your preference?
```

***

### Example 2: Time Conflict with Another Post

**User:** "Schedule the travel destinations post for November 15th at 10 AM on Facebook"

**Response:**

```
Scheduling conflict:

Already scheduled at Nov 15, 10:00 Facebook:
- text_travel-insurance_rev1.md

Facebook posts should be spaced 4+ hours apart.

Alternatives:
1. Nov 15 at 14:00 (afternoon)
2. Nov 16 at 10:00 (next day)
3. Proceed anyway (both at 10:00)

What's your preference?
```

***

### Example 3: Ambiguous Content Reference

**User:** "Schedule the accident insurance post for November 20th"

**Response:**

```
Found multiple matches:
1. text_accident-benefits_rev1.md (Facebook)
2. text_accident-benefits_rev2.md (Facebook)
3. text_accident-coverage_rev1.md (Instagram)

Which one? (number, topic, or platform)
```

***

### Example 4: Calendar Doesn't Exist

**User:** "Schedule the new campaign post for December 1st"

**Response:**

```
Campaign 'new-campaign' doesn't have a calendar yet.

Create one? (yes/no)
```

After "yes":

```
Calendar created: campaigns/new-campaign/calendar.yaml
Post scheduled for Dec 1, 2025.
```

***

### Example 5: Multi-Step Resolution

**User:** "Schedule the insurance post for next Friday"

**Agent:** "Which campaign: home, accident, or travel?"
**User:** "Home"
**Agent:** "Found 2 posts: home-protection and home-emergency. Which one?"
**User:** "Protection"
**Agent:** "Platform: Facebook or Instagram?"
**User:** "Facebook"
**Agent:** "Time on Friday, November 1st?"
**User:** "10am"

**Response:**

```
Scheduled!
Content: text_home-protection_rev1.md
Platform: Facebook (fb-link-post)
Scheduled: November 1, 2025 at 10:00
```
