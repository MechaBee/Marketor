# Capability: create_marketing_plan

## Purpose

Generate comprehensive digital marketing strategy document covering platform-specific content formats, strategic principles, and campaign planning guidance.

## Preconditions

- Workspace exists (created via `setup_brand_workspace`)
- **Recommended**: `/knowledge/brand-research.md` exists with brand intelligence (from `setup_brand_workspace`)

## Parameters

**Optional**:
- **focus_platforms**: List of platforms to emphasize (e.g., `["instagram", "google-ads", "linkedin","facebook"]`)

## Process

### 1. Confirm Workspace Context

Verify workspace exists and gather foundational knowledge.

**Primary Knowledge Source**:
- `/knowledge/brand-research.md` - Comprehensive brand research (preferred, created by `setup_brand_workspace`)

**Additional Context Sources**:
- `/knowledge/*` - Any supplementary brand materials
- `/about.md` - Brand overview if present
- Conversation history - Brand objectives captured during workspace setup

**Required Context**:
- Brand name and identity
- Core products/services
- Target audience demographics
- Business goals and KPIs
- Marketing channels in use

**If brand-research.md is missing**: Warn user that marketing plan quality will be limited. Suggest running `setup_brand_workspace` first for best results.

### 2. Prepare the marketing plan

Use the `strategy_guide_policy_author` sub agent to create the marketing plan with proper instructions.

This is how you prepare the instructions:
#### 2.a. Load Template

Read marketing plan template from skill resources:
- `_meta/skills/brand-onboarding/templates/digital-marketing-plan-template.md`

Template includes:
- Project Trivia section structure
- Digital Marketing Strategy principles
- Platform-specific format guides (Instagram, Facebook, Threads, Google Ads, LinkedIn, Landing Pages)
- Placeholder markers for customization

### 2.b. Instruct the sub agent to create the marketing plan

Intelligently instruct the sub agent to create the marketing plan based on the template and the vendor research file.

**Base customization on**:
- `/knowledge/brand-research.md` (primary source)
- Brand objectives from conversation history
- Any supplementary knowledge files
- focus_platforms parameter if provided

**Trust the AI Assistant**: Use gathered context to make intelligent decisions about strategy emphasis, platform priorities, and messaging frameworks without over-specifying.

### 4. Write Marketing Plan

Write customized plan to: `/policies/digital-marketing-plan.md`

If file exists, confirm overwrite with user first.

### 5. Confirm Completion

Provide summary of what was created:
- Location: [file:policies/digital-marketing-plan.md]
- Platforms covered
- Key strategic principles included
- Suggested next steps

## Output Format

Marketing plan should follow template structure:
```
# Digital Marketing Strategy - [Brand Name]

## Project Trivia
[Company info, URLs, CTAs, audience]

## Digital Marketing Strategy
[Core principles, platform selection rationale]

## Platform-Specific Formats
### Instagram
[Format guides...]

### Facebook
[Format guides...]

[Continue for all platforms...]
```

## Common Workflows

**Standard Workflow**: Create marketing plan immediately after `setup_brand_workspace` completes. This provides strategic foundation before first campaign.

**Strategy Refresh**: Update existing plan when business goals or target platforms change. Re-run with updated brand objectives.

**Platform Expansion**: Regenerate with focus_platforms parameter when adding new marketing channels to emphasize specific platforms.

## Integration Points

- **setup_brand_workspace**: Recommended prerequisite - provides vendor research and brand objectives
- **campaign-management**: References marketing plan when creating campaign strategies
- **landing-page-authoring**: Uses landing page format section as structural guidance
- **social-authoring**: Platform format guides inform content generation standards

## Key Behaviors

**Context-driven customization**: Marketing plan reflects workspace's actual brand, not generic templates.

**Platform flexibility**: If focus_platforms provided, emphasize those sections while keeping others brief.

**Preserve technical detail**: Template's platform format specifications are valuable reference material - keep intact.

**Strategy alignment**: Cross-reference existing policies and about.md to maintain consistent brand voice.

## Error Scenarios

**Workspace not found**: Cannot create plan without workspace context - prompt to run `setup_brand_workspace` first.

**Missing vendor research**: If `/knowledge/brand-research.md` doesn't exist:
- Warn user that plan quality will be significantly reduced
- Strongly recommend running `setup_brand_workspace` first
- Only proceed if user explicitly wants generic plan

**Minimal workspace context**: If only workspace shell exists with no research or materials:
- Suggest `setup_brand_workspace` to establish proper foundation
- If user insists, create basic plan structure and note that refinement will be needed

**Overwrite concern**: If `/policies/digital-marketing-plan.md` exists:
- Inform user that file will be replaced
- Confirm before overwriting
- Suggest backing up existing file if it contains valuable custom content
