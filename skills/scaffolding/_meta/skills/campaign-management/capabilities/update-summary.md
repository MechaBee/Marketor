# Capability: Update Summary

## Purpose

Maintain campaign `summary.md` throughout lifecycle. Track content, status changes, slugs, keywords, and notes.

## Process

1. **Read current summary**: Load `/campaigns/[campaign-name]/summary.md`
2. **Process update** by type (see below)
3. **Update metadata**: Always update "Utolsó frissítés" to current date
4. **Write summary**: Save updated content
5. **Confirm**: Report changes made

## Update Types

### content
Add new content to "Létrehozott Tartalmak" section
- Parse content_file_path to determine type (blog/social/format)
- Create subsection if needed
- Add entry with title, path, status, description, dates, links
- Order chronologically

### status
Change campaign status in "Kampány Metaadatok"
- Validate against: planning, content-creation, review, active, completed, archived
- Update status field
- Add "Aktiválás dátuma" if status → active
- Log change in "Megjegyzések" with timestamp

### slug
Add entries to "Slug Registry"
- Check for duplicates, ask to update description if exists
- Add new slugs with descriptions
- Log addition in "Megjegyzések"

### keyword
Add to "Kulcsszavak" section
- Avoid duplicates
- Maintain bullet list format

### general
Add timestamped note to "Megjegyzések"
- Format: `**YYYY-MM-DD**: [notes]`
- Prepend (most recent first)

## Content Entry Formats

**Blog Post**:
```markdown
#### "[Title]"
* **Fájl**: `[path]`
* **Státusz**: [emoji + text]
* **Tartalom**: [description]
* **Létrehozva**: YYYY-MM-DD
* **Google Drive**: [link](url) (if uploaded)
```

**Social Media**:
```markdown
##### "[Name]"
* **Fájl**: `[path]`
* **Státusz**: [emoji + text]
* **Platform**: [platform]
* **Formátum**: [format]
* **Létrehozva**: YYYY-MM-DD
```

## Status Emojis

✅ Elkészült | ⏳ Folyamatban | 📝 Tervezés alatt | 🔄 Felülvizsgálat alatt | ❌ Még nem kezdődött

## Key Behaviors

**Automatic Tracking**: Other skills can trigger content updates automatically

**Slug Registry**: Document all slugs with clear descriptions for consistency

**Preserve Structure**: Maintain all existing sections when updating

**Timestamp Everything**: Notes, status changes always include dates

## Error Scenarios

**Campaign not found**: List available campaigns, suggest creating first
**Invalid update_type**: Show valid types with descriptions
**Missing parameters**: Request specific required param for update type
**Content file not found**: Warn but allow manual entry
**Corrupted structure**: Offer to backup and regenerate from template

## Integration

→ **social-authoring**: Auto-update summary when content created
→ **content-scheduling**: Track scheduling status in summary
→ **Google Drive upload**: Add links and doc IDs automatically

## Best Practices

- Update immediately after content creation/changes
- Always update "Utolsó frissítés" date
- Use consistent date format (YYYY-MM-DD)
- Use status emojis for visual clarity
- Document all slug additions in registry
- Add notes for significant changes
