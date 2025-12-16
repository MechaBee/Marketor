# Capability: list_landing_pages

## Purpose

Display all landing pages in workspace with metadata, status, and quick access information.

## Parameters

All parameters are optional:
- **filter_by_type**: Show only `product`, `service`, or `custom` pages
- **filter_by_status**: Show only `draft`, `review`, or `published` pages

## Process

1. **Read landing pages folder**: List all directories in `/landing-pages/`
2. **Read metadata**: Load `metadata.yaml` from each page
3. **Apply filters**: If specified, filter by type or status
4. **Format output**: Create table with key information
5. **Sort**: By last_modified (most recent first)

## Output Format

Table with columns:
- **Page Name** (clickable file reference)
- **Type** (product/service/custom)
- **Status** (draft/review/published)
- **Last Modified** (YYYY-MM-DD)
- **Primary CTA** (URL or description)
- **Revisions** (count of rev files)

Example:
```
Landing Pages (3 total)

| Page | Type | Status | Modified | CTA | Revs |
|------|------|--------|----------|-----|------|
| [file:landing-pages/product-a/] | product | published | 2025-10-28 | /pricing | 2 |
| [file:landing-pages/service-consulting/] | service | draft | 2025-10-25 | /contact | 1 |
```

## Key Behaviors

**Empty workspace**: Suggest creating first landing page
**No matches**: Show available filters, suggest removing filter
**Quick actions**: Suggest common next steps based on status

## Error Scenarios

**No landing pages**: Provide example command to create first page
**Metadata missing**: Show page but flag as "needs metadata"

## Output

Provide count, table, and contextual suggestions based on results
