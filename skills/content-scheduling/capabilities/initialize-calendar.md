# Capability: Initialize Calendar

Create a new campaign calendar from scratch.

For regular-social calendar, use `brand-onboarding.scaffold_regular_social` instead.

## Parameters

- **campaign** (required): Campaign folder name (must match folder under `/campaigns/`)

## Process

1. **Validate** campaign_id exists as folder, reject "regular-social"
2. **Ensure master calendar** exists (copy from template if missing)
3. **Create campaign calendar** from template at `campaigns/[campaign]/calendar.yaml`
   - Ask before overwriting existing
4. **Register in master calendar** - add entry if missing, update last_updated

## Result

Creates calendar with empty `posts` array, ready for scheduling:

```yaml
campaign_id: [campaign]
status: active
posts: []
```

Calendar is registered in master for discovery by `list_posts` and `validate_schedule`.
