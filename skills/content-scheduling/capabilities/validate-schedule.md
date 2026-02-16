# Capability: Validate Schedule

Check calendar integrity, detect errors and conflicts.

## Parameters

- **campaign_id** (optional): Specific campaign or "regular-social". If omitted, validates all.

## Validation Checks

**Errors (must fix):**
- Check the existance and registration of campaign calendar in master calendar
- Campaign Calendar is not registered in master calendar
- Content/media files missing
- Invalid date/time/platform/format values
- Invalid YAML syntax
- Duplicate content_file entries

**Warnings (review):**
- Time conflicts (multiple posts same time/platform)
- Past dates with status scheduled/draft
- Published posts missing platform_url

**Info:**
- Campaigns not in master calendar

## Process

1. **Determine scope** - specific campaign or all from master calendar
2. **Parse calendars** - report syntax errors
3. **Validate each post** in posts array:
   - Files exist (content + media)
   - Values match manifest validation_rules
   - Status-specific fields present
4. **Detect conflicts** - duplicates, time overlaps, past dates
5. **Generate report** - PASS/FAIL with grouped errors, warnings, suggestions

## Example

**User:** "Validate all calendars"

**Response:**
```
PASSED (6 calendars, 47 posts)

Warnings:
1. Time Conflict (summer-travel)
   Nov 15 10:00 Facebook: 2 posts scheduled
   Fix: Space 1-2 hours apart

2. Past Date (home-insurance)
   text_home-emergency_rev1.md scheduled Oct 20 (today: Oct 25)
   Fix: Mark published/failed or reschedule
```

## Notes

- Past-dated scheduled posts are warnings (user may have published but not marked)
- Continue validating other calendars if one fails
- Always include `[file:path]` references for navigation

See `resources/validate-schedule-examples.md` for error scenarios.

See the required master calendar format in:
`_meta/skills/content-scheduling/templates/master-calendar-template.yaml`

