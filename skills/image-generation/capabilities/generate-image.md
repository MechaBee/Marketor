# Capability: generate_image

Generate AI images with proper prompts using Five-Part Architecture and save them with accompanying prompt documentation to the workspace.

## When to Use

* User requests an image for blog post or social media content
* User wants to generate an image in a specific workspace location
* Visual content is needed to support campaign materials

## Required Parameters

* `workspace_id` - Target workspace identifier
* Either `content_file_path` OR `target_folder_path` - Where to save the image

## Optional Parameters

* `aspect_ratio` - Image dimensions (1:1, 3:4, 4:3, 9:16, 16:9)
* `person_generation` - Control people in images (dont_allow, allow_adult, allow_all)
* `art_style` - Visual style preference
* `image_concept` - Initial description from user
* `platform_content_type` - Platform-specific content type (see Platform Content Types below)
* `model_name` - Model selection: `gemini-2.5-flash-image` (default, fast, cheapest) or `gemini-3-pro-image-preview` (text-heavy, high-res, more expensive)

## Use Cases

### 1. Image for Content Asset (Blog/Social Post)

**Scenario**: User has a blog post or social media content and needs a supporting image.

**Workflow**:

1. Read the content file to understand messaging and tone
2. Determine target platform from file path (e.g., `/blog/`, `/ig-reel/`, `/fb-link-post/`)
3. Infer appropriate aspect ratio based on platform (blog: 16:9, Instagram: 1:1 or 9:16)
4. Consult user on image requirements (subject, style, mood)
5. Create optimized prompt using guidance from `/_meta/skills/image-generation/resources/how-to-instruct-image-generation.md`
6. Generate image via `generate_image_google_ai` to `media/` folder alongside content file
7. Save prompt documentation as `[image-filename]-prompt.md` in same `media/` folder

**File Naming**: Follow workspace conventions: `image_[topic-slug]_[context-slug]_rev[n].png`

**Location**: Images and prompts live in `media/` directory adjacent to content file:

```
/campaigns/[name]/content-assets/blog/[domain]/blog-post/
  ├── text_topic_rev1.md
  └── media/
      ├── image_topic_rev1.png
      └── image_topic_rev1-prompt.md
```

in case of a social post:

```
/campaigns/[name]/content-assets/social/[platform]/[format]/
  ├── text_[topic-slug]_[context-slug]_rev1.md
  └── media/
      ├── image_topic_rev1.png
      └── image_topic_rev1-prompt.md
```

This placement logic also applies to regular social posts, standalone blog posts, etc.
In short: when the image is associated with a text post always place associated prompts and images in a `media/` sibling folder.

### 2. Image for Arbitrary Location

**Scenario**: User requests an image in a specific folder (not tied to existing social, or blog content).

**Workflow**:

1. Clarify target location and filename with user
2. Confirm aspect ratio and person_generation settings
3. Consult on image requirements (subject, style, composition)
4. Reference prompt best practices from policy doc
5. Generate image via `generate_image_google_ai` to specified path
6. Save prompt file as `[image-filename]-prompt.md` alongside image

**File Naming**: Confirm naming convention with user or suggest workspace standard.

## Model Selection Guide

Choose the appropriate model tier based on the image requirements:

### Use Flash (Default)
- High-volume social media content
- Rapid prototyping and iteration
- Standard social posts (LinkedIn, Facebook, Instagram)
- Quick turnaround requirements
- Budget-conscious workflows

### Use Pro
- Text-heavy graphics (logos, infographics, menus)
- Client deliverables or final brand assets
- 2K/4K professional output requirements
- Complex multi-image composition
- Images requiring precise text rendering

Ask the user for confirmation on the model used, as this is affects the cost.

## Platform Content Types

When creating platform-specific content, use these content types for optimized prompts:

### LinkedIn
| Content Type | Use Case | Optimal Ratio |
|--------------|----------|---------------|
| `linkedin_educational` | Framework graphics, infographics, save-worthy content | 1:1 |
| `linkedin_authority` | Testimonials, social proof, credibility | 1:1 |
| `linkedin_carousel` | Multi-slide series cover | 1.91:1 |
| `linkedin_pattern_interrupt` | Bold statements, stop-scroll graphics | 1:1 |

### Facebook
| Content Type | Use Case | Optimal Ratio |
|--------------|----------|---------------|
| `facebook_lifestyle` | Community, lifestyle, relatability | 1:1 |
| `facebook_product` | Product showcase, sales | 1:1 |
| `facebook_emotional` | Brand story, emotional connection | 1:1 |

## Prompt Creation Guidelines

**Reference**: `/_meta/skills/image-generation/resources/how-to-instruct-image-generation.md` for comprehensive prompt engineering guidance.

### Five-Part Prompt Architecture

Build prompts using this structure:

