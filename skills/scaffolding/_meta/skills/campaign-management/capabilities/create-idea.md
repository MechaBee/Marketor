# Capability: Create Idea

## Purpose

Capture campaign concepts in `/campaign-ideas/` folder before full development. Enables lightweight ideation without creating full campaign structures.

## Process

1. **Validate & normalize** campaign_idea_name to kebab-case
2. **Check existence**: If idea file exists, ask user to update, rename, or review
3. **Generate structured markdown** with provided parameters (see Template below)
4. **Write** to `/campaign-ideas/idea-[name].md`
5. **Confirm** and suggest next steps (refine idea or create campaign)

## Idea File Template

```markdown
# Campaign Idea: [Formatted Title]

## Overview
[campaign_description]

## Target Audience
[target_audience or "TBD"]

## Key Messages
[key_messages as bullets or "TBD"]

## Potential Content Angles
[potential_angles or "TBD"]

## Status
[status_notes or "New idea - not yet implemented"]

## Metadata
- **Created**: YYYY-MM-DD
- **Status**: planning
- **Campaign ID**: [campaign_idea_name]

## Notes
[Space for additional notes]
```

## Key Behaviors

**Name Normalization**: Convert any format to kebab-case (e.g., "Travel FAQ" → "travel-faq")

**Existing Ideas**: Present 3 options: update, create different name, or review first

**Iterative Refinement**: Support updating existing ideas by reading, modifying sections, preserving structure

**Next Steps**: After creation, suggest creating campaign structure or refining idea further

## Error Scenarios

**Invalid name format**: Suggest corrected kebab-case version
**Idea exists**: Show snippet, offer update/rename/review
**Insufficient description**: Request more detail about topic, audience, and approach
**Write failure**: Report error, suggest creating campaign-ideas folder if missing

## Integration

→ **create_campaign**: Natural next step after idea registration
→ **System guides**: Reference `/system/how-to/how-to-develop-campaign-ideas-with-ai.md` for collaborative development tips

## Best Practices

- Convert names to kebab-case automatically, confirm with user
- Use `[file:path]` format for all file references
- Capture creation date for tracking
- Format arrays (key_messages, target_audience) as bullet lists
- Always offer to create campaign immediately after registration
