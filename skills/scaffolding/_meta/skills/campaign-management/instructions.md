# Campaign Management Skill - Overview

## Purpose

Manage campaign lifecycle from idea capture through creation and maintenance. Provides systematic operations for organizing campaigns with proper structures, metadata tracking, and documentation.

## Core Concepts

### Lifecycle Phases

**Idea** → `/campaign-ideas/` → Lightweight concept capture
**Campaign** → `/campaigns/` → Full structure with summary.md
**Content** → Populate assets, tracked in summary
**Maintenance** → Ongoing summary updates

### Naming System

**Idea files**: `idea-[name].md`
**Campaign folders**: `[base-name]` or `[base-name]-[slug]`
**Slugs**: Enable variations (e.g., `product-campaign-limits`, `product-campaign-benefits`)

### Campaign Structure

```
/campaigns/[name]/
  ├── summary.md              # Central tracking document
  ├── knowledge/              # Background materials
  ├── content-assets/         # Generated content
  │   ├── social/meta/
  │   ├── social/google/
  │   ├── social/linkedin/
  │   └── blog/
  ├── topic-strategies/       # Campaign-specific guides
  └── prompts/                # Saved prompts
```

### Summary Sections

See `/policies/campaign-summary-template.md` for full template.

Key sections:
- **Metaadatok**: ID, dates, status
- **Áttekintés**: Campaign description
- **Célcsoport**: Target audience
- **Slug Registry**: All slugs with descriptions
- **Létrehozott Tartalmak**: Content inventory
- **Teljesítmény/Státusz**: Progress tracking

**Status values**: planning → content-creation → review → active → completed → archived

### Slug Types

**Topic**: Main subject (e.g., `product-feature`)
**Context**: Variation/grouping (e.g., `segment-a`, `q1-2025`)
**Format**: Platform-specific (e.g., `ig-reel`, `blog-post`)

All slugs documented in Slug Registry with descriptions.

## Capabilities

### create_idea
Capture concepts in `/campaign-ideas/`
- Required: campaign_idea_name, campaign_description
- Optional: target_audience, key_messages, potential_angles, status_notes
- Behavior: Normalize to kebab-case, check duplicates, suggest campaign creation

### create_campaign
Scaffold full structure from idea or description
- Required: idea_name_or_description
- Optional: campaign_slug (for variations)
- Behavior: Read template, create folders, generate summary, suggest next steps

### update_summary
Maintain summary throughout lifecycle
- Required: campaign_name, update_type (content|status|slug|keyword|general)
- Optional: Varies by update_type
- Behavior: Update relevant sections, timestamp changes, preserve structure

## Common Workflows

### Quick Start
1. `create_idea` → Create idea file
2. `create_campaign` → Scaffold structure
3. Upload to knowledge/, generate content
4. `update_summary` → Track progress

### Campaign Variations
One idea → Multiple campaigns with slugs:
- `create_campaign` base-idea → `campaigns/base-name/`
- `create_campaign` base-idea slug:"variant-a" → `campaigns/base-name-variant-a/`

### No Existing Idea
`create_campaign` with description → Auto-creates idea for consistency → Scaffolds campaign

## Integration Points

**→ social-authoring**: Auto-update summary when content created
**→ content-scheduling**: Track scheduling in summary
**→ blog-authoring**: Add blog posts to summary
**→ System guides**: Reference `/system/how-to/how-to-campaign-creation-workflow.md`

## Validation Rules

See manifest for complete rules. Key points:
- Names: kebab-case
- Summary required sections: See template
- Status transitions: Logical progression
- Slugs: Document in registry immediately

## Best Practices

**Naming**: Auto-convert to kebab-case, confirm with user
**Ideas**: Create even for quick campaigns (consistency)
**Slugs**: Use for variations vs creating new base names
**Summary**: Update immediately after changes
**File refs**: Always use `[file:path]` format
**Templates**: Read from `/policies/`, fallback if missing
