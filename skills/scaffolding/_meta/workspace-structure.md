# Marketor Workspace Structure
---

## Directory Structure

```
/
  ├── _meta/                      # Workspace metadata and skills
  │   └── skills/                 # Agent skill modules
  ├── calendar/                   # Master calendar  
  ├── policies/                   # Marketing strategies and guides
  ├── campaign-ideas/             # Lightweight campaign concepts
  ├── campaigns/                  # Campaign-specific content
  │   └── [campaign-name]/
  │       ├── knowledge/          # Background materials
  │       ├── content-assets/     # Generated content
  │       ├── topic-strategies/   # Campaign strategies
  │       ├── prompts/            # Saved LLM prompts
  │       └── summary.md          # Progress tracking
  ├── regular-social/             # Non-campaign social content
  │   ├── 2025-M01/              # Monthly folders
  │   ├── 2025-M02/
  │   ├── ...
  │   ├── 2025-M12/
  │   ├── evergreen/             # Timeless content
  │   └── README.md
  ├── blog-standalone/           # Standalone blog content / no campaign associated
  |   └── [topic-slug]/
  │       ├── [text files]        # blog post revisions according to text file naming patterns
  |       ├── media/              # media folder with associated generated images and prompts
  │       └── knowledge/          # Background materials
  ├── landing-pages/              # Standalone product pages
  │   └── [page-slug]/
  │       ├── full-page_rev[n].md
  │       ├── metadata.yaml
  │       └── sections/
  ├── archived-campaigns/         # Archived campaigns
  └── tmp/                        # Temporary files
```

---

## Key Directories

### `/policies/`
Marketing strategies, brand guidelines, and content policies that apply across all campaigns and content.

**Contents:**
- Brand voice and tone guidelines
- Platform-specific strategies
- Content authoring policies
- SEO guidelines

### `/campaign-ideas/`
Lightweight campaign concepts before full campaign creation.

**File format:** `idea-[name].md`

### `/campaigns/[name]/`
Full campaign content with deep nested structure.

**Subdirectories:**
- `knowledge/` - Background research and materials
- `content-assets/` - Generated content organized by channel/publisher/format
- `topic-strategies/` - Campaign-specific strategies
- `prompts/` - Saved LLM prompts
- `summary.md` - Campaign progress tracking

**Content organization:**
```
content-assets/
  ├── social/
  │   ├── meta/              # Facebook, Instagram
  │   │   ├── fb-link-post/
  │   │   ├── fb-text-post/
  │   │   ├── fb-short-video/
  │   │   ├── ig-reel/
  │   │   ├── ig-carousel/
  │   │   ├── ig-story/
  │   │   └── ig-image-post/
  │   ├── google/            # Google Ads
  │   │   ├── g-search/
  │   │   ├── g-display/
  │   │   └── g-pmax/
  │   └── linkedin/
  └── blog/
      └── [domain]/
          └── blog-post/
```

### `/regular-social/`
Non-campaign social media content organized by month.

**Purpose:** Routine, scheduled social posts not tied to specific campaigns.

**Organization:**
- Monthly folders: `2025-M01/` through `2025-M12/`
- Evergreen folder: `evergreen/` for timeless content
- Format subdirectories in each month (same as campaigns)

**Key differences from campaigns:**
- No campaign summary needed
- Monthly organization instead of campaign-specific
- Supports evergreen content library
- Simpler structure for routine posting

**See:** [file:regular-social/README.md] for detailed usage

### `/landing-pages/[page-slug]/`
Standalone product and service landing pages (not campaign-linked).

**Structure:**
- `full-page_rev[n].md` - Complete page content
- `metadata.yaml` - SEO, CTAs, configuration
- `sections/` - Modular sections for editing

### `/archived-campaigns/`
Completed or inactive campaigns moved from `/campaigns/`.

---

## File Naming Conventions

### Text Files
```
text_[topic-slug]_[context-slug]_rev[n].md
```

**Components:**
- `text_` - File type prefix
- `[topic-slug]` - Main subject (required, use hyphens)
- `[context-slug]` - Angle/variation (optional, use hyphens)
- `rev[n]` - Revision number (required)

