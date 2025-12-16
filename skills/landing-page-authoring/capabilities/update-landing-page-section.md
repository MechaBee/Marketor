# Capability: update_landing_page_section

## Purpose

Modify or optimize specific section of existing landing page. Supports content updates, conversion optimization, and applying latest best practices to individual sections.

## Required Parameters

- **page_slug**: Identifier of existing landing page
- **section_name**: Section to update (hero, benefits, features, social-proof, how-it-works, cta)

## Optional Parameters

- **new_content**: Replacement content for section
- **optimization_focus**: Specific aspect to improve (cta, headline, benefits, readability, seo)
- **apply_best_practices**: Boolean to fetch and apply latest page authoring guidelines

## Process

1. **Validate**: Check page exists, section name is valid
2. **Read current section**: Load existing content from `sections/[section_name].md`
3. **Determine update type**:
   - If `new_content` provided: Replace section content
   - If `optimization_focus` specified: Apply targeted improvements
   - If `apply_best_practices`: Fetch guides and optimize
4. **Apply updates**: Modify section based on type
5. **Regenerate full page**: Combine all sections into new `full-page_rev[n].md`
6. **Update metadata**: Increment revision if significant, update last_modified
7. **Confirm**: Report changes made, show before/after snippet

## Key Behaviors

**Optimization Focuses**:

**cta**: Improve call-to-action clarity, action-orientation, visibility
- Add urgency/scarcity elements
- Clarify value proposition
- Reduce friction language

**headline**: Strengthen benefit focus, clarity, emotional appeal
- Lead with outcome not feature
- Make scannable and concise
- Include target keyword naturally

**benefits**: Enhance problem-solution framing, specificity
- Convert features to benefits
- Add quantifiable results
- Address objections

**readability**: Improve scannability, sentence length, clarity
- Break long paragraphs
- Add bullet points
- Simplify language

**seo**: Optimize keyword placement, structure, meta elements
- Natural keyword integration
- Proper heading hierarchy
- Alt text for image placeholders

**Best Practices Application**:
- Fetch relevant guides via `system_guides_read_operations`
- Apply section-specific recommendations
- Maintain page consistency

**Revision Handling**:
- Minor updates: Update existing section, regenerate same revision
- Major changes: Create new revision (_rev2, _rev3)
- Preserve previous revision for comparison/rollback

## Section-Specific Guidance

**hero**: Focus on immediate value communication, clear primary CTA
**benefits**: Problem-solution clarity, specific outcomes
**features**: Detail without overwhelm, benefit framing
**social-proof**: Credibility signals, specific results
**how-it-works**: Simplicity, visual flow suggestion
**cta**: Urgency, clarity, risk reduction

## Error Scenarios

**Page not found**: List available pages, check slug spelling
**Invalid section**: Show valid section names for page
**No changes detected**: Suggest specific optimization focus
**Best practices unavailable**: Proceed with built-in optimization patterns

## Integration

→ **system_guides**: Fetch latest optimization guidance
→ **image-generation**: After text updates, suggest visual alignment (update/generate visuals)

## Output Format

Report updated section with:
- Section name and optimization applied
- Key changes made (brief bullet list)
- Updated full-page revision number
- Suggestion for next optimization or review
