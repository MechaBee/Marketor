# Capability: generate_image

Generate AI images with proper prompts and save them with accompanying prompt documentation to the workspace.

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

## Prompt Creation Guidelines

**Reference**: `/_meta/skills/image-generation/resources/how-to-instruct-image-generation.md` for comprehensive prompt engineering guidance.

**Essential Elements**:

* **Subject**: Main focus with specific characteristics
* **Context**: Environment, setting, lighting conditions
* **Style**: Photography style or artistic direction
* **Technical**: Quality modifiers, composition notes

**Character Limit**: Maximum 2500 characters

**Example Prompt Structure**:

```
[Camera/Lens] [Detailed Subject] in [Rich Context], [Style], [Lighting], [Quality Modifiers]
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

Keep consultation brief - gather essentials, reference policy doc for technical details.

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
