# Capability: Validate Schedule

## When to Use

User wants to check calendar integrity, detect errors, conflicts, and inconsistencies.

**Trigger patterns:**
- "validate calendar"
- "check calendar for errors"
- "calendar errors"

**Don't use when:**
- User wants to VIEW scheduled posts (use `list_posts`)
- User wants to SCHEDULE posts (use `schedule_post` or `review_drafts`)

## Parameters

- **campaign_id** (optional): Validate specific campaign or "regular-social"
  - If omitted: Validates all campaigns AND regular-social
  - Can be campaign name OR "regular-social"
  - Use for focused validation after updates

## What Gets Validated

See `skill-manifest.yaml` validation_rules for formats, platforms, and status values.

### Critical Errors (Must Fix)
- Content files missing
- Media files missing
- Invalid date/time formats
- Invalid platform/format values
- Format-platform mismatch
- Invalid YAML syntax
- Duplicate entries
- Posts in both scheduled and published sections

### Warnings (Should Review)
- Scheduling conflicts (multiple posts same time/platform)
- Past scheduled dates with "scheduled" status
- Invalid timezone (will use default)
- Published posts missing platform_post_id

### Info (Nice to Have)
- Missing platform_post_id for tracking
- Campaigns not in master calendar
- Orphaned calendar files

## High-Level Process

### 1. Determine Scope

**If campaign_id provided:**
- Validate that campaign/calendar only
- For campaigns: `campaigns/[campaign_id]/calendar.yaml`
- For regular-social: `regular-social/calendar.yaml`

**If campaign_id NOT provided:**
- Read master calendar
- Validate all campaigns AND regular-social calendar

### 2. Read and Parse Calendars

For each calendar:
- Read file using workspace_read_operations
- Parse YAML (if parse fails, report syntax error)
- Verify required fields exist (campaign_id, status, scheduled_posts)

### 3. Validate Posts

For each post in scheduled_posts and published_posts:
- **Files**: Verify content file and media files exist
  - For campaigns: Resolve paths relative to campaign folder
  - For regular-social: Resolve paths relative to `regular-social/` folder
- **Platform/Format**: Check against manifest validation_rules
- **Dates/Times**: Verify formats and validity
- **Status**: Check valid and consistent with section
- **Timezone**: Validate IANA identifier if provided
- **Regular-social specific**: Validate `month_folder` field format (YYYY-M## or "evergreen")

### 4. Detect Conflicts

- **Duplicates**: Same content_file_path multiple times in scheduled_posts
- **Cross-section**: Content in both scheduled and published
- **Time conflicts**: Multiple posts same date/time/platform (warning)
- **Past dates**: Scheduled posts with past dates (warning)

### 5. Cross-Calendar Checks (if all campaigns)

- Verify campaigns in master calendar
- Detect orphaned calendars not in master

### 6. Generate Report

Report overall status (PASS/FAIL):
- **PASS**: No errors (warnings/info OK)
- **FAIL**: One or more errors found

Include:
- Summary statistics
- Detailed error list with file references
- Warnings and recommendations
- Info messages
- Suggested fixes

## Key Behaviors

**Continue on Error:**
If one calendar fails to read/parse, log error but continue validating others.

**Specific File References:**
Always include file paths using `[file:path]` format for easy navigation.

**Actionable Suggestions:**
For each error, suggest specific fix (not just "fix this").

**Severity Levels:**
- Errors: Block publishing, must fix
- Warnings: Review recommended, not blocking
- Info: Nice to have, informational only

**Grouped Reporting:**
Group similar errors together, don't repeat same message multiple times.

## Example Interaction

**User:** "Validate all calendars"

**Agent:**
```
Validating 5 campaigns...

✅ PASSED

📊 Summary:
- Calendars: 5 checked
- Posts: 47 validated (42 scheduled, 5 published)
- Errors: 0 | Warnings: 2 | Info: 1

⚠️ Warnings:

1. Scheduling Conflict (summer-travel)
   Nov 15 at 10:00 on Facebook:
   - text_travel-tips_rev1.md
   - text_travel-insurance_rev1.md
   Fix: Space posts 1-2 hours apart

2. Past Scheduled Date (home-insurance)
   text_home-emergency_rev1.md scheduled for Oct 20
   (Today: Oct 25)
   Fix: Reschedule or mark as published

All calendars valid and ready!

Review warnings: [file references]
```

See `resources/validate-schedule-examples.md` for detailed examples including failed validations, syntax errors, and complex scenarios.

## Error Handling

**Campaign not found:** List available campaigns

**Calendar file not found:** Offer to create from template

**Invalid YAML syntax:** Show error location, offer to fix or recreate

**No calendars found:** Suggest creating first campaign

## Integration Points

**After `schedule_post`:** Validate to catch errors immediately

**After `review_drafts`:** Validate bulk scheduled posts

**Before `mark_published`:** Ensure calendar integrity before publishing

**With master calendar:** Verify campaign registration

## File References

**Validation rules:** `/_meta/skills/content-scheduling/skill-manifest.yaml`
**Detailed examples:** `/_meta/skills/content-scheduling/resources/validate-schedule-examples.md`
**Calendar template:** `/_meta/skills/content-scheduling/templates/campaign-calendar-template.yaml`
