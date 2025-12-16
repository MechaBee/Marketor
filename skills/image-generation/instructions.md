# Image Generation Skill

Generate AI images for campaign and standalone content, and maintain reusable brand-level image generation guidelines.

## Which Capability?
| Goal | Capability | Example |
|------|------------|---------|
| Generate an image asset | `generate_image` | "Generate a hero image for this blog post" |
| Define brand visual guidelines | `generate_brand_guidelines` | "Create brand visual guidelines for CoverMe" |

## Core Concepts

**Policy-Guided Prompts** – Use `/_meta/skills/image-generation/resources/how-to-instruct-image-generation.md` for prompt engineering patterns.

**File Conventions** – Images use `image_[topic-slug]_[context-slug]_rev[n].png`, prompts use `[image-filename]-prompt.md`.

**Location Awareness** – For content assets, store images in adjacent `media/` folders. For arbitrary requests, confirm target location.

## Tools
- `workspace_read_operations` – Inspect content, policies, and knowledge.
- `workspace_write_operations` – Save prompts, generated assets, and guideline documents.
- `generate_image_google_ai` – Produce images from approved prompts.
- `system_guides_read_operations` (optional) – Pull best-practice guidance.

## See Also
- `/_meta/skills/social-authoring` – Coordinate social copy with visuals.
- `/_meta/skills/brand-onboarding` – Produce brand research and marketing plan inputs.

