# Capability: setup_brand_workspace

Provision a complete marketing workspace for a brand including directory structure, deep intelligence gathering, brand objectives, and readiness validation. This comprehensive capability combines workspace creation, vendor research, and brand onboarding into a single streamlined process.

## Preconditions
- User provides workspace name and brand details
- Access to brand's primary website or knowledge base URL

## Required Parameters
- `workspace_name` (alias: workspace_id)
- `brand_name`
- `source_url` - Primary brand website or knowledge base

## Optional Parameters
- `research_output_path` - Custom path for research file (default: `/knowledge/brand-research.md`)

## Workflow

### 1. Clarify Intent & Validate Inputs
- Confirm the desired workspace name
- Verify brand name and source URL with user
- Use `workspace_read_operations(operation="list")` to check for existing workspaces
- **Safety Check**: If workspace exists, confirm whether to:
  - Reuse existing workspace (skip creation, proceed to research)
  - Abort and use different name
- **Best Practice**: Recommend dedicated workspace per brand (avoid 'default' or shared workspaces)

### 2. Create Workspace Structure (if needed)
- **Auto-create workspace** if it doesn't exist
- Invoke `create_workspace` of `workspace_write_operations` with the confirmed name
- Capture system response and log scaffolded defaults
- **Post-Creation Verification**:
  - Re-list workspace directories to confirm scaffold
  - Inform user about key folders: `/campaigns`, `/knowledge`, `/policies`, `/calendar`

### 2b. Initialize Calendar Files (if missing)

Create the minimal calendar assets required by scheduling skills. Do not overwrite existing files without user confirmation.

- Ensure `/calendar/master-calendar.yaml` exists
  - If missing: initialize from template `/_meta/skills/content-scheduling/templates/master-calendar-template.yaml` to `/calendar/master-calendar.yaml`
  - Replace `last_updated: "[CURRENT_DATE]"` with today's date (YYYY-MM-DD)
  - Leave `campaigns: []` until calendars are created/registered
- Do NOT create `/regular-social/calendar.yaml` here (use `scaffold_regular_social` when needed)

### 3. Execute Deep Research

**PLEASE CONFIRM WITH HUMAN USER**: Deep research uses `openai_deep_research` tool which could cost around $1 USD and is a long-running process. Always notify user and get explicit confirmation before proceeding. User can ease on the cost by selecting the model (o4-mini-deep-research)

#### 3a. Plan the Research
- Load research instruction template: `/_meta/skills/brand-onboarding/templates/brand-research-instruction-template.md`
- Template provides structured outline covering:
  - Core business & company overview
  - Products & services
  - Target audience & market positioning
  - Brand personality & communications
  - Customer journey & sales process
  - SWOT analysis
  - Seasonality & industry trends
- Technical & digital assets
  - Summary & strategic recommendations

#### 3b. Execute Research Tool
- **Get user confirmation** for cca 1USD cost
- Execute `openai_deep_research` tool with:
  - Source URL: `source_url`
  - Research instructions: Based on template structure
  - model: use `o3-deep-research` for better results with `medium` effort.
  - Output format: Comprehensive markdown following template sections
- Monitor process (research may take several minutes)

#### 3c. Store Research Results
- Write research output to `/knowledge/brand-research.md`
- **File structure**: Include executive summary at top for quick reference:
  ```markdown
  # [Brand Name] - Brand Research Profile

  ## Executive Summary
  [3-5 key takeaways about brand, audience, opportunities]

  ## I. Core Business & Company Overview
  [Detailed research sections following template...]
  ```
- Verify file was written successfully

### 4. Gather Brand Objectives (Conversational)

After research is done, engage user to capture:

**Marketing Objectives**:
- Primary business goals (e.g., awareness, lead generation, sales)
- Key performance indicators (KPIs) they track
- Timeline and budget constraints if applicable

**Existing Assets**:
- Current marketing materials or campaigns
- Brand guidelines, style guides, messaging frameworks
- Previous campaign performance data

**Desired Channels**:
- Priority platforms (Instagram, Facebook, Google Ads, LinkedIn, etc.)
- Content types they want to focus on (video, static, carousel, etc.)
- Any platform restrictions or preferences

**Document objectives** in conversation memory for use in marketing plan creation.

