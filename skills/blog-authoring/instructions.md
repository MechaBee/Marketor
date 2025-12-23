# Blog Authoring Skill

Create long-form marketing articles that translate campaign knowledge into search-friendly, conversion-oriented content. Supports both standard blog posts and comprehensive cornerstone/pillar articles.

## Which Capability?
| Goal | Capability | Example |
|------|------------|------|
| Draft a standard blog article | `generate_blog_post` | "Write a [topic] blog post for [brand]" |
| Create comprehensive cornerstone content | `generate_cornerstone_post` | "Create a comprehensive guide about [topic] using [sources]" |
| Generate blog topic ideas | `generate_ideas` | "Generate blog ideas from [source material]" |

## Core Concepts

**Campaign-Centric Content** – Every article belongs to a campaign. Keep knowledge, briefs, and outputs inside `/campaigns/[campaign-name]/`.

**Workspace Guides** – Combine global policies (`/policies/digital-marketing-plan.md`) with campaign-specific materials and blog outline/authoring guides to drive structure and tone.

**Progressive Disclosure** – Confirm prerequisites (workspace, campaign, publisher domain, sources) before delegating to sub-agents.

**SEO & Conversion Alignment** – Capture keywords, target audience, CTA, and objective so the sub-agent shapes copy that ranks and converts.

**Two Content Types:**
- **Standard Blog** (800-1,600 words): Single-topic articles using `blog_content_author`
- **Cornerstone Blog** (3,500-5,000+ words): Comprehensive guides synthesizing multiple sources using `content_processor`

## Standard Workflow

### For Standard Blog Posts
```
collect inputs → gather policies/guides → call blog_content_author →
review & refine → suggest follow-up actions
```

### For Cornerstone Posts
```
collect inputs → gather all sources → create chapter plan → 
user approval → call content_processor → verify output → 
review quality → suggest follow-up actions
```

## Cornerstone Content Workflow

For comprehensive, authoritative articles (3,500+ words) that synthesize multiple knowledge sources:

**Phase 1: Planning**
1. Read all source materials
2. Analyze themes and structure opportunities
3. Create detailed chapter plan with:
   - Chapter titles and purposes
   - Key points per chapter
   - Word count targets
   - Source references
4. Save plan to `campaigns/[campaign]/temp/blog-chapter-plan.md`
5. **Get user approval before proceeding**

**Phase 2: Generation**
1. Delegate to `content_processor` with:
   - Chapter plan file path
   - All source file paths
   - Target output path
   - Detailed formatting requirements
2. Monitor completion
3. Verify output file exists and meets quality standards
4. Suggest follow-up actions (images, social promotion)

**When to Use Cornerstone Workflow:**
- User requests "comprehensive guide," "pillar content," or "cornerstone article"
- Multiple knowledge sources need synthesis
- Target word count exceeds 3,000 words
- Content serves as authoritative reference

## Tools & Sub-Agents

### Tools
- `workspace_read_operations` – List campaign knowledge, prior content
- `workspace_write_operations` – Save chapter plans and manage files
- `system_guides_read_operations` (optional) – Pull policy or best-practice references

### Sub-Agents
- `blog_content_author` – **Required** for standard blog posts (800-1,600 words)
- `content_processor` – **Required** for cornerstone posts (3,500+ words) and blog idea generation

## Best Practices

### For All Blog Content
1. Confirm workspace and campaign before drafting
2. Read relevant authoring guides to align with brand voice and structure
3. Provide sub-agents with clear content creation plan, keyword goals, and tone instructions
4. Validate metadata header and section flow before saving the file
5. Suggest next steps: generate hero images, publish teasers, or schedule blog promotion

### For Cornerstone Content (Additional)
1. **Multi-source synthesis**: Use minimum 2 comprehensive source files
2. **User involvement**: Always get approval on chapter plan before generation
3. **Clear structure**: Ensure chapter plan has logical flow and clear purposes
4. **Quality verification**: Check word count (3,500+ target), structure, and SEO integration
5. **Follow-up ecosystem**: Suggest complete content package (hero images, social posts, distribution plan)

## Example: Cornerstone Blog Creation

**User request:**
> "Create a comprehensive cornerstone article about Vibe Marketing for MechaBee blog. Use the digitalfirst article and our Marketor landing page as sources."

**Agent workflow:**
1. ✅ Identify cornerstone request (comprehensive + multiple sources)
2. ✅ Read both source files
3. ✅ Create 10-chapter plan with detailed briefs
4. ✅ Save to `campaigns/vibe-marketing/temp/blog-chapter-plan.md`
5. ✅ Present plan and **wait for approval**
6. ✅ After approval: delegate to content_processor
7. ✅ Verify output: 4,500+ word article with proper structure
8. ✅ Suggest hero image and social promotion

**Result:** Comprehensive, SEO-optimized cornerstone content ready for publication.

## See Also

### Capability Documentation
- `capabilities/generate-blog-post.md` – Standard blog post workflow
- `capabilities/generate-cornerstone-post.md` – Cornerstone content workflow
- `capabilities/generate-ideas.md` – Blog ideation

### Related Skills
- `/_meta/skills/social-authoring` – Social content counterpart for blog promotion assets
- Workspace orchestration skill – For preparing brand knowledge and vendor ingest tasks
- Creative support skill – For visual planning and external source ingestion
- Campaign management skill – For campaign lifecycle and summary maintenance

### Guides
- `/policies/digital-marketing-plan.md` – Overall marketing strategy
- `/policies/blog-*-authoring-guide.md` – Blog writing best practices
- `/policies/blog-*-outline-guide.md` – Structure and outline guidance
