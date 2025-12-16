# Capability: generate_blog_post

Produce a long-form blog article that follows workspace conventions, leverages campaign knowledge, and satisfies SEO and conversion goals.

## When to Use
- User requests a blog article, long-form guide, or editorial content.
- Content may live under:
   - `campaigns/[campaign-name]/content-assets/blog/[publisher-domain]/blog-post/`.
   -OR-
   - '`blog-standalone/[topic-name]/`'.
   depending on whether the blog is created inside a campaign or stands on it's own.
- The blog should incorporate campaign knowledge, policy guidance, or user-provided outlines.

Parameters that form the instruction for the sub agent.

## Required Parameters
- `workspace_id` – Workspace identifier. It defaults to the current workspace id set in the context.
- `campaign_name` – Campaign folder under `/campaigns`.
- `topic_slug` – Core subject slug (drives filename and metadata).
- `publisher_domain` – Blog publisher directory (e.g., `hubsopt_com`).

## Optional Parameters
- `context_slug` – Variant identifier (omit if not needed).
- `revision_number` – Defaults to 1; increment per new draft.
- `source_filepaths` – Workspace documents to reference (policies/guides/referenced knowledge).
- `source_urls` – External sources the agent has to ingest when creating the blog content.
- `target_audience` – Reader profile to guide tone.
- `objective` – awareness | engagement | conversion | traffic.
- `seo_keywords` – Terms/phrases to emphasize.
- `tone` – Writing voice (e.g., expert, friendly, consultative).
- `cta_url` – Primary call-to-action destination.
- `additional_instructions` – Extra guidance from the user.
- `outline_notes` – User-provided outline or key talking points.
- `hero_asset_requirements` – Notes for future image generation.

## Output Path Convention
```
campaigns/[campaign_name]/content-assets/blog/[publisher_domain]/blog-post/
  text_[topic-slug]_[context-slug]_rev[n].md
```
If `context_slug` is omitted, drop that segment. Confirm directories exist and create them only with user approval.

## Workflow
1. **Gather Guidance**
   - Read global policy: `/policies/digital-marketing-plan.md`.
   - Find / list authoring and outline guides (`/policies/blog-*-authoring-guide.md`, `/policies/blog-*-outline-guide.md`).
   - Find relevant campaign knowledge (`/campaigns/[campaign_name]/knowledge/`) and user-supplied sources.
   - Note required external URLs
3. **Assemble Outline Brief**
   - Capture topic, audience, objective, SEO keywords, tone, CTA, and structure expectations.
   - Merge user outline notes with policy guidance to define sections and key talking points.
   - Compute the final output file path and include it explicitly in the brief so the sub-agent writes to the correct location.
4. **Delegate Drafting**
   - Invoke `blog_content_author` with the compiled brief, source excerpts, and formatting rules.
   - Provide explicit instructions about the target workspace file path and require the sub-agent to write the draft there.
   - Request authoring in Markdown with metadata section under ‘## Post metadata' header using **[field]**: [value] format”.
5. **Verify Saved Output**
   - After the sub-agent reports completion, read the generated file from the target path.
   - Confirm the metadata block contains required fields (Platform=blog, Format=blog-post, Topic, Context, Revision, Target Audience, Objective, Created date, Status).
   - Review section flow, headline strength, SEO keyword integration, and CTA clarity.
   - If adjustments are needed, provide targeted feedback and rerun the sub-agent with corrections rather than editing manually.
6. **Confirm & Recommend Next Steps**
   - Summarize completion, referencing the saved file path.
   - Suggest follow-up actions: validate SEO, create promotional socials, plan image generation, schedule publish.

## Quality Checklist
- Metadata section appears under ‘## Post meta’ header with field: value list format containing all required fields.
- Intro hooks the reader and frames the campaign objective.
- Section structure matches outline guidance and flows logically.
- SEO keywords appear naturally in headings and body copy.
- CTA reinforces the requested objective and references `cta_url` if provided.
- Tone, language, and compliance align with policy documents.

## Content Format: Markdown (with Metadata Header section)

Generated content uses this structure (no YAML frontmatter):

```markdown
# [Post Title]

## Post Metadata

**Platform**: blog
**Format**: blog-post
**Target Audience**: [audience description]
**Objective**: [content objective]
**Created**: [YYYY-MM-DD]
**Status**: [draft|review|published]
**SEO Keywords**: [kw1, kw2, kw3, ...]

---

## Post Content

[Main post text with platform-specific formatting]

## Call to Action

[CTA text and link]

## Notes

[Optional internal notes, testing results, etc.]
```


## Error Handling
- **Missing directories**: Ask before creating blog-specific folders.
- **Missing guides**: Note absence and proceed with digital-marketing-plan defaults.
- **Sub-agent failure**: Capture error, simplify instructions, or request user-provided outline.
- **Missing output file**: If the file is not written after sub-agent completion, surface the issue, adjust instructions (e.g., new revision number/path), and rerun.
- **Write conflicts**: Capture sub-agent error messages, negotiate revision or path changes with the user, then retry.

## Related References
- Authoring guides: `/policies/blog-*-authoring-guide.md`
- Outline guides: `/policies/blog-*-outline-guide.md`
- Campaign knowledge: `/campaigns/[campaign_name]/knowledge/`
- Workspace orchestration skill: ensures vendor knowledge and campaign prep before drafting.
