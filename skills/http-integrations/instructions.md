# HTTP Integrations Skill

HTTP-based integrations for ingesting external sources and publishing content to connected platforms.

## Which Capability?
| Goal | Capability | Example |
|------|------------|---------|
| Summarize external source into knowledge | `summarize_external_source` | "Summarize this FAQ page into campaign knowledge" |
| Publish content to WordPress | `upload_wordpress_post` | "Publish this draft to my WordPress blog" |
| Manage WordPress sites | `manage_wordpress_sites` | "Add my blog site config for WordPress" |

## Core Concepts

**Target Path** – Always confirm where summaries should be written (campaign knowledge vs general knowledge).

**Site Resolution** – For WordPress, infer the target site from the dialog or use the config file if no URL is provided.

**Safe Defaults** – Default WordPress status to `draft` unless the user explicitly requests publish.

**Config Maintenance** – Store WordPress site settings in `_meta/wordpress-sites.yaml` and update entries on request.

## Configuration

**WordPress site config** (user-managed):
- Path: `_meta/wordpress-sites.yaml`
- Template: `_meta/skills/http-integrations/templates/wordpress-sites.yaml`
- Required fields per site: `posts_url`, `auth_profile`

**Auth profiles** (user-managed, not readable by the agent):
- Use the profile name in `auth_profile` when calling the HTTP request tool.

## Tools
- `workspace_read_operations` – Inspect knowledge, drafts, and config files.
- `workspace_write_operations` – Save summaries or responses to workspace paths.
- `http_request` – Execute HTTP integrations (e.g., WordPress).
- `web_ingest_operations` (optional) – Retrieve page content when available.
- `system_guides_read_operations` (optional) – Pull best-practice guidance.

## See Also
- `/_meta/skills/brand-onboarding` – Uses research outputs to bootstrap a workspace.
- `/_meta/skills/campaign-management` – Organize ingested knowledge per campaign.
