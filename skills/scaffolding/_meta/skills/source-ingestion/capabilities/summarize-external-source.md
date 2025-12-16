# Capability: summarize_external_source

Process content from an external URL and create a processed output file according to the instructions from the user.

## When to Use
- User provides a public URL to capture insights.
- Campaign knowledge needs an update with fresh data or reference material.
- Pre-work is required before drafting content or updating strategies.

## Required Parameters
- `source_url`
- `target_path` – Workspace-relative path where the sub agent output will be stored.

## Optional Parameters
- `summary_style` – e.g., executive summary, bullet digest, detailed notes.
- `sections_of_interest` – Topics or headings to focus on.
- `include_quotes` – Whether to capture direct quotations with citations.

## Workflow
1. **Validate Inputs**
   - Confirm the URL is accessible and relevant.
   - Determine the target path, make sure it does not overwrite critical files without confirmation.
3. **Ececute sub agent**
   - Execute the 'content_processor' sub agent with the required instructions.
4. **Verify & Report**
   - Check if file exists.
   - Provide the user with key findings and link to the workspace file.
   - Suggest downstream uses (content briefs, strategy updates, campaign messaging).


## Related References
- Campaign knowledge guidelines: `/policies/campaign-knowledge-processing-guide.md`
- Workspace orchestration skill for vendor profiles and foundational knowledge.
