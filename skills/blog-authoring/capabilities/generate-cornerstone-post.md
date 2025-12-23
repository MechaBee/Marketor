# Capability: generate_cornerstone_post

Produce comprehensive, long-form cornerstone/pillar blog content (3,500-5,000+ words) that synthesizes multiple knowledge sources into strategic, SEO-optimized articles using a two-phase planning workflow.

## When to Use
- User requests cornerstone content, pillar articles, or comprehensive guides.
- Content requires synthesizing multiple knowledge sources.
- Target word count exceeds 3,000 words.
- Content needs detailed chapter structure with strategic flow.
- Article serves as authoritative reference or foundational content.

Content lives under:
- `campaigns/[campaign-name]/content-assets/blog/[publisher-domain]/blog-post/`
- OR `blog-standalone/[topic-name]/`

## Required Parameters
- `workspace_id` – Workspace identifier (defaults to current workspace).
- `campaign_name` – Campaign folder under `/campaigns` (or "standalone" for non-campaign blogs).
- `topic_slug` – Core subject slug (drives filename and metadata).
- `publisher_domain` – Blog publisher directory (e.g., `mechabee_com`).
- `source_filepaths` – Array of workspace documents to synthesize (minimum 2 recommended).

## Optional Parameters
- `source_urls` – External URLs to ingest and incorporate.
- `context_slug` – Variant identifier (omit if not needed).
- `revision_number` – Defaults to 1; increment per new draft.
- `chapter_count` – Target number of chapters (default: 10-13).
- `target_word_count` – Target length (default: 3500-4500).
- `target_audience` – Reader profile to guide tone.
- `objective` – awareness | engagement | conversion | thought-leadership.
- `seo_keywords` – Primary terms/phrases to emphasize.
- `tone` – Writing voice (e.g., authoritative, educational, consultative).
- `cta_url` – Primary call-to-action destination.
- `additional_instructions` – Extra guidance from the user.
- `hero_asset_requirements` – Notes for future image generation.
- `plan_output_path` – Where to save chapter plan (default: `campaigns/[campaign]/temp/blog-chapter-plan.md`).

## Output Path Convention

**Final blog post:**
```
campaigns/[campaign_name]/content-assets/blog/[publisher_domain]/blog-post/
  text_[topic-slug]_[context-slug]_rev[n].md
```

**Chapter plan (intermediate):**
```
campaigns/[campaign_name]/temp/blog-chapter-plan.md
```

If `context_slug` is omitted, drop that segment. Confirm directories exist and create them only with user approval.

## Two-Phase Workflow

### Phase 1: Chapter Planning

1. **Gather All Source Materials**
   - Read all files in `source_filepaths` array.
   - Ingest any `source_urls` if provided.
   - Read global policy: `/policies/digital-marketing-plan.md`.
   - Find authoring guides: `/policies/blog-*-authoring-guide.md`.
   - Find campaign knowledge: `/campaigns/[campaign_name]/knowledge/`.

2. **Analyze Content Scope**
   - Identify key themes across all sources.
   - Determine natural chapter divisions.
   - Map content to user's objectives and SEO keywords.
   - Consider target audience expertise level.

3. **Generate Chapter Plan**
   - Create structured outline with:
     - Chapter number and title.
     - Chapter purpose and value proposition.
     - Key points to cover (3-5 per chapter).
     - Recommended word count per chapter.
     - Source material references for each chapter.
   - Include introduction and conclusion chapters.
   - Add metadata section with article overview.

4. **Save Plan for Review**
   - Write chapter plan to `plan_output_path`.
   - Use clear markdown formatting with sections for each chapter.
   - Include estimated total word count and reading time.

5. **Present to User**
   - Show file reference to chapter plan.
   - Summarize structure (number of chapters, flow, word count).
   - **Request explicit approval before Phase 2.**
   - Offer to adjust plan based on feedback.

