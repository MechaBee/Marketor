# Landing Page Authoring Skill

Generate standalone product and service landing pages optimized for conversion. Creates markdown-formatted copy following page authoring best practices.

## Purpose

Create conversion-focused landing pages for products, services, or custom offerings. Unlike campaign content (social/blog), landing pages are standalone assets designed to drive specific actions through structured, persuasive copy.

## Core Concepts

### Landing Pages vs Other Content

**Landing Pages**:
- Standalone product/service pages
- Single conversion goal focused
- NOT linked to campaigns
- Live in `/landing-pages/` root folder
- Optimized for conversion + SEO

**Campaign Content** (social/blog):
- Part of marketing campaigns
- Educational/promotional focus
- Lives in `/campaigns/[name]/`
- Multi-format distribution

### Page Structure

**Modular Sections**:
```
/landing-pages/[page-slug]/
  ├── full-page_rev1.md      # Assembled complete page
  ├── metadata.yaml           # SEO, CTAs, audience
  └── sections/
      ├── hero.md            # Headline, subhead, primary CTA
      ├── benefits.md        # 3-5 key benefits
      ├── features.md        # Detailed features
      ├── social-proof.md    # Testimonials, stats
      ├── how-it-works.md    # 3-step process
      └── cta.md             # Final conversion push
```

**Benefits**:
- Edit sections independently
- Reuse sections across pages
- A/B test variations
- Maintain consistency

### Page Types

**product**: Physical/digital products, SaaS offerings
**service**: Professional services, consulting, support packages
**custom**: Flexible structure for unique needs

### Best Practices Integration

Automatically references system guides:
- `best-practices/content/page-authoring/02_page_structure_and_layout.md`
- `best-practices/content/page-authoring/04_effective_copywriting.md`
- `best-practices/content/page-authoring/05_calls_to_action.md`
- And 8+ other conversion/SEO optimization guides

Use `system_guides_read_operations` to fetch latest guidance during page creation.

## Capabilities

### create_landing_page
Generate new page with conversion-optimized sections

**Required**: page_slug, page_type (product/service/custom)
**Optional**: template_name, target_keywords, cta_urls, custom_sections
**Process**: Select template → Generate sections → Assemble full page → Create metadata

### update_landing_page_section
Modify or optimize specific section

**Required**: page_slug, section_name
**Optional**: new_content, optimization_focus, apply_best_practices
**Process**: Read section → Apply updates/optimization → Regenerate full page

### list_landing_pages
Show all pages with status and metadata

**Optional**: filter_by_type, filter_by_status
**Output**: Table with page names, types, last modified, URLs

## Standard Workflow

```
User requests page → Select template/structure →
Read best practices guides → Generate sections →
Assemble full page → Create metadata →
Suggest next steps (images, review, publish)
```

## Templates

**Built-in**:
- `product-page-template.md` - For products/SaaS
- `service-page-template.md` - For services/consulting

**Custom**: Users can create templates in `/policies/landing-page-templates/`

Templates provide structure guidance and section definitions, not fixed copy.

## Integration Points

**→ image-generation**: Request hero images, feature visuals for sections
**→ system_guides_read_operations**: Auto-fetch page authoring best practices
**NOT integrated**: campaigns, content-scheduling (standalone pages)

## Metadata Schema

```yaml
page_type: product|service|custom
target_keywords: [keyword list]
target_audience: description
primary_cta_url: URL
secondary_cta_url: URL (optional)
status: draft|review|published
seo_title: string
seo_description: string
created_date: YYYY-MM-DD
last_modified: YYYY-MM-DD
```

## Validation Rules

See manifest for complete rules:
- Page slugs: kebab-case
- Sections: Standard 6 sections (customizable)
- Revisions: `_rev1`, `_rev2` for A/B testing
- Status: draft → review → published workflow

## Best Practices

**Conversion First**: Focus on benefits, clear CTAs, single goal per page
**SEO Aligned**: Include target keywords, proper structure, meta descriptions
**Modular Approach**: Edit sections independently, reuse across pages
**Mobile-First**: Write concise, scannable copy (delegates design to implementation)
**Test & Iterate**: Use revisions for A/B tests, optimize based on performance
