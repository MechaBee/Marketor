# Capability: Create Campaign

## Purpose

Scaffold complete campaign structure from an idea or description. Creates folder hierarchy and `summary.md` ready for content development.

## Process

1. **Identify source**: Determine if idea_name_or_description is existing idea or new description
2. **Derive campaign name**: Remove "idea-" prefix or convert description to kebab-case
3. **Apply slug** (if provided): Create `[base-name]-[slug]` for variations
4. **Check existence**: If campaign exists, offer alternative slug or archive existing
5. **Read template**: Load `/policies/campaign-summary-template.md` (use fallback if missing)
6. **Create folders**: Standard structure (see below)
7. **Generate summary**: Populate template with idea data or description
8. **Write summary.md**: Save to campaign root
9. **Confirm**: Report created structure with file references and suggest next steps

## Folder Structure

```
/campaigns/[campaign-name]/
  ├── summary.md
  ├── knowledge/
  ├── content-assets/
  │   ├── social/meta/
  │   ├── social/google/
  │   ├── social/linkedin/
  │   └── blog/
  ├── topic-strategies/
  └── prompts/
```

## Key Behaviors

**From Idea File**:
- List available ideas if not found
- Extract description, target audience, key messages from idea
- Preserve idea file after campaign creation

**From Description**:
- Recommend creating idea file first for consistency
- Derive campaign name from description (confirm with user)
- Optionally skip idea file if user prefers

**Campaign Slugs**:
- Allow multiple variations: `base-name`, `base-name-slug1`, `base-name-slug2`
- Example: One idea → multiple campaigns with different angles

**Template Handling**:
- Read `/policies/campaign-summary-template.md`
- Use fallback structure if template missing
- Populate: campaign name, dates, status=planning, content from idea

## Summary Population

**From idea file**: Extract and map to summary sections
**From description**: Use description in "Áttekintés", set other sections to "TBD"
**Always set**:
- Státusz: planning
- Létrehozva & Utolsó frissítés: current date
- Campaign ID: folder name

## Error Scenarios

**Campaign exists**: Offer different slug, work with existing, or archive first
**Idea not found**: List available ideas, offer to create idea first, or proceed without
**Template missing**: Warn user, use fallback structure
**Folder creation fails**: Report which folders succeeded/failed, offer retry

## Integration

→ **create_idea**: Seamless flow from idea registration to campaign creation
→ **update_summary**: Summary maintenance begins after creation
→ **Content skills**: After creation, suggest generating first content

## Best Practices

- Always list available ideas to help user choose
- Use slug for variations rather than separate names
- Confirm derived names with user before creating
- Report comprehensive details with `[file:path]` references
- Suggest specific next steps based on campaign state
