# Visual Template: Clean Section Layout

**Template ID**: clean-section-layout
**Version**: 1.0
**Created**: 2025-12-05
**Best For**: Professional social posts (LinkedIn, Facebook), announcements, product features

---

## Overview

A minimalist, professional design with distinct sections separated by a curved divider. Features a colored top section with headline, main content area with light background, and optional bottom icon.

**Visual Style**: Clean, corporate, generous negative space, no complex patterns

---

## Layout Structure

### 1. Top Section (Colored Background)
- **Background**: `[base_color]` with subtle gradient
- **Caption**: Small white text, centered at very top
- **Title**: Bold white sans-serif text, prominently displayed
- **Style**: Clean, minimal, professional

### 2. Curved Divider
- **Shape**: Curved, smooth off-white shape
- **Flow**: Starts from left side, curves upward toward top right
- **Purpose**: Creates elegant visual separation

### 3. Main Body (Light Background)
- **Background**: Off-white or light tint of `[base_color]`
- **Content**: Multiline text in dark color
- **Typography**: Modern sans-serif, clean formatting
- **Layout**: Generous spacing, easy to read

### 4. Bottom Element (Optional)
- **Icon**: Small emoji or graphic element
- **Position**: Bottom center
- **Size**: Small, subtle accent

---

## Template Variables

### Required Variables

