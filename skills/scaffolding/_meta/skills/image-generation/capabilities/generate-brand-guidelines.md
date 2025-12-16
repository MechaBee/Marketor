# Capability: generate_brand_guidelines

Generate comprehensive brand visual guidelines through structured consultation with the customer.

## When to Use

- Setting up a new brand/workspace
- Customer wants to establish visual identity
- Existing brand needs documented guidelines
- Refining or updating brand identity

## Required Parameters

- `workspace_id` - Target workspace identifier
- `brand_name` - Name of the brand/organization

## Workflow

### Phase 1: Discovery Questions

Ask customer structured questions to understand brand identity:

#### Color & Visual Identity
1. "What are your brand's primary colors? (If you have hex codes, please share them)"
2. "What mood or feeling should your brand visuals convey?" (professional, energetic, calm, playful, etc.)
3. "Do you have any existing brand materials I can review?" (logo, website, previous designs)

#### Design Style Preferences
4. "What design style resonates with your brand?" (Show examples: minimalist, bold, geometric, organic, illustrative, photographic)
5. "Are there any specific visual elements you want to include?" (shapes, patterns, textures)
6. "Should images include people? If yes, what types?" (diverse groups, professionals, lifestyle, none)

#### Technical Constraints
7. "Do you prefer solid colors or gradients?"
8. "How much negative space do you like in designs?" (minimal/busy vs generous/clean)
9. "What platforms will you primarily use?" (blog, LinkedIn, Instagram, Facebook, etc.)

#### Inspiration & Examples
10. "Can you share 2-3 brands or examples whose visual style you admire?"
11. "What should your brand visuals NOT look like?" (anti-examples)

### Phase 2: Generate Guidelines Document

1. Use template: `/_meta/skills/image-generation/resources/templates/brand-visual-guidelines-template.md`
2. Fill in sections based on customer responses
3. Add OKLCH values if only hex codes provided (use color conversion)
4. Create example prompt patterns based on stated preferences
5. Suggest appropriate image templates from template library

### Phase 3: Save and Confirm

1. Write guidelines to: `/policies/brand/image-generation-guidelines.md`
2. Present summary to customer
3. Ask: "Would you like me to generate a test image using these guidelines to validate the visual direction?"
4. If yes, create sample image using one of the templates

### Phase 4: Iteration (if needed)

- Refine based on customer feedback
- Update guidelines document
- Regenerate test images if requested

## Consultation Approach

**Style**: Conversational but efficient
- Ask 2-3 questions at a time (not all at once)
- Provide examples/options to make choices easier
- Show understanding by summarizing their vision
- Offer expert recommendations based on responses

**Example Opening**:
```
I'll help you create comprehensive brand visual guidelines. Let's start with the essentials:

1. What are your brand's primary colors? If you have hex codes, please share them.
2. What's the main mood you want your visuals to convey—professional and trustworthy, energetic and bold, calm and approachable, or something else?
3. Do you have any existing brand materials (logo, website) I should review for consistency?
```

## Output Location

**Primary File**: `/policies/brand/image-generation-guidelines.md`

**Optional Additional Files** (if brand is complex):
- `/policies/brand/color-palette.md` - Detailed color systems
- `/policies/brand/typography-guidelines.md` - Font usage rules
- `/policies/brand/template-examples.md` - Template application examples

## Validation

After generating guidelines:
1. Check all required sections are completed
2. Verify color codes are valid
3. Ensure template examples reference existing templates
4. Confirm platform specs are accurate
5. Test: Can these guidelines be applied to create an image?

## Related Resources

- Template library: `/_meta/skills/image-generation/resources/image-templates/`
- Brand guidelines template: `/_meta/skills/image-generation/resources/templates/brand-visual-guidelines-template.md`
- Prompt engineering guide: `/_meta/skills/image-generation/resources/how-to-instruct-image-generation.md`
