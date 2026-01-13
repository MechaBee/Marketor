# Capability: Cadence Report

Generate a report comparing cadence targets vs actual scheduled/published posts for a week, including optional objective mix analysis.

For setting or modifying targets, use `configure_cadence` instead.

## Parameters

**Optional:**

* `week_start_date`: Monday of target week (YYYY-MM-DD). Defaults to current week's Monday.
* `detail_level`: `basic` (default) or `detailed`
* `include_objectives`: Include objective mix analysis. Defaults to true if objective_mix is configured.

## Process

1. **Load cadence targets** from `/policies/cadence-targets.yaml`
2. **Handle missing targets** - If file doesn't exist, prompt to use `configure_cadence` first
3. **Determine week range** - Calculate Monday 00:00 to Sunday 23:59 (ISO week)
4. **Load master calendar** - Read `/calendar/master-calendar.yaml` to get all calendar locations
5. **Query all calendars**:
   * Each campaign calendar from master calendar
   * Regular-social calendar at `/regular-social/calendar.yaml`
6. **For each post in week** (where `status` = `scheduled` OR `published`):
   * Count by platform
   * Read content file to extract `**Objective**:` from `## Post Metadata`
   * Count by objective type
7. **Compare against targets**:
   * Platform counts vs weekly_min/weekly_max
   * Objective distribution vs target_percentage
8. **Generate report** based on detail_level
9. **Suggest actions** if gaps identified

## Report Formats

### Basic Report

Platform summary table with status indicators:
* Below minimum
* On target (between min and max)
* Above maximum

Objective mix summary (if configured):
* Current distribution vs targets
* Highlights significant deviations (>10% off target)

### Detailed Report

Everything in basic, plus:
* Breakdown by calendar source (which campaign/regular-social)
* Daily distribution (posts per day of week)
* Objective breakdown per platform
* List of posts with missing objective metadata

## Key Behaviors

* **Week definition**: ISO week, Monday 00:00 to Sunday 23:59, Europe/Budapest timezone
* **Post counting**: Only `scheduled` and `published` statuses count
* **Objective extraction**: Reads content file, parses `## Post Metadata` section for `**Objective**:` field
* **Missing objectives**: Posts without objective metadata counted as "unspecified"
* **Performance**: Caches content file reads within single report generation
* **Empty calendars**: Gracefully handles campaigns with no posts in target week

## Example

**User:** "Are we on track this week?"

**Response (basic):**

```
Cadence Report: Jan 6-12, 2025

Platform Status:
| Platform   | Target  | Actual | Status      |
|------------|---------|--------|-------------|
| facebook   | 3-5     | 4      | On target   |
| instagram  | 4-7     | 2      | Below min   |
| linkedin   | 2-3     | 3      | On target   |
| twitter    | 5-10    | 0      | Below min   |
| google     | 0-2     | 1      | On target   |

Total posts: 10

Objective Mix:
| Objective   | Target | Actual | Status      |
|-------------|--------|--------|-------------|
| engagement  | 40%    | 50%    | +10%        |
| awareness   | 20%    | 20%    | On target   |
| traffic     | 20%    | 10%    | -10%        |
| conversion  | 15%    | 20%    | +5%         |
| thought-leadership | 5% | 0%  | -5%         |

Gaps identified:
- Instagram: 2 more posts needed to meet minimum
- Twitter: 5 more posts needed to meet minimum
- Traffic content: Consider adding 1-2 link posts

Use review_drafts to find content ready to schedule.
```

---

**User:** "Cadence report for last week, detailed"

**Response (detailed):**

```
Cadence Report: Dec 30 - Jan 5, 2025
Detail Level: Detailed

=== PLATFORM BREAKDOWN ===

| Platform   | Target | Actual | Status    | Gap  |
|------------|--------|--------|-----------|------|
| facebook   | 3-5    | 5      | On target | -    |
| instagram  | 4-7    | 6      | On target | -    |
| linkedin   | 2-3    | 2      | On target | -    |
| twitter    | 5-10   | 8      | On target | -    |
| google     | 0-2    | 0      | On target | -    |

Total: 21 posts

By Source:
- summer-travel campaign: 8 posts
- home-insurance campaign: 6 posts
- regular-social: 7 posts

Daily Distribution:
| Day | Posts |
|-----|-------|
| Mon | 4     |
| Tue | 3     |
| Wed | 5     |
| Thu | 4     |
| Fri | 3     |
| Sat | 1     |
| Sun | 1     |

=== OBJECTIVE MIX ===

| Objective        | Target | Actual | Count |
|------------------|--------|--------|-------|
| engagement       | 40%    | 38%    | 8     |
| awareness        | 20%    | 24%    | 5     |
| traffic          | 20%    | 19%    | 4     |
| conversion       | 15%    | 14%    | 3     |
| thought-leadership| 5%    | 5%     | 1     |

Objective by Platform:
| Platform  | awareness | engagement | conversion | traffic | thought-leadership |
|-----------|-----------|------------|------------|---------|-------------------|
| facebook  | 1         | 3          | 1          | 0       | 0                 |
| instagram | 3         | 2          | 0          | 1       | 0                 |
| linkedin  | 0         | 1          | 0          | 0       | 1                 |
| twitter   | 1         | 2          | 2          | 3       | 0                 |

Posts missing objective metadata: 0

All targets met! Great week.
```

## Error Handling

| Error | Response |
|-------|----------|
| No cadence targets file | "Cadence targets not configured. Use configure_cadence to set up targets first." |
| No calendars found | "No calendars found in workspace. Use initialize_calendar to create one." |
| Invalid week_start_date | "Date must be YYYY-MM-DD format and should be a Monday. Did you mean [nearest Monday]?" |
| Invalid detail_level | "detail_level must be 'basic' or 'detailed'" |
| Content file unreadable | Count post but mark objective as "unreadable" in detailed report |
| No posts in week | Show report with all zeros, suggest scheduling content |

## Integration Points

* **After report**: Use `review_drafts` to find content to fill gaps
* **After report**: Use `schedule_post` to add specific posts
* **Before report**: Use `configure_cadence` to set or adjust targets
* **Related**: Use `list_posts` to see detailed post information

## File References

* Manifest: `_meta/skills/content-scheduling/skill-manifest.yaml`
* Cadence targets: `/policies/cadence-targets.yaml`
* Master calendar: `/calendar/master-calendar.yaml`
* Campaign calendars: `/campaigns/*/calendar.yaml`
* Regular-social calendar: `/regular-social/calendar.yaml`