```
[COMPOSITION] of [SUBJECT], [ACTION], set in [LOCATION].
The scene features [ENVIRONMENTAL DETAILS] and is illuminated by [LIGHTING].
Render in [STYLE] with [TECHNICAL SPECIFICATIONS].
```

**Essential Elements**:

* **Composition**: Framing and visual perspective (wide-angle, close-up, medium shot)
* **Subject**: Main focus with specific characteristics
* **Action/State**: What the subject is doing
* **Location**: Environment, setting, context
* **Lighting/Style**: Photography style, lighting approach, artistic direction

**Character Limit**: Maximum 2500 characters

**Example Prompt (Professional Level)**:

```
A close-up portrait of a thoughtful middle-aged woman with kind eyes,
savoring morning coffee, set in a charming rustic vintage café with exposed
brick walls and large windows. The scene features warm, inviting décor with
brass accents and is illuminated by soft golden-hour natural light streaming
through windows, creating gentle shadows. Render in documentary lifestyle
photography style with 85mm lens, shallow depth of field, film-like color
grading, 4K resolution. Aspect ratio: 4:5.
```

## Prompt Documentation Format

Save prompt details to `[image-filename]-prompt.md`:

```markdown
# Image Generation Prompt

**Prompt:** [full prompt text]

**Aspect Ratio:** [ratio]
**Person Generation:** [setting]
```

## Consultation Approach

Before generating, consult user on:

* Image purpose and how it supports the content
* Subject matter and key visual elements
* Preferred style (photorealistic, illustration, abstract)
* Mood and tone alignment with content
* Any brand constraints or requirements
* **Platform and content type** (LinkedIn educational, Facebook lifestyle, etc.)
* **Model tier preference** if text-heavy or high-resolution needed

### Platform-Specific Consultation Questions

**For LinkedIn:**
- Is this educational/framework content (infographic style)?
- Is this social proof/authority building (testimonial style)?
- Is this a carousel series (cover + slides)?
- Does it need to stop the scroll (bold statement)?

**For Facebook:**
- Is this community/lifestyle focused (authentic, relatable)?
- Is this product-focused (showcase, sales)?
- Is this emotional/story-driven (brand connection)?

Keep consultation brief - gather essentials, reference policy doc for technical details.

## Iteration Guidance

**Critical**: Limit edits to 2-3 per image to prevent consistency drift.

### Iteration Workflow

1. **Generate initial image** with comprehensive prompt
2. **Inspect** against brief - identify specific issues
3. **Make one change** per iteration using explicit spatial directives
4. **After 2-3 edits**, regenerate from scratch if needed

### Spatial Directives for Precise Edits

When requesting changes, use explicit spatial language:
- "Change **only** the background behind the figure"
- "Modify **just** the left side of the image"
- "Adjust **only** the lighting; keep all other elements unchanged"

### Text Rendering Best Practices

- Always specify exact text in quotes: `Text must read exactly: 'YOUR TEXT HERE'`
- Use Pro model for text-heavy graphics
- Consider generating text in a separate, dedicated pass

## Tool Integration

Call `generate_image_google_ai` with:

```
workspace_id: [user's workspace]
file_path: [content_file_directory]/media/[image_filename].png # notice the use of the media/ subdirectory the sibling of the text content file when image is associated with a text post.
prompt: [optimized prompt, max 2500 chars]
aspect_ratio: [inferred or confirmed ratio]
person_generation: [inferred or confirmed setting]
```

**Path Construction Logic:**

1. Extract directory path from content file (e.g., `campaigns/summer/content-assets/social/facebook/fb-link-post/`)
2. Append `media/` subdirectory
3. Add image filename following naming convention: `image_[topic-slug]_[context-slug]_rev[n].png`

## Error Handling

* **Content file not found**: Ask user to confirm path or list available content
* **Unclear location**: Propose logical default (media/ folder) and confirm
* **Missing requirements**: Ask focused questions to complete prompt
* **Prompt too long**: Prioritize core elements, simplify descriptions

## Brand Guideline Integration

When generating images:

1. **Check for Brand Guidelines**: Look for `/policies/brand/image-generation-guidelines.md`
2. **Apply Brand Colors**: Use colors specified in brand guidelines
3. **Follow Brand Rules**: Respect brand-specific constraints (people, gradients, style)
4. **Reference Template Examples**: Check if brand guidelines show template usage examples

If no brand guidelines exist, suggest: "I notice you don't have brand visual guidelines yet. Would you like me to create them through a quick consultation? This will help ensure consistent, on-brand imagery."

## Related References

* Workspace conventions: Documented in workflow-descriptions.md
* Campaign knowledge: `/campaigns/[campaign_name]/knowledge/`
* Image template library: `_meta/skills/image-generation/resources/image-templates/`
* Brand guidelines: `/policies/brand/image-generation-guidelines.md`
* Brand guideline generation: `_meta/skills/image-generation/capabilities/generate-brand-guidelines.md`
