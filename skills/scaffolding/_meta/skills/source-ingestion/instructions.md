# Source Ingestion Skill

Ingest and summarize external sources (URLs / documents) into reusable workspace knowledge files.

## Which Capability?
| Goal | Capability | Example |
|------|------------|---------|
| Summarize external source into knowledge | `summarize_external_source` | "Summarize this FAQ page into campaign knowledge" |

## Core Concepts

**Target Path** – Always confirm where the summary should be written (campaign knowledge vs general knowledge).

**Structured Output** – Produce markdown with clear sections so downstream skills can reference it.

## Tools
- `workspace_read_operations` – Inspect existing knowledge and policies.
- `workspace_write_operations` – Save summaries into workspace paths.
- `web_ingest_operations` (optional) – Retrieve page content when available.
- `system_guides_read_operations` (optional) – Pull best-practice guidance.

## See Also
- `/_meta/skills/brand-onboarding` – Uses research outputs to bootstrap a workspace.
- `/_meta/skills/campaign-management` – Organize ingested knowledge per campaign.