### 5. Audit Existing Workspace Materials

- Search `/knowledge/` and `/knowledge/[brand_name]` for brand-specific content
- Search `/campaigns/` and `/campaign-ideas/` for existing campaign work
- **Gap Analysis**: Identify missing materials:
  - No campaigns? Suggest creating first campaign after marketing plan
  - No policies? Marketing plan will establish baseline strategy
  - Limited knowledge? Research file now provides foundation

### 6. Strategy Integration Check

- Check if `/policies/digital-marketing-plan.md` exists
- If exists, recommend user reviews it for alignment
- Note any brand-specific strategy guides in session notes

### 7. Verification & Summary Report

**Validation Checklist**:
- ✅ Workspace exists and accessible
- ✅ `/knowledge/brand-research.md` created with comprehensive research
- ✅ `/calendar/master-calendar.yaml` exists (created if missing)
- ✅ Brand objectives captured in conversation
- ✅ Workspace materials audited
- ✅ User acknowledged key findings

**Provide Summary**:
```
✅ Workspace Setup Complete: [workspace_name]

📁 Structure:
   - /campaigns (ready for campaign creation)
   - /knowledge (brand-research.md created)
   - /policies (ready for marketing plan)
   - /calendar (ready for scheduling)

📊 Research Completed:
   - Analyzed: [source_url]
   - Key Findings: [2-3 key insights from research]
   - Stored: /knowledge/brand-research.md

🎯 Brand Objectives Captured:
   - Goals: [summarize primary objectives]
   - Channels: [list priority platforms]
   - Focus: [content types or strategic emphasis]

📋 Workspace Status:
   - Existing campaigns: [count or "none"]
   - Knowledge files: [count]
   - Gaps identified: [list any major gaps]
```

### 8. Next-Step Recommendations

**Primary Next Step**: Suggest creating comprehensive marketing plan
```
🚀 Ready for Next Step: Create Marketing Plan

Would you like to generate a comprehensive digital marketing strategy
document? This will provide platform-specific guidance and strategic
framework for all your campaign work.

Use: create_marketing_plan
```

**Alternative Next Steps** (if user wants to proceed differently):
- Begin first campaign creation (if marketing strategy is already clear)
- Upload additional brand materials to `/knowledge`
- Review and refine research findings

## Escalation Patterns

### Workspace Creation Fails
- Capture error from `create_workspace_operations`
- Suggest manual verification of permissions
- Check if workspace name has invalid characters
- Escalate to operator if persistent failure

### Research Tool Fails
**Site Restrictions**: If `openai_deep_research` cannot access URL:
- Propose alternative URLs (about page, blog, documentation)
- Offer manual extraction: user provides text materials
- Suggest user-provided brand deck or guidelines

**Tool Error**: If research tool fails unexpectedly:
- Capture full error message
- Attempt retry with simplified research scope
- Fall back to manual research workflow

### Write Permission Fails
- If cannot write to `/knowledge/brand-research.md`:
  - Capture error details
  - Stop further write operations
  - Verify workspace exists and is writable
  - Escalate to operator

### User Declines Research Cost
- Explain value proposition: $1-3 investment provides foundation for all future campaigns
- Offer alternative: manual brand brief approach (user provides materials)
- Note: Without research, marketing plan quality will be limited

## Best Practices

1. **Always confirm workspace name** before any operations
2. **Get explicit cost confirmation** before running deep research
3. **Capture brand objectives conversationally** - don't skip this step
4. **Verify all file writes** by re-reading to confirm success
5. **Provide actionable next steps** - guide user to marketing plan creation
6. **Highlight key research insights** - don't just create files silently
7. **Check for dedicated workspace** - warn if using 'default' or generic names

## Integration Points

- **Next Step**: `create_marketing_plan` - Uses brand-research.md to generate strategy
- **Tools Used**:
  - `workspace_read_operations` - List and verify workspaces
  - `create_workspace_operations` - Provision new workspace
  - `openai_deep_research` - Execute comprehensive brand research
  - `workspace_write_operations` - Store research results (indirectly via tool)
- **Referenced Files**:
  - Input: `templates/brand-research-instruction-template.md`
  - Output: `/knowledge/brand-research.md`
  - Context: `/policies/digital-marketing-plan.md` (if exists)
