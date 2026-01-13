# Cadence Report - Key Examples

Examples showing cadence report output formats and edge case handling.

---

## Example 1: Basic Report - On Track

**User:** "Are we on track this week?"

**Response:**

```
Cadence Report: Jan 6-12, 2025

Platform Status:
| Platform   | Target  | Actual | Status      |
|------------|---------|--------|-------------|
| facebook   | 3-5     | 4      | On target   |
| instagram  | 4-7     | 5      | On target   |
| linkedin   | 2-3     | 2      | On target   |
| twitter    | 5-10    | 7      | On target   |
| google     | 0-2     | 1      | On target   |

Total posts: 19

Objective Mix:
| Objective        | Target | Actual | Status    |
|------------------|--------|--------|-----------|
| engagement       | 40%    | 42%    | On target |
| awareness        | 20%    | 21%    | On target |
| traffic          | 20%    | 16%    | -4%       |
| conversion       | 15%    | 16%    | On target |
| thought-leadership| 5%    | 5%     | On target |

All platform targets met! Minor shortfall in traffic content.
```

---

## Example 2: Basic Report - Gaps Identified

**User:** "Check posting frequency"

**Response:**

```
Cadence Report: Jan 13-19, 2025

Platform Status:
| Platform   | Target  | Actual | Status      | Gap    |
|------------|---------|--------|-------------|--------|
| facebook   | 3-5     | 2      | Below min   | +1     |
| instagram  | 4-7     | 3      | Below min   | +1     |
| linkedin   | 2-3     | 3      | On target   | -      |
| twitter    | 5-10    | 2      | Below min   | +3     |
| google     | 0-2     | 0      | On target   | -      |

Total posts: 10

Objective Mix:
| Objective        | Target | Actual | Status    |
|------------------|--------|--------|-----------|
| engagement       | 40%    | 60%    | +20%      |
| awareness        | 20%    | 10%    | -10%      |
| traffic          | 20%    | 20%    | On target |
| conversion       | 15%    | 10%    | -5%       |
| thought-leadership| 5%    | 0%     | -5%       |

Gaps identified:
- Facebook: 1 more post needed
- Instagram: 1 more post needed
- Twitter: 3 more posts needed
- Too much engagement content, need more awareness/conversion

Use review_drafts to find content ready to schedule.
```

---

## Example 3: Detailed Report

**User:** "Cadence report for last week, detailed"

**Response:**

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
| Day | Posts | Platforms                    |
|-----|-------|------------------------------|
| Mon | 4     | FB(1), IG(1), TW(2)         |
| Tue | 3     | FB(1), IG(1), LI(1)         |
| Wed | 5     | FB(1), IG(2), TW(2)         |
| Thu | 4     | FB(1), IG(1), LI(1), TW(1)  |
| Fri | 3     | FB(1), IG(1), TW(1)         |
| Sat | 1     | TW(1)                        |
| Sun | 1     | TW(1)                        |

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

---

## Example 4: Platform-Only Report (No Objective Mix Configured)

**User:** "Weekly posting status"

**Response:**

```
Cadence Report: Jan 6-12, 2025

Platform Status:
| Platform   | Target  | Actual | Status      |
|------------|---------|--------|-------------|
| facebook   | 3-5     | 4      | On target   |
| instagram  | 4-7     | 5      | On target   |
| linkedin   | 2-3     | 2      | On target   |
| twitter    | 5-10    | 6      | On target   |
| google     | 0-2     | 1      | On target   |

Total posts: 18

Objective mix not configured. Use configure_cadence to set up
objective tracking for content balance insights.
```

---

## Example 5: Posts Missing Objective Metadata

**User:** "Detailed cadence report"

**Response:**

```
Cadence Report: Jan 6-12, 2025
Detail Level: Detailed

=== PLATFORM BREAKDOWN ===

| Platform   | Target | Actual | Status    |
|------------|--------|--------|-----------|
| facebook   | 3-5    | 4      | On target |
| instagram  | 4-7    | 5      | On target |
...

=== OBJECTIVE MIX ===

| Objective    | Target | Actual | Count |
|--------------|--------|--------|-------|
| engagement   | 40%    | 33%    | 5     |
| awareness    | 20%    | 20%    | 3     |
| traffic      | 20%    | 13%    | 2     |
| conversion   | 15%    | 7%     | 1     |
| thought-leadership| 5%| 0%     | 0     |
| unspecified  | -      | 27%    | 4     |

Posts missing objective metadata (4):
- campaigns/summer-travel/content-assets/social/facebook/fb-link-post/text_promo_rev1.md
- campaigns/summer-travel/content-assets/social/instagram/ig-reel/text_beach_rev1.md
- regular-social/2025-M01/twitter/tw-post/text_tips_rev1.md
- regular-social/2025-M01/twitter/tw-post/text_quote_rev1.md

Consider updating these content files with objective metadata for
accurate cadence tracking.
```

---

## Example 6: No Cadence Targets Configured

**User:** "Are we on track?"

**Response:**

```
Cadence targets not configured.

To set up cadence tracking:
1. Use configure_cadence to create targets interactively
2. Or copy template from _meta/skills/content-scheduling/templates/cadence-targets-template.yaml
   to /policies/cadence-targets.yaml

Example: "Set Facebook cadence to 3-5 posts per week"
```

---

## Example 7: No Posts in Week

**User:** "Cadence report for next week"

**Response:**

```
Cadence Report: Jan 20-26, 2025

Platform Status:
| Platform   | Target  | Actual | Status      | Gap    |
|------------|---------|--------|-------------|--------|
| facebook   | 3-5     | 0      | Below min   | +3     |
| instagram  | 4-7     | 0      | Below min   | +4     |
| linkedin   | 2-3     | 0      | Below min   | +2     |
| twitter    | 5-10    | 0      | Below min   | +5     |
| google     | 0-2     | 0      | On target   | -      |

Total posts: 0

No posts scheduled for this week yet.

Use review_drafts to find content ready to schedule, or
schedule_post to add specific posts.
```
