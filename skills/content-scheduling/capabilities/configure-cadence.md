# Capability: Configure Cadence

Set up or modify weekly posting frequency targets per platform and optional objective mix.

For checking progress against targets, use `cadence_report` instead.

## Parameters

**Optional:**

* `platform`: Single platform to update (facebook, instagram, linkedin, twitter, google)
* `weekly_min`: Minimum posts per week for platform
* `weekly_max`: Maximum posts per week for platform
* `objective`: Single objective type to update (awareness, engagement, conversion, traffic, thought-leadership)
* `target_percentage`: Target percentage for objective (0-100)
* `notes`: Platform or objective-specific notes

See manifest `validation_rules.cadence_rules` for valid values.

## Process

1. **Check cadence file** - Look for `/policies/cadence-targets.yaml`
2. **Create if missing** - Offer to create from template at `_meta/skills/content-scheduling/templates/cadence-targets-template.yaml`
3. **Read current targets** - Load existing platform and objective_mix settings
4. **Determine update scope**:
   * Platform only → update platforms section
   * Objective only → update objective_mix section
   * Both → update both sections
   * Neither specified → show current settings and offer interactive setup
5. **Apply changes** - Update specified values, preserve unspecified
6. **Validate**:
   * Platform: weekly_min <= weekly_max
   * Objectives: warn if percentages don't sum to ~100 (allow anyway)
7. **Confirm** with summary of changes and file reference

## Key Behaviors

* Creates `/policies/` directory if it doesn't exist
* Validates platform names against `validation_rules.supported_platforms`
* Validates objective names against `validation_rules.cadence_rules.supported_objectives`
* Preserves existing settings when updating single platform or objective
* Updates `last_updated` field with current date
* Warns but allows objective percentages that don't sum to 100
* Shows current configuration when no parameters provided

## Example

**User:** "Set Facebook cadence to 3-5 posts per week"

**Response:**

```
Updated cadence targets:

Platform: Facebook
- Weekly minimum: 3
- Weekly maximum: 5
- Notes: (unchanged)

File: [file:policies/cadence-targets.yaml]

Use cadence_report to check progress against these targets.
```

---

**User:** "Increase engagement content to 50%"

**Response:**

```
Updated objective mix:

Objective: engagement
- Target: 50% (was 40%)
- Notes: (unchanged)

Current mix totals 105% - consider adjusting other objectives.

File: [file:policies/cadence-targets.yaml]
```

---

**User:** "Configure my posting cadence"

**Response:**

```
Current cadence targets:

Platforms:
| Platform   | Min | Max | Notes                    |
|------------|-----|-----|--------------------------|
| facebook   | 3   | 5   | Engagement posts mid-week|
| instagram  | 4   | 7   | Mix of reels/carousel    |
| linkedin   | 2   | 3   | Thought leadership       |
| twitter    | 5   | 10  | Higher frequency         |
| google     | 0   | 2   | Ad campaigns as needed   |

Objective Mix:
| Objective        | Target | Notes                |
|------------------|--------|----------------------|
| awareness        | 20%    | Brand building       |
| engagement       | 40%    | Community interaction|
| conversion       | 15%    | Sales/signup CTAs    |
| traffic          | 20%    | Website drivers      |
| thought-leadership| 5%    | LinkedIn expertise   |

What would you like to change?
```

## Error Handling

| Error | Response |
|-------|----------|
| Invalid platform | Show valid platforms from manifest |
| Invalid objective | Show valid objectives: awareness, engagement, conversion, traffic, thought-leadership |
| weekly_min > weekly_max | "Minimum (X) cannot exceed maximum (Y). Please adjust." |
| Percentage > 100 | "Percentage must be 0-100. You specified X%." |
| File permission error | "Cannot write to /policies/. Check workspace permissions." |
| Policies dir missing | Create directory automatically, then proceed |

## File References

* Manifest: `_meta/skills/content-scheduling/skill-manifest.yaml`
* Template: `_meta/skills/content-scheduling/templates/cadence-targets-template.yaml`
* Target file: `/policies/cadence-targets.yaml`
