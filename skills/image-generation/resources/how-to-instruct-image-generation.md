# Comprehensive Guide to Image Generation Instructions

## Table of Contents
1. [Core Principles](#core-principles)
2. [Five-Part Prompt Architecture](#five-part-prompt-architecture)
3. [Model Selection Guide](#model-selection-guide)
4. [Technical Specifications](#technical-specifications)
5. [Subject Definition](#subject-definition)
6. [Context and Environment](#context-and-environment)
7. [Style and Artistic Direction](#style-and-artistic-direction)
8. [Photography Techniques](#photography-techniques)
9. [Quality Enhancement Modifiers](#quality-enhancement-modifiers)
10. [Composition and Framing](#composition-and-framing)
11. [Text Integration](#text-integration)
12. [Platform-Specific Content](#platform-specific-content)
13. [Known Limitations and Workarounds](#known-limitations-and-workarounds)
14. [Iterative Refinement Workflow](#iterative-refinement-workflow)
15. [Advanced Techniques](#advanced-techniques)

---

## Core Principles

### The Foundation Formula
Every effective image generation prompt should contain five essential elements:
- **Composition**: The framing, angle, and visual perspective
- **Subject**: The main focus with specific characteristics
- **Action/State**: What the subject is doing or its condition
- **Location**: The setting and environmental context
- **Lighting/Style**: Aesthetic direction and illumination approach

### Maximum Impact Guidelines
- **Clarity over complexity**: Be descriptive but focused
- **Specificity drives quality**: Generic prompts yield generic results
- **One change per iteration**: Refine prompts systematically
- **Limit edits to 2-3**: Regenerate after multiple changes to prevent drift
- **Use semantic positives**: Describe what you want, not what to avoid

---

## Five-Part Prompt Architecture

The most effective prompts follow this modular structure:

```
[COMPOSITION] of [SUBJECT], [ACTION], set in [LOCATION].
The scene features [ENVIRONMENTAL DETAILS] and is illuminated by [LIGHTING].
Render in [STYLE] with [TECHNICAL SPECIFICATIONS].
```

### Part 1: Composition
Defines the framing and visual perspective.

**Vocabulary:**
- "A wide-angle landscape shot"
- "A close-up macro photograph"
- "A medium shot from shoulder height"
- "An isometric top-down view"
- "A split-screen diptych"
- "Bird's eye view"
- "Eye-level perspective"

### Part 2: Subject
The primary object, person, or element with specific characteristics.

**Examples:**
- "A professional woman in her 30s with warm smile"
- "A vintage leather briefcase with brass clasps"
- "A modern office building facade with glass panels"
- "A steaming cup of espresso on ceramic saucer"

### Part 3: Action/State
What the subject is doing or its condition.

**Examples:**
- "Holding a smartphone, smiling confidently"
- "Sitting at a wooden desk, typing"
- "Standing in front of a minimalist white wall"
- "Displayed on a marble shelf, catching light"

### Part 4: Location/Environment
The setting and context.

**Examples:**
- "In a bright, modern office environment"
- "On a rustic wooden table in a sunlit kitchen"
- "Against a blurred city skyline at dusk"
- "In a professional studio with neutral gray walls"

### Part 5: Lighting and Style
Aesthetic direction, lighting approach, and artistic style.

**Examples:**
- "Soft, diffused golden-hour sunlight casting gentle shadows"
- "Professional studio lighting with three-point setup"
- "High-contrast black and white cinematic lighting"
- "Flat illustration style with bold colors and thin black outlines"

### Complete Example

**Basic (Level 1):**
```
Woman in coffee shop, portrait photography
```

**Enhanced (Level 2):**
```
A medium shot of a professional woman, holding a latte, set in a vintage café.
Natural window light, documentary photography style.
```

**Professional (Level 3):**
```
A close-up portrait of a thoughtful middle-aged woman with kind eyes,
savoring morning coffee, set in a charming rustic vintage café with exposed
brick walls and large windows. The scene features warm, inviting décor with
brass accents and is illuminated by soft golden-hour natural light streaming
through windows, creating gentle shadows. Render in documentary lifestyle
photography style with 85mm lens, shallow depth of field, film-like color
grading, 4K resolution. Aspect ratio: 4:5.
```

---

## Model Selection Guide

### When to Use Flash (Default)
- High-volume social media content (50+ images/week)
- Rapid prototyping and iteration
- Standard social posts (LinkedIn, Facebook, Instagram)
- Quick turnaround requirements
- Budget-conscious workflows
- Speed-critical content calendars

### When to Use Pro
- Text-heavy graphics (logos, infographics, menus)
- Client deliverables or final brand assets
- 2K/4K professional output requirements
- Complex multi-image composition
- Brand consistency requiring "thinking mode"
- Real-time data grounding (when needed)

### Model Comparison

| Feature | Flash | Pro |
|---------|-------|-----|
| Speed | ~0.8 sec | Professional speed |
| Resolution | Up to 1024×1024 | Up to 4K (4096×4096) |
| Text Rendering | Very Good | Excellent |
| Max Reference Images | 3 | 14 |
| Best For | Volume content | Professional assets |

---

## Technical Specifications

### Model Capabilities
- **Input Limit**: 2500 tokens maximum
- **Output Options**: 1-4 images per generation
- **Language**: English prompts only
- **Current Models**: Imagen 3 and Imagen 4

### Aspect Ratio Options
- **1:1** - Square (default, ideal for social media posts)
- **4:3** - Fullscreen landscape (presentations, displays)
- **3:4** - Portrait fullscreen (magazine covers, posters)
- **16:9** - Widescreen (banners, headers, video thumbnails)
- **9:16** - Vertical portrait (mobile content, stories)

---

## Subject Definition

### Subject Clarity Techniques
- **Be specific**: "Golden retriever puppy" vs "dog"
- **Include key characteristics**: Age, size, distinctive features
- **Specify quantity**: "Three children" vs "children"
- **Add emotional states**: "laughing woman" vs "woman"

### Human Subject Best Practices
- **Facial details**: "Kind eyes, warm smile, weathered hands"
- **Age specification**: "Middle-aged", "teenage", "elderly"
- **Clothing details**: "Wearing casual denim jacket"
- **Pose/action**: "Walking confidently", "sitting pensively"

### Object Subject Guidelines
- **Material specification**: "Wooden table", "glass vase", "metal sculpture"
- **Condition details**: "Vintage", "new", "weathered", "polished"
- **Size context**: "Massive oak tree", "tiny delicate flower"

---

## Context and Environment

### Setting Categories

**Indoor Environments**
- Architectural details: "Victorian living room with ornate moldings"
- Lighting conditions: "Sunlit kitchen with morning light streaming through windows"
- Furniture/objects: "Cluttered artist studio with canvases and paint brushes"

**Outdoor Environments**
- Natural settings: "Misty forest clearing at dawn"
- Urban environments: "Busy city street during golden hour"
- Weather conditions: "Snow-covered mountain peak under stormy clouds"

**Abstract/Conceptual Contexts**
- Emotional environments: "Dreamlike floating in clouds"
- Fantastical settings: "Underwater palace with bioluminescent creatures"
- Minimalist contexts: "Clean white void with subtle shadows"

### Environmental Detail Layers
1. **Primary setting**: Where the subject is located
2. **Secondary elements**: Supporting objects or features
3. **Atmospheric conditions**: Weather, time of day, season
4. **Scale context**: Intimate close-up vs vast landscape

---

## Style and Artistic Direction

### Photography Styles
- **Portrait Photography**: "Professional headshot", "candid lifestyle portrait"
- **Documentary**: "Street photography", "photojournalism style"
- **Commercial**: "Product photography", "advertising campaign style"
- **Artistic**: "Fine art photography", "conceptual photography"

### Artistic Movements and Styles
- **Classical**: "Renaissance painting", "Baroque dramatic lighting"
- **Modern**: "Art Deco", "Minimalist design", "Bauhaus aesthetic"
- **Contemporary**: "Pop art", "Street art", "Digital art"
- **Cultural**: "Japanese ukiyo-e", "Mexican muralism", "Nordic design"

### Visual Aesthetics
- **Color Palettes**: "Monochromatic blue tones", "warm autumn colors", "high-contrast black and white"
- **Texture Emphasis**: "Rough textured surfaces", "smooth polished finish", "organic natural textures"
- **Mood Descriptors**: "Mysterious and dark", "bright and cheerful", "serene and peaceful"

---

## Photography Techniques

### Camera Equipment Specifications
- **Lens Types**: 
  - Wide-angle (14-35mm): Expansive scenes, architecture
  - Standard (35-85mm): Natural perspective, portraits
  - Telephoto (85-200mm+): Compressed perspective, isolating subjects
  - Macro: Extreme close-ups, detailed textures

### Camera Settings and Effects
- **Depth of Field**: "Shallow focus", "everything in sharp focus", "bokeh background"
- **Motion**: "Motion blur", "frozen action", "long exposure streaks"
- **Exposure**: "Overexposed bright", "underexposed moody", "perfectly balanced"

### Lighting Techniques
- **Natural Light**: "Golden hour warmth", "blue hour coolness", "harsh midday sun"
- **Artificial Light**: "Studio lighting", "neon city lights", "candlelit ambiance"
- **Direction**: "Backlit silhouette", "side-lit drama", "front-lit even illumination"
- **Quality**: "Soft diffused light", "hard dramatic shadows", "rim lighting"

### Advanced Photography Concepts
- **Perspective**: "Bird's eye view", "worm's eye view", "eye-level perspective"
- **Composition Rules**: "Rule of thirds", "leading lines", "symmetrical composition"
- **Film Emulation**: "Kodak Portra film", "black and white film grain", "vintage Polaroid"

---

## Quality Enhancement Modifiers

### Resolution and Technical Quality
- **Basic Quality**: "High-quality", "professional"
- **Specific Resolutions**: "4K", "8K", "Ultra HD"
- **Technical Standards**: "HDR", "RAW quality", "Studio quality"

### Visual Enhancement Terms
- **Sharpness**: "Tack sharp", "crystal clear", "razor sharp focus"
- **Detail Level**: "Highly detailed", "intricate details", "fine texture details"
- **Clarity**: "Pristine clarity", "perfect exposure", "balanced lighting"

### Professional Descriptors
- **Commercial Standards**: "Award-winning photography", "magazine quality"
- **Artistic Recognition**: "Gallery worthy", "fine art quality"
- **Technical Excellence**: "Professionally lit", "expertly composed"

---

## Composition and Framing

### Framing Techniques
- **Shot Types**: 
  - Extreme close-up: Focus on specific details
  - Close-up: Head and shoulders for portraits
  - Medium shot: Waist up, showing context
  - Wide shot: Full body or scene
  - Extreme wide: Establishing environmental context

### Visual Balance
- **Symmetry**: "Perfectly symmetrical", "balanced asymmetry"
- **Weight Distribution**: "Bottom-heavy composition", "floating subjects"
- **Negative Space**: "Minimal negative space", "surrounded by empty space"

### Dynamic Elements
- **Movement**: "Dynamic diagonal lines", "circular flow", "vertical emphasis"
- **Tension**: "Balanced tension", "visual conflict", "harmonious arrangement"
- **Focus Points**: "Single focal point", "multiple competing elements"

---

## Text Integration

### Text Limitations and Guidelines
- **Character Limit**: Maximum 25 characters per text element
- **Phrase Count**: 2-3 distinct phrases work best
- **Readability**: Simple, clear fonts unless stylistically specified

### Text Style Specifications
- **Font Families**: "Sans-serif", "serif", "script", "display font"
- **Font Weights**: "Bold", "light", "regular", "extra bold"
- **Text Effects**: "Embossed", "outlined", "drop shadow", "gradient fill"

### Text Placement and Integration
- **Positioning**: "Centered text", "corner placement", "integrated into design"
- **Relationship to Subject**: "Text overlay", "text as part of environment", "floating text"
- **Color Coordination**: "Text contrasts with background", "text matches color scheme"

---

## Platform-Specific Content

### LinkedIn Content Strategy

**Platform Specifications:**
- Optimal Image: 1200×1200px (1:1 square) for maximum reach
- Carousel: 1200×628px (1.91:1) per card
- Engagement: Posts with images receive 2.3× engagement; carousels drive 3× higher reach

**Content Types:**

#### Educational Framework Graphics
Best for thought leadership and save-worthy content.
```
Create a professional infographic presenting a business framework titled
'[FRAMEWORK NAME].' Layout: [N] horizontal sections stacked, each labeled
Step 1-[N]. Each section has a section title (bold, navy blue), descriptive
text (small, gray), and an abstract icon representing the concept.

Color scheme: Professional navy blue (#1F3A7F), white background, light blue accents.
Clean typography (sans-serif, high contrast). Suitable for LinkedIn share.
The design is clean, scannable, and save-worthy for professionals. 1:1 aspect ratio.
```

#### Authority/Social Proof Graphics
Best for testimonials and credibility building.
```
Create a professional testimonial card with a luxury aesthetic. Layout:
- Header area: 5 gold stars aligned left
- Center: A powerful 1-sentence testimonial in large, bold serif type
- Footer: Circular profile photo placeholder, client name in bold, title/company in smaller text
- Background: Soft cream with subtle gradient
- Border: Thin gold accent line on left edge

Style: Professional, trust-inducing, suitable for B2B LinkedIn context. 1:1 aspect ratio.
```

#### Pattern-Interrupt Graphics
Bold statements that stop the scroll.
```
Create an eye-catching graphic representing a contrarian business insight.
Center the graphic with a bold, provocative statement in white text on a
dark background (deep navy or dark gray). Typography: Large sans-serif font
(80pt minimum), positioned center-aligned.

Surrounding the text, add abstract visual elements (geometric shapes, graphs,
arrows) that reinforce the concept without overwhelming the text.
Color: High contrast (white text on dark background). 1:1 aspect ratio.
```

### Facebook Content Strategy

**Platform Specifications:**
- Optimal Image: 1200×1200px (1:1 square)
- Alternative: 1200×628px (1.91:1) for feed posts
- Engagement: Images generate 2.3× more engagement than text-only posts

**Content Types:**

#### Community/Lifestyle Imagery
Best for engagement and relatability.
```
Create a warm, inclusive lifestyle photograph of a diverse group of [N] people
of different ages, ethnicities, and body types [ACTIVITY DESCRIPTION].
The setting is [ENVIRONMENT] with [LIGHTING DESCRIPTION] creating a warm,
joyful mood.

Details: [SPECIFIC PROPS/ELEMENTS]. Natural expressions—genuine smiles and
eye contact. The aesthetic is aspirational but relatable, emphasizing human
connection and togetherness.

Lighting: Golden-hour sunlight, soft shadows, warm color grade.
1:1 aspect ratio. Ultra-high-resolution, sharp focus on faces.
```

#### Product Showcase
Best for sales and desirability.
```
A stunning product photography shot of [PRODUCT]. The product is centered
on [SURFACE], with subtle styling elements ([PROPS]) arranged artfully around it.

Lighting: Professional studio setup with warm key light from upper left,
creating dimensional shadows and highlighting premium materials.
Background: Soft, blurred white with subtle gray shadow.

Style: Clean, luxury, aspirational. Color grading: Warm, slightly desaturated.
1:1 aspect ratio. Maximum clarity and detail on product surface.
```

#### Emotional Connection Graphics
Best for brand story and engagement.
```
An emotional, moment-based photograph capturing [EMOTION/MOMENT].
The image tells a story without words, evoking [FEELING].
The aesthetic is authentic, unpolished, and human. People are present and genuine,
not posed. Warm, natural lighting. This image makes people pause while scrolling.
1:1 aspect ratio.
```

---

## Known Limitations and Workarounds

Understanding model limitations is essential for setting realistic expectations and developing effective workarounds.

### Consistency Drift Across Multiple Edits

**Problem:** While excellent at maintaining identity, repeated multi-turn edits cause subtle degradation. Facial expressions may shift, colors may drift after several transformations.

**Example Scenario:**
- Edit 1: Change clothing (preserves face well)
- Edit 2: Change background (face remains consistent)
- Edit 3: Adjust lighting (slight facial expression shift)
- Edit 4+: Continued degradation

**Workaround:**
- Limit edits to 2-3 per image before regenerating from scratch
- Re-upload the "good" image and reference it explicitly: "Keep this person's face exactly as shown"
- Start a new conversation/session if style drift is observed

### Over-Editing Unintended Areas

**Problem:** Without extremely precise instructions, the model may edit regions you didn't intend to change. A background modification might subtly alter foreground elements.

**Workaround:** Use explicit spatial descriptors and limiting words:
- "Change **only** the background behind the figure"
- "Modify **just** the left side of the image"
- "Adjust **only** the sky; leave all foreground elements completely unchanged"

### Text Rendering Issues

**Problem:** When degraded input text is provided (blurred, damaged, low-resolution), the model tends to generate sharp but semantically incorrect text. "SALE" might become "SAIL."

**Workaround:**
- Supply clear, high-resolution text inputs
- Specify exact text in quotes: `Text must read exactly: 'DISCOUNT CODE XYZ'`
- Use Pro model for text-heavy graphics
- Generate text in a separate, dedicated pass

### The "Always-Thinking" Bias

**Problem:** The model tends to synthesize more than instructed, especially when removing elements or simplifying compositions. Asked to "remove the person," it fills the space with hallucinated content.

**Workaround:**
```
Instead of: "Remove the person"
Use: "Remove the person completely. Replace their space with plain white background,
keeping all other elements exactly as they are."
```

### Generative Bias: Plausibility Over Fidelity

**Problem:** The model prioritizes creating visually "complete" and perceptually plausible images. If removing an object creates a semantic gap, it may synthesize replacement content even if instructed not to.

**Workaround:**
- Explicitly state preservation constraints: "Do not add any new objects. Only remove the shadow."
- Be specific about what should replace removed elements: "Remove the person; fill the space with plain white background."

### Shadow and Lighting Insensitivity

**Problem:** Limited sensitivity to subtle shadow detection. Faint shadows may be ignored, or non-shadow areas might be altered.

**Workaround:** Use directional, specific lighting language:
```
Instead of: "Soften the shadows"
Use: "Create softer shadows by diffusing the light from the upper left.
Keep the shadow clear and defined but less harsh. Maintain the dimensional effect."
```

### Aspect Ratio Default Surprise

**Problem:** Without explicit specification, some generations default to unexpected dimensions.

**Workaround:** **Always** include aspect ratio explicitly:
```
"Create [IMAGE]. Aspect ratio: 1:1 (square). Resolution: 1080×1080px."
```

### Quick Reference: Common Issues and Fixes

| Issue | Likely Cause | Fix |
|-------|--------------|-----|
| Distorted faces | Composition too busy | Crop tighter, reduce scene complexity |
| Wrong colors | Vague color descriptors | Use specific color names or hex codes |
| Extra/wrong hands | Complex pose | Simplify pose, specify "five fingers clearly visible" |
| Style drift | Accumulated errors | Re-upload previous "good" image, make single edit |
| Over-edited background | Unintended scope | Use explicit spatial directive ("Change only the left half") |
| Blurry text | Text rendering limitation | Use Pro model or generate text in separate pass |
| Wrong aspect ratio | Not specified | Always state aspect ratio explicitly |

---

## Iterative Refinement Workflow

### The Disciplined Iteration Loop

Follow this systematic workflow for best results:

**Step 1: Brief (Write the Foundational Prompt)**
- Capture core intent clearly
- Include all essential constraints
- Specify style, dimensions, constraints
- Keep modular and focused

**Step 2: Generate (Create Initial Candidates)**
- Produce one or two variations initially
- Avoid the temptation to generate 10 variations
- Quality > quantity at this stage

**Step 3: Inspect (Evaluate Against Brief)**
- Does it match your intent?
- Identify specific failures (hands, text, lighting, composition)
- Note what worked well

**Step 4: Constrain/Isolate (Make One Change)**
- Change only one variable per iteration
- Reference the previous image explicitly ("Keep this person exactly as shown")
- Reset context if style drift is observed (start new session)

**Step 5: Document (Track Provenance)**
- Save prompt, output, and edit log
- Track what worked and what didn't
- Build a reusable library over time

### Common Iteration Patterns

**Pattern 1: Gradual Refinement**
```
Turn 1: "Create a base image of [SCENE]"
↓ (Inspect: Lighting is too flat)
Turn 2: "Now adjust only the lighting to [NEW LIGHTING]. Keep everything else unchanged."
↓ (Inspect: Better, but colors need adjustment)
Turn 3: "Adjust only the color palette to [NEW COLORS]. Preserve composition and lighting."
```

**Pattern 2: Reference Anchoring**
```
Turn 1: "Create a portrait of a woman, confident, professional setting"
↓ (Inspect: Face looks good, but clothing is wrong)
Turn 2: (Upload generated image) "Keep this person's face exactly as shown.
Change only the clothing to [NEW CLOTHING]. Preserve her expression and pose."
```

**Pattern 3: Progressive Detail Addition**
```
Turn 1: "Create a simple landscape of [BASIC SCENE]"
↓ (Inspect: Composition is solid)
Turn 2: "Add more environmental detail: [NEW DETAILS]. Keep composition and lighting."
↓ (Inspect: Good)
Turn 3: "Enhance the mood by adjusting [SPECIFIC ELEMENTS]. Maintain everything else."
```

### Semantic Negatives Technique

Negative instructions can paradoxically increase the likelihood of unwanted elements. Use semantic alternatives instead.

**Ineffective:**
```
"Create a portrait without clutter, no extra hands, no text"
```

**Effective:**
```
"Create a clean portrait with minimal background, clear hands with five fingers each,
and no visible text or watermarks"
```

The key is describing what *should* be present instead of what shouldn't.

---

## Advanced Techniques

### Prompt Layering Strategy
Build prompts in layers of increasing specificity:
1. **Foundation**: Subject + basic context
2. **Enhancement**: Add style and quality
3. **Refinement**: Include technical specifications
4. **Polishing**: Add atmospheric and mood elements

### Negative Space Utilization
- **Breathing Room**: "Surrounded by empty space for text overlay"
- **Focus Enhancement**: "Isolated subject against clean background"
- **Compositional Balance**: "Asymmetrical subject placement with negative space balance"

### Multi-Element Coordination
- **Foreground/Background**: "Sharp foreground subject with blurred background"
- **Color Harmony**: "Complementary color scheme throughout composition"
- **Thematic Consistency**: "All elements support central theme"

### Cultural and Context Sensitivity
- **Authentic Representation**: Research cultural elements for accuracy
- **Appropriate Context**: Ensure setting matches subject appropriately
- **Respectful Portrayal**: Avoid stereotypes or inappropriate cultural mixing

### Iteration and Refinement Process
1. **Start Simple**: Basic subject, context, style
2. **Test and Evaluate**: Generate initial images
3. **Identify Gaps**: What's missing or unclear?
4. **Add Specificity**: Enhance weak areas
5. **Refine Balance**: Ensure all elements work together
6. **Final Polish**: Add quality and professional modifiers

---

## Example Progressive Prompt Development

### Initial Concept
"Woman drinking coffee"

### Basic Enhancement
"Portrait of woman drinking coffee in café, natural lighting"

### Style Addition
"35mm portrait of woman drinking coffee in vintage café, warm natural lighting, documentary photography style"

### Quality and Technical Enhancement
"35mm lens portrait of middle-aged woman savoring morning coffee in rustic vintage café, warm golden hour natural lighting streaming through large windows, documentary photography style, high-quality, professional composition"

### Final Professional Polish
"85mm lens intimate portrait of thoughtful middle-aged woman with kind eyes savoring morning coffee in charming rustic vintage café with exposed brick walls and large windows, warm golden hour natural lighting creating soft shadows, documentary lifestyle photography style, shot on film, high-quality professional composition, 4K resolution"

---

This comprehensive guide provides the framework for creating effective image generation instructions across any subject matter, style, or technical requirement. Remember that the best prompts balance specificity with clarity, and iteration is key to achieving optimal results.