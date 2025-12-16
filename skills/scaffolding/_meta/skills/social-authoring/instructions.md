# Content Authoring Skill - Overview Instructions

## Purpose

The Content Authoring skill generates social media content for Meta, Google, and LinkedIn platforms. It produces standardized markdown files with structured metadata headers and platform-specific content that follows marketing best practices.

## Core Concepts

### Standardized Content Format

All generated social media content follows a consistent structure:

1. **Metadata Header**: Machine-readable fields rendered in markdown
2. **Platform-Specific Body**: Structured content sections based on marketing templates
3. **File Naming Convention**: Consistent, parseable filenames

### File Naming Pattern

Content files follow this pattern:
```
text_[topic-slug]_[context-slug]_rev[n].md
```

Where:
- **topic-slug**: Main subject (required) - use hyphens for multi-word topics
- **context-slug**: Specific angle/timing/variation (optional)
- **revision_number**: Incremental revision (rev1, rev2, etc.)

**Examples**:
- `text_home-insurance-assistance_rev1.md` (no context)
- `text_home-insurance-assistance_gr2_rev1.md` (with context 'gr2')
- `text_travel-insurance-benefits_erste-cc_rev2.md` (context + revision 2)

### Directory Structure

Content is organized by channel, publisher, and format:
```
/campaigns/[campaign-name]/content-assets/[channel]/[publisher]/[format]/
```

**Examples**:
- `/campaigns/summer-travel/content-assets/social/meta/fb-link-post/`
- `/campaigns/home-insurance/content-assets/social/google/g-search/`
- `/campaigns/accident-coverage/content-assets/social/linkedin/li-post/`

### Content Metadata (Markdown Header)

Every content file includes structured metadata using markdown header format:

```markdown
## Post Metadata

**Platform**: facebook|instagram|google|linkedin
**Format**: fb-text-post|ig-reel|g-search|etc
**Topic**: topic-slug
**Revision**: n
**Target Audience**: audience-description
**Objective**: awareness|engagement|conversion|traffic
**CTA URL**: https://example.com/target-page
**Hashtags**: #hashtag1, #hashtag2
**Associated Media**: image_filename.png
**Created**: YYYY-MM-DD
**Updated**: YYYY-MM-DD
**Status**: draft|review|approved|published
```

### Platform-Specific Content Structures

Content body follows platform-specific templates:

**Facebook Text Post**:
- Hook/Opening
- Body
- Call-to-Action

**Instagram Carousel**:
- Caption
- Slide 1 (Cover)
- Slides 2-N (Content)
- Final Slide (CTA)

**Facebook Link Post (AIDA)**:
- Headline/Hook (Attention)
- Body Text (Interest + Desire)
- Call-to-Action (Action)

**LinkedIn Post**:
- Hook (First Line)
- Context (Body)
- The Lesson
- Engagement Prompt

## Capabilities Quick Reference

### create_social_post
**Purpose**: Generate social media content with standardized format

**Required Parameters**:
- workspace_id
- campaign_name
- topic_slug
- platform
- format

**Optional Parameters**:
- context_slug
- revision_number (defaults to 1)
- source_filepaths (array)
- source_urls (array)
- target_audience
- objective
- cta_url
- hashtags
- additional_instructions

**Typical Usage**: "Create a Facebook link post about travel insurance for the summer-travel campaign"

### validate_social_posts
**Purpose**: Validate and fix social post format compliance

**Required Parameters**:
- workspace_id
- scope_type (campaign | file)
- scope_value (campaign name or file path)

**Optional Parameters**:
- auto_fix (boolean, default false)

**Typical Usage**:
- "validate campaign summer-travel"
- "validate file campaigns/summer-travel/.../text_post_rev1.md"

## Content Generation Workflow

1. **Parameter Validation**
   - Verify workspace and campaign exist
   - Validate platform and format combination
   - Check source materials are accessible

2. **Policy/Guide Identification**
   - Read digital-marketing-plan.md
   - Identify platform-specific guidance
   - Locate any campaign-specific strategies

3. **File Path Construction**
   - Build output path following directory structure
   - Generate filename following naming pattern
   - Ensure parent directories exist

4. **Content Generation**
   - Delegate to content_processor sub-agent
   - Include content template reference
   - Specify all metadata requirements
   - Provide source materials and policies

5. **Validation**
   - Verify metadata header is complete
   - Check required fields are present
   - Ensure platform-specific structure is followed

6. **Confirmation**
   - Report success with file reference
   - Suggest next steps (image generation, scheduling)

## Integration with Other Skills

### With Content Scheduling
After content creation, suggest scheduling:
```
"Content created successfully! Would you like to schedule this post?"
```

### With Image Generation
For formats requiring visuals:
```
"This format typically includes images. Shall I generate the visual assets?"
```

### With Source Ingestion
For external sources (FAQs, product docs, competitor pages), use `source-ingestion` to capture summaries into workspace knowledge before drafting.

## Best Practices

1. **Always validate** workspace and campaign before generation
2. **Use consistent naming** following the established pattern
3. **Include all required metadata** in the header section
4. **Follow platform-specific structures** for content body
5. **Reference policies and guides** for brand consistency
6. **Confirm with user** before generating content
7. **Suggest next steps** after successful creation

## Error Handling Patterns

### Workspace/Campaign Not Found
- Verify workspace exists
- List available campaigns
- Suggest creating campaign if needed

### Invalid Platform/Format
- Show supported platforms
- List valid formats for chosen platform
- Provide examples

### Missing Source Materials
- Report which files/URLs are inaccessible
- Suggest alternatives
- Ask user to verify paths

### Policy/Guide Not Found
- Use default digital-marketing-plan.md
- Warn user about missing specific guidance
- Proceed with general best practices

## See Also

- `capabilities/create-social-post.md` - Detailed generation instructions
- `capabilities/validate-social-posts.md` - Format validation and compliance
- `resources/workflow-patterns.md` - Non-trivial creation patterns and behaviors
- `resources/quick-reference.md` - Fast lookup for formats, patterns, and decisions
- Platform structures broken down by platform targeted:
    - Facebook: `resources/platform-content-structures-facebook.md`
    - Instagram: `resources/platform-content-structures-instagram.md`
    - Google (display and search): `resources/platform-content-structures-google.md`
    - LinkedIn: `resources/platform-content-structures-linkedin.md`
    - Cross platform: `resources/platform-content-structures-cross-platform.md`
- Long-form blog articles: `/_meta/skills/blog-authoring`
