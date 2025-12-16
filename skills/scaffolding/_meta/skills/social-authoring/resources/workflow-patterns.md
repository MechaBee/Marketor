# Creation Workflow Patterns

Non-trivial patterns for social content creation. Assumes intelligent agent execution.

---

## Context Slug Usage

Context slugs differentiate content variations for same topic.

**Partnership Context:**
```
User: "Create Instagram reel about home emergency, context 'erste-cc'"
→ File: text_home-emergency_erste-cc_rev1.md
→ Incorporate partnership branding in content
```

**Seasonal Context:**
```
User: "Create Facebook post about home safety, context 'winter-prep'"
→ File: text_home-safety_winter-prep_rev1.md
→ Adapt messaging for seasonal relevance
```

**Group/Variation Context:**
```
User: "Create LinkedIn post about risk management, context 'gr2'"
→ File: text_risk-management_gr2_rev1.md
→ Different angle/messaging for A/B testing
```

---

## Source Material Integration

### File References

```
User: "Create carousel about credit card benefits, use campaigns/credit-cards/knowledge/bank-card-info.md"

Process:
- Read source file
- Extract key points
- Structure as carousel slides
- Cite source in notes

Response snippet:
"✅ Carousel created! Structure: 7 slides from bank-card-info.md
Source material integrated: bank-card-info.md"
```

### URL Crawling

```
User: "Create post about travel packages, crawl https://example.com/packages"

Process:
- Validate URL
- Delegate crawling to content_processor
- Extract current data
- Generate with sourced info
- Warn about data freshness

Response snippet:
"✅ Post created with current package info
⚠️ Verify pricing before scheduling (source data may change)"
```

---

## Revision Management

### Creating Revisions

```
User: "Create revision 2 of the travel insurance post, focus on adventure sports"

Process:
- Infer file from context ("the travel insurance post")
- Locate existing rev1
- Create rev2 with new angle
- Preserve previous revision

Response:
"✅ Revision 2 created: text_travel-insurance_rev2.md
Original preserved: text_travel-insurance_rev1.md
Changes: Adventure sports focus, updated audience targeting"
```

### Implicit Revision Reference

User can refer to "the [topic] post" - infer from workspace context which file they mean.

---

## Conflict Resolution

### File Already Exists

```
Agent detects: text_home-protection_rev1.md exists

Offer options:
1. Create revision 2
2. Overwrite existing
3. Add context slug (text_home-protection_[context]_rev1.md)
4. Cancel

User chooses → execute accordingly
```

Don't fail silently. Always inform and offer alternatives.

---

## Multi-Platform Adaptation

### Sequential Platform Variations

```
User: "Create Facebook and Instagram posts about home safety tips"

Process:
1. Create Facebook version first
2. After success, offer Instagram format options:
   - ig-reel (video, high engagement)
   - ig-carousel (multi-slide)
   - ig-image-post (single image)
3. Adapt content for chosen format

Key: Adapt, don't duplicate
- Adjust text length for platform
- Change hashtag strategy
- Modify CTA style
- Adjust tone if needed
```

### Content Reuse Across Platforms

When adapting:
- **Facebook → Instagram**: Shorten text, increase emoji usage, adjust hashtags
- **LinkedIn → Facebook**: Casualize tone, add engagement hooks
- **Google Ad → Social**: Expand from headlines to narrative
- **Blog → Social**: Extract key points, add hooks

---

## Custom Targeting

### Audience Override

```
User: "Create LinkedIn article about risk management for financial-advisors"

Process:
- Override default audience
- Adjust depth and tone for professionals
- Use industry terminology
- Include frameworks/case studies

Metadata:
**Target Audience**: financial-advisors (not generic)
**Objective**: thought-leadership (not generic engagement)
```

### Objective Override

```
User: "Create Google search ad, objective is conversion"

Process:
- Override default objective
- Prioritize conversion-focused copy
- Include clear pricing/offer
- Direct CTA with urgency

Adjust content strategy based on objective:
- awareness → educational, broad
- engagement → interactive, questions
- conversion → direct, offer-focused
- traffic → curiosity, click motivation
```

---

## Additional Instructions Integration

```
User: "Create Instagram story, additional instructions: focus on millennial audience, use trending slang, keep it fun"

Process:
- Pass custom instructions to content_processor
- Override default tone/style
- Flag if deviates from brand guidelines

Response:
"✅ Story created with custom tone
⚠️ Review for brand voice alignment (casual tone deviation)"
```

Use additional_instructions for:
- Tone adjustments
- Special requirements
- Experimental approaches
- Edge cases

---

## Key Behaviors

**Intelligent Inference:**
- "the [topic] post" → find most recent matching file
- Missing format → suggest most common for platform
- Context from conversation → carry forward parameters

**Conflict Avoidance:**
- Always check file existence before creating
- Offer alternatives, never fail silently
- Preserve previous versions when creating revisions

**Source Integration:**
- Read before generating
- Cite sources in content notes
- Warn about data freshness for URLs
- Extract key points, don't copy verbatim

**Platform Adaptation:**
- Understand platform culture and norms
- Adjust length, tone, hashtags appropriately
- Maintain content essence across adaptations

**Custom Parameters:**
- Honor user-specified audience/objective
- Adjust content depth and style accordingly
- Flag when diverging from standard patterns
