# Capability: create_landing_page

## Purpose

Generate new landing page with conversion-optimized sections. Creates modular structure with individual section files, assembled full page, and metadata for SEO/tracking.

## Required Parameters

- **page_slug**: URL-friendly identifier (kebab-case)
- **page_type**: `product`, `service`, or `custom`

## Optional Parameters

- **template_name**: Use specific template from templates/ or policies/
- **page_title**: Override default title generation
- **target_keywords**: Array of SEO keywords
- **target_audience**: Description of target users
- **primary_cta_url**: Main conversion URL
- **secondary_cta_url**: Alternative action URL
- **custom_sections**: Array of additional section names beyond standard 6

## Process

1. **Validate inputs**: Check page_slug format (kebab-case), ensure page doesn't exist
2. **Select template**: Use specified template or default for page_type
3. **Read best practices**: Fetch relevant guides via `system_guides_read_operations`
   - `best-practices/content/page-authoring/02_page_structure_and_layout.md`
   - `best-practices/content/page-authoring/04_effective_copywriting.md`
   - `best-practices/content/page-authoring/05_calls_to_action.md`
4. **Generate sections**: Create each section with conversion-focused copy
   - hero: Headline, subheadline, primary CTA
   - benefits: 3-5 key benefits addressing pain points
   - features: Detailed feature descriptions
   - social-proof: Testimonials/stats structure
   - how-it-works: 3-step process
   - cta: Final conversion push with risk reducers
5. **Assemble full page**: Combine sections into complete markdown document
6. **Create metadata.yaml**: Populate SEO fields, CTAs, tracking info
7. **Confirm**: Report structure created with file references

## Key Behaviors

**Template Resolution**:
- Check `/_meta/skills/landing-page-authoring/templates/[template_name].md`
- Fallback to `/policies/landing-page-templates/[template_name].md`
- Default to page_type template (product-page-template.md or service-page-template.md)

**Best Practices Application**:
- Headlines: Benefit-driven, clear value proposition
- Copy: Concise, scannable, benefit over features
- CTAs: Action-oriented, visible, single primary goal
- Structure: Logical flow, above-fold optimization

**Section Generation**:
- Each section focuses on conversion stage (awareness → consideration → decision)
- Use persuasive frameworks (AIDA, PAS, etc.)
- Include placeholder tags for images: `[hero-image: description]`
- Maintain consistent voice/tone across sections

**Metadata Population**:
- Derive SEO title from page_title + target_keywords
- Generate meta description from benefits
- Set status to `draft`
- Include creation timestamp

## Folder Structure Created

```
/landing-pages/[page-slug]/
  ├── full-page_rev1.md
  ├── metadata.yaml
  └── sections/
      ├── hero.md
      ├── benefits.md
      ├── features.md
      ├── social-proof.md
      ├── how-it-works.md
      └── cta.md
```

## Error Scenarios

**Page exists**: List existing versions, suggest new slug or revision
**Invalid slug**: Show correct format, suggest conversion
**Template not found**: List available templates, offer default
**Missing best practices**: Warn but proceed with built-in guidance

## Integration

→ **image-generation**: After creation, suggest generating hero/feature visuals with `generate_image`
→ **system_guides**: Auto-fetch during generation for current best practices

## Output Format

Report created structure with file references, key metadata, and suggested next steps:
- Review generated content
- Request visual assets
- Optimize specific sections
- Create A/B test variant (_rev2)