### Phase 2: Content Generation

**Only proceed after user approval of chapter plan.**

1. **Prepare Content Brief**
   - Compile comprehensive instruction for `content_processor` sub-agent.
   - Include:
     - Workspace ID.
     - Chapter plan file path.
     - All source file paths.
     - All source URLs.
     - Target output file path.
     - Detailed formatting and style requirements.
     - SEO keywords and CTA instructions.
     - Metadata requirements.

2. **Delegate to content_processor**
   - Invoke `content_processor` sub-agent with:
     ```
     workspace_id: [workspace_id]
     source_filepaths: 
       - [chapter_plan_path]
       - [source_file_1]
       - [source_file_2]
       - ...
     source_urls: [if any]
     target_filepath: campaigns/[campaign]/content-assets/blog/[publisher]/blog-post/text_[topic]_rev[n].md
     instruction: |
       Create a comprehensive cornerstone blog post following the chapter plan.
       
       CHAPTER PLAN: [chapter_plan_path]
       
       REQUIREMENTS:
       - Follow chapter structure exactly as outlined in the plan
       - Target word count: [target_word_count]
       - Tone: [tone]
       - Target audience: [target_audience]
       - SEO keywords to integrate naturally: [keywords]
       - Include CTA at end pointing to: [cta_url]
       
       FORMAT:
       - Use markdown with clear heading hierarchy
       - Include metadata section under '## Post Metadata' header
       - Use this format for metadata:
         **Platform**: blog
         **Format**: blog-post
         **Topic**: [topic_slug]
         **Target Audience**: [audience]
         **Objective**: [objective]
         **Created**: [YYYY-MM-DD]
         **Status**: draft
         **SEO Keywords**: [keywords]
       
       STYLE:
       - Authoritative and comprehensive
       - Natural keyword integration
       - Examples and real-world applications
       - Logical flow between chapters
       - Strong intro hook and compelling CTA
       
       Save output to: [target_filepath]
     ```

3. **Monitor Execution**
   - Wait for sub-agent completion.
   - Capture any error messages.

4. **Verify Saved Output**
   - After sub-agent reports completion, verify file exists.
   - Read the generated file from target path.
   - Check file size (should be 3,500+ words / ~20,000+ characters).

5. **Quality Review**
   - Confirm metadata block with all required fields.
   - Verify chapter structure matches plan.
   - Check SEO keyword integration.
   - Validate CTA inclusion and clarity.
   - Review intro hook and conclusion strength.
   - Ensure source material properly synthesized.

6. **Confirm & Recommend Next Steps**
   - Summarize completion with file reference.
   - Report word count and structure.
   - Suggest follow-ups:
     - Generate hero image for article.
     - Create social media promotional content.
     - Generate chapter-specific images.
     - Plan content distribution strategy.
     - Update campaign summary.

## Quality Checklist

**Structure:**
- [ ] Metadata section under '## Post Metadata' with all required fields
- [ ] Chapter structure matches approved plan
- [ ] Logical flow between chapters
- [ ] Introduction hooks reader and sets context
- [ ] Conclusion reinforces key takeaways

**Content:**
- [ ] Word count meets target (3,500+ words)
- [ ] All source materials synthesized effectively
- [ ] No contradictions between sources
- [ ] Examples and real-world applications included
- [ ] Technical accuracy verified

**SEO & Conversion:**
- [ ] SEO keywords appear naturally in headings and body
- [ ] Compelling CTA with clear value proposition
- [ ] Internal structure supports featured snippets
- [ ] Readability appropriate for target audience

**Compliance:**
- [ ] Tone aligns with policy guidance
- [ ] Brand voice consistent throughout
- [ ] Claims supported by source material
- [ ] No contradictions with marketing plan

## Content Format: Markdown (with Metadata Header)

Generated content uses this structure (no YAML frontmatter):