**[base_color]** - Primary background color for top section
- Format: Hex code (e.g., #4A90E2) or OKLCH value
- Refer to `/policies/brand/image-generation-guidelines.md` for your brand's approved colors
- Example: `#4A90E2` or `oklch(0.707 0.165 254.624)`

**[caption]** - Small text at very top
- Examples: "YOUR BRAND NAME", "AI-POWERED MARKETING", "PRODUCT UPDATE"
- Style: Small, white, centered, uppercase
- Typically: Brand name or category label

**[title]** - Bold headline text
- Examples: "COMPELLING HEADLINE HERE.", "ONE CREATIVE PARTNER.", "TRANSFORM YOUR WORKFLOW."
- Style: Bold, white, sans-serif, prominent
- Length: 2-6 words recommended

**[variant_color]** - Light background for main text area
- If blue base → light blue tint
- If pink base → light pink/cream tint
- Should complement `[base_color]`

**[main_content]** - Text content in main body
- Format: Bullet list (4-6 items) OR paragraph (3-5 lines)
- Style: Dark text on light background
- Font: Modern sans-serif, clean

### Optional Variables

**[emoji_icon]** - Bottom accent icon
- Examples: 🎯 (goal), ✨ (magic), 🚀 (growth), 🤝 (partnership), 💡 (idea)
- Position: Bottom center
- Size: Small

**[aspect_ratio]** - Image dimensions
- LinkedIn: `16:9` (recommended)
- Instagram: `1:1` or `4:5`
- Facebook: `1.91:1` or `1:1`

---

## Prompt Template

```
Clean, minimalist professional marketing image with distinct sections.

Top section features solid [base_color] background ([hex_code], OKLCH: [oklch_value]) with subtle gradient. At the very top, small white sans-serif text reads '[caption]' centered. Below that, bold white sans-serif text reads '[title]' prominently displayed.

A curved, smooth off-white shape cuts across the image, starting from the left side and flowing upwards towards the top right, creating elegant separation.

The majority of the image features an off-white background with [variant_color] tint. On this light background, clean multiline text in dark [text_color] [describes_main_content] in modern sans-serif font: [list_items_or_paragraph].

[If using emoji: At the bottom center on the light background, a small [emoji_description] emoji [emoji] is positioned.]

Very clean design, corporate aesthetic, professional look, generous negative space, no gradients in main sections, no complex patterns, no people. Pure graphic design emphasizing clarity and professionalism. [aspect_ratio] aspect ratio.
```

---

## Usage Examples

These examples demonstrate the template structure with generic placeholders. For brand-specific examples using actual colors and messaging, see `/policies/brand/image-generation-guidelines.md`.

### Example 1: Product Announcement

**Variables:**
- `[base_color]`: Your brand's primary color (e.g., #4A90E2)
- `[caption]`: "YOUR BRAND NAME"
- `[title]`: "YOUR COMPELLING HEADLINE."
- `[variant_color]`: Light tint of base color
- `[main_content]`: Benefit list (4-6 items highlighting key features)
- `[emoji_icon]`: 🎯 (or relevant icon)
- `[aspect_ratio]`: 16:9

### Example 2: Feature Highlight

**Variables:**
- `[base_color]`: Your brand's accent color (e.g., #ea4171)
- `[caption]`: "NEW FEATURE"
- `[title]`: "SIMPLE. POWERFUL. YOURS."
- `[variant_color]`: Light tint of base color
- `[main_content]`: 3-4 line paragraph describing the feature benefit
- `[emoji_icon]`: 💡 (idea/innovation)
- `[aspect_ratio]`: 1:1 (for social platforms like Instagram)

### Example 3: Success Story

**Variables:**
- `[base_color]`: Your brand's primary color
- `[caption]`: "SUCCESS STORY"
- `[title]`: "TRANSFORMED RESULTS."
- `[variant_color]`: Light tint of base color
- `[main_content]`: Brief testimonial or results summary (3-4 lines)
- `[emoji_icon]`: 🚀 (growth/success)
- `[aspect_ratio]`: 16:9

---

## Template Quality Checklist

Before finalizing your image, ensure:

✅ Uses colors from your brand guidelines (`/policies/brand/image-generation-guidelines.md`)
✅ Follows your brand's visual style rules
✅ Minimalist, clean design maintained
✅ Corporate aesthetic preserved
✅ Generous negative space throughout
✅ Professional typography with correct spelling
✅ Appropriate aspect ratio for target platform
✅ No complex patterns or unnecessary decorative elements

**Note**: Refer to your brand guidelines for specific constraints (e.g., people, gradients, color combinations).

---

## Technical Specifications

**Image Generation Tool**: `generate_image_google_ai`
**Model**: gemini-2.5-flash-image
**Person Generation**: `dont_allow` (always)
**File Format**: PNG
**Color Space**: sRGB

**Recommended Aspect Ratios by Platform:**
- LinkedIn: 16:9 (1200x675px)
- Instagram Feed: 1:1 (1080x1080px)
- Instagram Story: 9:16 (1080x1920px)
- Facebook Post: 1.91:1 (1200x628px) or 1:1 (1200x1200px)

---

## File Naming Convention

When using this template, follow the standard naming pattern:

```
image_[topic-slug]_[context-slug]_rev[n].png
```

**Example**: `image_make-marketing-fun_pinned-intro_rev1.png`

**Prompt Documentation**: Save prompt as separate `.md` file:
```
image_[topic-slug]_[context-slug]_rev[n]-prompt.md
```

---

## Customization Guidelines

### When to Use This Template
- Professional announcements
- Product/feature highlights
- Benefit-focused messaging
- LinkedIn content
- Corporate social posts

### When NOT to Use This Template
- Casual, playful content (use different template)
- Image-heavy designs (use photo-based template)
- Complex infographics (use data visualization template)
- Story-driven content (use narrative template)

### Customization Tips
1. **Color Selection**: Choose base color based on message tone (blue = trust/professional, pink = creative/energetic)
2. **Title Length**: Keep titles punchy (2-6 words max)
3. **Main Content**: Use bullet lists for features/benefits, paragraphs for stories/testimonials
4. **Emoji Selection**: Match emoji to message theme (goal, growth, innovation, partnership)
5. **Aspect Ratio**: Match platform requirements for optimal display

---

## Related Templates

*Coming soon:*
- Photo-overlay template (for image-based content)
- Data visualization template (for stats/metrics)
- Narrative template (for storytelling)
- Playful template (for casual/fun content)

---

## Version History

**v1.0** (2025-12-05)
- Initial template creation
- Based on LinkedIn post for "Make Marketing Fun" campaign
- Established core layout structure and variables

---

## Support

For questions or template requests, refer to:
- Brand Guidelines: [file:policies/brand/image-generation-guidelines.md]
- Image Generation Skill: [file:_meta/skills/image-generation/skill-manifest.yaml]
