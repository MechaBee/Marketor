# Capability: Initialize Calendar

## When to Use

User wants to create a new campaign calendar from scratch.

**Note**: For 'regular-social' calendar, use the `brand-onboarding` skill's `scaffold_regular_social` capability instead.

## Process

### Creating a New Campaign Calendar

#### 1. Validate Inputs

- Confirm `campaign_id` (should match the folder name under `/campaigns/`)
- If `campaign_id == "regular-social"`: stop and use `brand-onboarding.scaffold_regular_social` instead

#### 2. Ensure Master Calendar Exists

- Check `/calendar/master-calendar.yaml`
  - If missing: copy `/_meta/skills/content-scheduling/templates/master-calendar-template.yaml` to `/calendar/master-calendar.yaml`
  - Replace `last_updated: "[CURRENT_DATE]"` with today's date (YYYY-MM-DD)

#### 4. Create Campaign Calendar

- Copy `/_meta/skills/content-scheduling/templates/campaign-calendar-template.yaml` to `campaigns/[campaign_id]/calendar.yaml`
  - If `campaigns/[campaign_id]/calendar.yaml` already exists: ask user before overwriting
- Set the calendar header:
  ```yaml
  campaign_id: [campaign_id]
  status: active
  ```

#### 5. Register Campaign Calendar in Master Calendar (Required)

- Read `/calendar/master-calendar.yaml` and ensure `campaigns` list exists
- If an entry for `campaign_id` already exists:
  - Verify `calendar_file` matches `campaigns/[campaign_id]/calendar.yaml`
  - If it differs, ask user whether to update master calendar
- If missing, append:
  ```yaml
  - campaign_id: [campaign_id]
    calendar_file: campaigns/[campaign_id]/calendar.yaml
    status: active
    type: campaign
  ```
- Update master calendar `last_updated` to today's date

## Regular-Social Calendar

Regular-social calendar uses a different workflow:
- Created by `scaffold_regular_social` capability in brand-onboarding skill
- Located at `regular-social/calendar.yaml`
- Registered in master calendar with `type: regular`
- Do NOT use this capability for regular-social - it will be auto-created
