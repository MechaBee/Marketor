# Blog Authoring Skill

Create long-form marketing articles that translate campaign knowledge into search-friendly, conversion-oriented content.

## Which Capability?
| Goal | Capability | Example |
|------|------------|---------|
| Draft a new blog article | `generate_blog_post` | "Write a [topic] blog post for [brand]" |

## Core Concepts

**Campaign-Centric Content** – Every article belongs to a campaign. Keep knowledge, briefs, and outputs inside `/campaigns/[campaign-name]/`.

**Workspace Guides** – Combine global policies (`/policies/digital-marketing-plan.md`) with campaign-specific materials and blog outline/authoring guides to drive structure and tone.

**Progressive Disclosure** – Confirm prerequisites (workspace, campaign, publisher domain, sources) before delegating to `blog_content_author`.

**SEO & Conversion Alignment** – Capture keywords, target audience, CTA, and objective so the sub-agent shapes copy that ranks and converts.

## Standard Workflow
```
collect inputs → gather policies/guides → call blog_content_author →
review & refine → suggest follow-up actions
```

## Tools & Sub-Agents
- `workspace_read_operations` – List campaign knowledge, prior content.
- `system_guides_read_operations` (optional) – Pull policy or best-practice references.
- `blog_content_author` – Required sub-agent to produce outline and draft.

## Best Practices
1. Confirm workspace and campaign before drafting; 
2. Read relevant authoring guides to align with brand voice and structure.
3. Provide `blog_content_author` with clear content creation plan, keyword goals, and tone instructions.
4. Validate metadata header and section flow before saving the file.
5. Suggest next steps: generate hero images, publish teasers, or schedule blog promotion.

## See Also
- `capabilities/generate-blog-post.md` – Detailed guidance.
- `/_meta/skills/social-authoring` – Social content counterpart for blog promotion assets.
- Workspace orchestration skill – for preparing brand knowledge and vendor ingest tasks.
- Creative support skill – for visual planning and external source ingestion.