```markdown
# [Post Title]

## Post Metadata

**Platform**: blog
**Format**: blog-post
**Topic**: [topic-slug]
**Context**: [context-slug or N/A]
**Revision**: [n]
**Target Audience**: [audience description]
**Objective**: [content objective]
**Created**: [YYYY-MM-DD]
**Status**: [draft|review|published]
**SEO Keywords**: [kw1, kw2, kw3, ...]
**Word Count**: [approximate count]

---

## Introduction

[Hook and context-setting introduction]

## [Chapter 1 Title]

[Chapter 1 content]

## [Chapter 2 Title]

[Chapter 2 content]

...

## Conclusion

[Key takeaways and summary]

## Call to Action

[CTA text with link to cta_url]

## Notes

[Optional internal notes]
```

## Difference from generate_blog_post

| Aspect | Standard Blog | Cornerstone Blog |
|--------|--------------|------------------|
| **Word count** | 800-1,600 | 3,500-5,000+ |
| **Sources** | 1-2 files | 2+ files synthesized |
| **Workflow** | Single phase | Two-phase (plan → generate) |
| **Sub-agent** | blog_content_author | content_processor |
| **User control** | Minimal | Review plan before generation |
| **Structure** | Simple sections | Multi-chapter with briefs |
| **Purpose** | Regular content | Pillar/authoritative reference |

## Error Handling

**Phase 1 Errors:**
- **Missing source files**: Verify all paths exist before planning; list available files if not found.
- **Missing directories**: Ask before creating temp/ or blog-post/ folders.
- **Insufficient source material**: Warn if fewer than 2 sources; suggest additional materials.

**Phase 2 Errors:**
- **User rejection of plan**: Adjust based on feedback and regenerate plan.
- **Sub-agent failure**: Capture error message, simplify instructions, consider breaking into smaller sections.
- **Missing output file**: Check path, verify write permissions, retry with explicit path confirmation.
- **Incomplete generation**: Check word count; if under target, provide feedback and request expansion.
- **Write conflicts**: Negotiate revision number change with user, retry.

**Recovery strategies:**
- Save chapter plan separately for reference.
- If generation fails, attempt chapter-by-chapter generation.
- Offer to split into multiple shorter posts if content too complex.

## Best Practices

1. **Source Quality**: Ensure source materials are comprehensive and authoritative.
2. **Chapter Planning**: Spend time on Phase 1 to create clear, logical structure.
3. **User Involvement**: Always get approval before heavy generation work.
4. **Sub-agent Instructions**: Be explicit about formatting, metadata, and file paths.
5. **Verification**: Always verify output file exists and meets quality standards.
6. **Follow-up**: Suggest complete content ecosystem (images, social, distribution).

## Related References

- Standard blog capability: `generate-blog-post.md`
- Authoring guides: `/policies/blog-*-authoring-guide.md`
- Outline guides: `/policies/blog-*-outline-guide.md`
- Campaign knowledge: `/campaigns/[campaign_name]/knowledge/`
- Content processor sub-agent: For multi-source synthesis
- Image generation skill: For hero and chapter images
- Social authoring skill: For promotional content

## Example Usage

**User request:**
> "Create a comprehensive cornerstone article about Vibe Marketing for the MechaBee blog. Use the digitalfirst article and our Marketor landing page as sources."

**Agent workflow:**
1. Identifies cornerstone blog request (comprehensive, multiple sources)
2. Reads source files
3. Creates chapter plan with 13 chapters
4. Saves plan to `campaigns/vibe-marketing/temp/blog-chapter-plan.md`
5. Presents plan to user with structure summary
6. Waits for approval
7. After approval: delegates to content_processor with full brief
8. Verifies output at `campaigns/vibe-marketing/content-assets/blog/mechabee_com/blog-post/text_vibe-marketing-guide_rev1.md`
9. Confirms 4,500+ word article with proper structure
10. Suggests hero image generation and social promotion
