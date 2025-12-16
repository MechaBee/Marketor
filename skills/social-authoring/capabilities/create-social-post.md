# Capability: Create Social Post

## When to Use

User wants to generate social media content for Facebook, Instagram, Google, or LinkedIn platforms.

**Trigger patterns:**
- "create post for [platform]"
- "generate [platform] content"
- "write social post about [topic]"

**Don't use when:**
- User wants to SCHEDULE existing content (use `schedule_post`)
- User wants to LIST content (different capability)

## Required Parameters

- **workspace_id**: Workspace identifier (e.g., `xybank`, `default`)
- **campaign_name**: Campaign folder name (must exist in `/campaigns/`)
- **topic_slug**: Main subject identifier (use hyphens, e.g., `travel-insurance-benefits`)
- **platform**: facebook | instagram | google | linkedin
- **format**: Platform-specific format (see manifest validation_rules)

## Optional Parameters

- **context_slug**: Specific angle/timing/variation (e.g., `gr2`, `spring-prep`)
- **revision_number**: Revision number (default: 1)
- **source_filepaths**: Workspace paths to reference materials
- **source_urls**: External URLs to crawl for information
- **target_audience**: Description (e.g., `young-travelers`, `homeowners-30-50`)
- **objective**: awareness | engagement | conversion | traffic (default: engagement)
- **cta_url**: Call-to-action URL
- **hashtags**: Array of hashtags
- **additional_instructions**: Extra guidance for content generation

## High-Level Process

### 1. Validate Context

Verify workspace, campaign exists, platform/format valid, source materials exist.

### 2. Construct File Path

Build path and filename:
```
campaigns/[campaign]/content-assets/social/[platform]/[format]/
text_[topic]_[context]_rev[n].md
```

Example:
```
campaigns/[variable-campaign-name]/content-assets/social/facebook/fb-link-post/
text_travel-insurance-benefits_erste-cc_rev1.md
```

### 3. Check Existing Content

If file exists, ask user: create new revision, overwrite, use different context, or cancel.

### 4. Gather Policies and Guides

Read:
- Main strategy: `policies/digital-marketing-plan.md`
- Campaign strategies: `campaigns/[campaign]/topic-strategies/*.md`
- Content template: `_meta/skills/social-authoring/templates/social-post-template.md`

### 5. Delegate to Content Processor

Pass comprehensive instructions to `content_processor` sub-agent with:
- All parameters and requirements
- Source materials (files and URLs)
- Policy documents
- Template structure
- Platform-specific requirements
  - include appropriate "Platform specific guides" workspace file reference

### 6. Validate Generated Content

Check:
- Metadata section is complete and parseable
- Content structure follows template
- Platform-specific sections exist
- CTAs and hooks present

### 7. Auto-Validate Format (Optional)

If auto_validate enabled, run format validation:
- Validate file structure against standards
- Report any format issues
- Offer to fix non-conforming structure

### 8. Confirm and Suggest Next Steps

Report success with file reference, suggest: generate images, schedule post, create variations, or review content.

## Content Format: Markdown with Metadata Header

Generated content uses this structure (no YAML frontmatter):
```markdown
# [Post Title/Hook]

## Post Metadata

**Platform**: facebook
**Format**: fb-link-post
**Topic**: [variable-topic]
**Context**: erste-cc
**Revision**: 1
**Target Audience**: [variable-audience]
**Objective**: engagement
**CTA URL**: https://example.com/products/
**Hashtags**: #TravelInsurance, #YourBrand, #SafeTravel
**Associated Media**: media/image_[variable-topic]_rev1.png
**Created**: 2025-10-28
**Status**: draft

---

## Post Content

[Main post text with platform-specific formatting]

## Call to Action

[CTA text and link]

## Notes

[Optional internal notes, testing results, etc.]
```

## Key Behaviors

**Path Construction:**
Use consistent naming: `text_[topic]_[context]_rev[n].md`

**Revision Handling:**
If file exists, offer to increment revision number automatically.

**Source Integration:**
Read workspace files, crawl URLs, incorporate into content generation context.

**Policy Compliance:**
Always reference and apply brand guidelines and content strategies.

**Platform Optimization:**
Generate content appropriate for platform's style, length, and audience.

**Quality Validation:**
Check metadata completeness, structure compliance, CTA presence before confirming.

## Example Interaction

**User:** "Create a Facebook post about travel insurance for the summer-travel campaign"

**Agent:**
```
[Validates workspace, campaign, platform]
[Constructs path: campaigns/summer-travel/content-assets/social/facebook/fb-link-post/]
[Checks no existing content]
[Reads policies and strategies]
[Delegates to content_processor]
[Validates generated content]

✅ Social media content created!

File: [file:campaigns/summer-travel/content-assets/social/facebook/fb-link-post/text_travel-insurance_rev1.md]

Platform: Facebook (fb-link-post)
Topic: travel-insurance
Target Audience: young-travelers
Objective: engagement

Next steps:
- Generate images: "create image for this post"
- Schedule: "schedule this post for Nov 15"
- Create variations: "create Instagram version"
- Review: Open file to edit
```

See `resources/workflow-patterns.md` for non-trivial patterns.

## Error Handling

**Campaign not found:** List available campaigns

**Invalid platform/format:** Show supported values from manifest

**Source files missing:** List which files not found

**File already exists:** Offer revision, overwrite, or cancel options

**Content validation failed:** Report specific issues, offer to regenerate

## Integration Points

**With content_processor:** Delegates actual content generation

**With validate_social_posts:** Auto-validate format compliance after creation (if enabled)

**After creation:** Suggest scheduling with `schedule_post`

**With policies:** Always reads and applies brand guidelines

**With templates:** Uses platform-specific content structures

## Content Quality Requirements

Generated content must have:
- Complete metadata section
- Platform-appropriate structure
- Engaging hook/title
- Clear call-to-action
- Appropriate tone for platform and audience
- Relevant, optimized hashtags
- Mobile-friendly formatting
- Brand voice consistency

## File References

**Validation rules:** `/_meta/skills/social-authoring/skill-manifest.yaml`
**Quick reference:** `/_meta/skills/social-authoring/resources/quick-reference.md`
**Workflow patterns:** `/_meta/skills/social-authoring/resources/workflow-patterns.md`
**Platform specific guides:**
    - Meta (facebook and instagram): `/_meta/skills/social-authoring/resources/platform-content-structures-meta.md`
    - Google (display and search): `/_meta/skills/social-authoring/resources/platform-content-structures-google.md`
    - LinkedIn: `/_meta/skills/social-authoring/resources/platform-content-structures-linkedin.md`
    - Cross platform: `/_meta/skills/social-authoring/resources/platform-content-structures-cross-platform.md`
**Strategy guide:** `/policies/digital-marketing-plan.md`
