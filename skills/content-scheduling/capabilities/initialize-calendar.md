# Capability: Initialize Calendar

Create a new campaign calendar from scratch.

For regular-social calendar, use `brand-onboarding.scaffold_regular_social` capability instead (find it here: _meta/skills/brand-onboarding/skill-manifest.yaml).

Note: Calendar scheduling is a two layer system, there are campaign calendars to manage posting within the scope of a campaign, and there is a master calendar where each campaign calendar has to be registered individually in order to be picked up by supporting processes.

## Parameters

- **campaign** (required): Campaign folder name (must match folder under `/campaigns/`)

## Process

1. **Validate** campaign_id exists as folder, reject "regular-social"
2. **Ensure master calendar** exists (copy from template if missing)
3. **Create campaign calendar** from template at `campaigns/[campaign]/calendar.yaml`
   - Ask before overwriting existing
4. **Register in master calendar** - add entry if missing, update last_updated, take care to merge it into the master calendar not to overwrite it if it already exists at: calendar/master-calendar.yaml

## Result

Creates calendar with empty `posts` array, ready for scheduling:

```yaml
campaign_id: [campaign]
status: active
posts: []
```

Calendar is registered in master calendar (calendar/master-calendar.yaml) for discovery by `list_posts` and `validate_schedule`.

**Mater calendar template**
See this for the required master calendar format if master calendar in `/calendar` folder was not set up yet:
`_meta/skills/content-scheduling/templates/master-calendar-template.yaml`

