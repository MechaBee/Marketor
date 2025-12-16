# Brand Onboarding Skill

Set up a brand workspace end-to-end: create the workspace, gather brand intelligence, generate the marketing plan, and scaffold baseline structures needed for campaign execution.

## Which Capability?
| Goal | Capability | Example |
|------|------------|---------|
| Setup complete workspace for a brand | `setup_brand_workspace` | "Setup workspace for TravelCo using their website travelco.com" |
| Generate digital marketing strategy | `create_marketing_plan` | "Create a marketing plan for this workspace" |
| Scaffold regular social baseline | `scaffold_regular_social` | "Set up regular social content structure for the next 3 months" |

## Core Concepts

**Workspace Identity** – Workspace name and workspace id are aliases. Persist consistent naming when invoking tools or writing files.

**Dedicated Workspaces** – Best practice: create one workspace per brand. Avoid shared or 'default' workspaces for production work.

**Foundational Research** – Deep brand research via `setup_brand_workspace` provides intelligence base for all downstream activities (campaigns, content, strategy).

**Cost Transparency** – Only the deep research operation in `setup_brand_workspace` has visible cost (around 1USD). Always warn users before executing.

**Workspace Artifacts** – Generated knowledge lives under `/knowledge/`, campaigns under `/campaigns/`, strategy under `/policies/`.

## Standard Workflow

### Complete Brand Setup (Most Common)
```
setup_brand_workspace → create_marketing_plan → [begin campaigns]
```

**Step 1**: `setup_brand_workspace`
- Creates workspace structure
- Executes $1-3 deep research (with user confirmation)
- Gathers brand objectives
- Outputs: `/knowledge/brand-research.md`

**Step 2**: `create_marketing_plan`
- Reads vendor research
- Generates comprehensive strategy
- Outputs: `/policies/digital-marketing-plan.md`

**Result**: Campaign-ready workspace with intelligence base and strategic guidance.

### Strategy Refresh Only
```
create_marketing_plan (regenerate)
```
Use when workspace and research already exist but strategy needs updating.

## Tools Used
- `create_workspace_operations` – Provision new workspaces and scaffold defaults
- `workspace_read_operations` – Inspect existing structure, verify artifacts, list workspaces
- `workspace_write_operations` – Persist research and strategy files (indirectly via tools)
- `openai_deep_research` – Execute comprehensive brand intelligence gathering (cca 1USD cost)

## Best Practices

1. **Always start with `setup_brand_workspace`** for new brands - establishes complete foundation in one step
2. **Get explicit cost confirmation** before running deep research (cca 1USD)
3. **Verify workspace existence** using `workspace_read_operations(operation="list")` when uncertain
4. **Recommend dedicated workspaces** - one brand per workspace, avoid 'default' for production
5. **Capture brand objectives conversationally** during workspace setup - don't skip this step
6. **Guide users to marketing plan creation** after workspace setup completes
7. **Verify all file writes** by re-reading to confirm success
8. **Provide clear next steps** after each capability completes

## Common Patterns

### New Brand Onboarding
```
User: "I want to start marketing for AcmeCorp"
Agent:
1. Suggest setup_brand_workspace
2. Ask for workspace name, brand name, website URL
3. Warn about $1-3 research cost, get confirmation
4. Execute complete workspace setup
5. Suggest create_marketing_plan as next step
```

### Existing Workspace Enhancement
```
User: "Update our marketing strategy"
Agent:
1. Verify workspace exists
2. Check if /knowledge/brand-research.md exists
3. If research exists: run create_marketing_plan
4. If no research: suggest setup_brand_workspace first
```

## See Also
- Capability instructions under `capabilities/`:
  - `setup-brand-workspace.md` - Complete workspace setup process
  - `create-marketing-plan.md` - Strategy document generation
- Campaign lifecycle operations: `/_meta/skills/campaign-management`