**Examples:**
```
text_home-insurance-winter_rev1.md
text_travel-tips-summer_erste-cc_rev1.md
text_customer-testimonial_maria_rev2.md
```

### Image Files
```
image_[topic-slug]_[context-slug]_rev[n].[ext]
```

**Examples:**
```
image_home-insurance-winter_rev1.png
image_travel-tips-summer_rev1.jpg
image_accident-prevention_infographic_rev1.png
```

### Naming Rules

✅ **DO:**
- Use lowercase letters
- Use hyphens (-) to separate words
- Be descriptive but concise
- Include revision numbers
- Use consistent topic slugs

❌ **DON'T:**
- Use spaces or special characters
- Use dates in filenames (use folder structure)
- Create overly long slugs
- Skip revision numbers

---

## Content Channels and Publishers

### Channels
- **social** - Social media platforms
- **blog** - Blog content

### Publishers / platforms
- **Meta** - Facebook, Instagram
- **Google** - Google Ads
- **LinkedIn** - LinkedIn platform
- **Own website** - [URL] blog

### Formats

**Meta:**
- fb-link-post, fb-text-post, fb-short-video
- ig-reel, ig-carousel, ig-story, ig-image-post

**Google:**
- g-search, g-display, g-pmax, g-discovery

**Blog:**
- blog-post

**Landing Pages:**
- product, service, custom

---

## Workflow Patterns

### Campaign Lifecycle

1. **Idea Phase**
   - Create: `/campaign-ideas/idea-[name].md`
   - Document concept, goals, target audience

2. **Campaign Creation**
   - Create: `/campaigns/[name]/` (remove 'idea-' prefix)
   - Set up folder structure

3. **Knowledge Upload**
   - Add background: `/campaigns/[name]/knowledge/`
   - Research, competitor analysis, product info

4. **Content Generation**
   - Create assets: `/campaigns/[name]/content-assets/[channel]/[publisher]/[format]/`
   - Follow naming conventions

5. **Progress Tracking**
   - Update: `/campaigns/[name]/summary.md`
   - Track completion, performance, learnings

### Regular Social Workflow

1. **Monthly Planning**
   - Review calendar and themes
   - Plan content mix across formats

2. **Content Creation**
   - Create in: `/regular-social/[YYYY-M##]/[format]/`
   - Follow naming conventions

3. **Evergreen Library**
   - Build timeless content: `/regular-social/evergreen/`
   - Reuse when needed

---

## Best Practices

### Organization

1. **Separate concerns**: Use campaigns for time-bound initiatives, regular-social for routine posts
2. **Consistent naming**: Follow conventions strictly for easy discovery
3. **Version control**: Use revision numbers to track iterations
4. **Document progress**: Update summary.md for campaigns

### File Management

1. **Keep related files together**: Text and images in same format folder
2. **Use descriptive slugs**: Make content discoverable
3. **Archive old content**: Move completed campaigns to archived-campaigns/
4. **Clean up regularly**: Remove unused drafts and temporary files

### Content Strategy

1. **Balance formats**: Use variety of post types
2. **Align with calendar**: Plan content around key dates
3. **Leverage evergreen**: Build reusable content library
4. **Cross-reference**: Link related content across folders

---

## Integration Points

### Skills System
Agent capabilities are modular and discoverable via `/_meta/skills/`

**Available skills:**
- brand-onboarding
- social-authoring
- blog-authoring
- campaign-management
- landing-page-authoring
- image-generation
- source-ingestion
- content-scheduling

### External Systems
- Google Drive integration for document sharing
- Social media scheduling platforms
- Analytics and reporting tools

---

## Maintenance

### Monthly Tasks
- Review previous month's content performance
- Archive completed campaigns
- Plan next month's regular social content
- Update evergreen library

### Quarterly Tasks
- Audit workspace structure
- Clean up temporary files
- Review and update policies
- Consolidate learnings

---

## Questions and Support

For questions about:
- **Content strategy**: See `/policies/`
- **Campaign management**: See campaign-specific `summary.md`
- **Regular social**: See [file:regular-social/README.md]
- **Platform guidelines**: See system guides
- **Skills and capabilities**: See `/_meta/skills/`

---

**Document Version:** 1.0  
**Last Updated:** 2025-12-13  
**Maintained by:** Mechabee / Marketor Team
