# Capability: Upload Workflow

Upload a validated workflow JSON file to an n8n instance.

## Parameters

**Required:**

* `workflow_path` - Path to workflow JSON file in workspace

## Prerequisites

User must have already set up the `n8n_config.yaml` configuration file in the web app UI /account page "Agent Settings" tab. This includes these values:
- `api_base_url` - Base URL of n8n instance
- `api_key` - API key for authentication

If not configured, explain that user must set these in Agent Settings UI.

## Process

1. **Verify config exists** (api_base_url and api_key required)
2. **Read and validate workflow** (run validate_workflow checks)
3. **If validation fails:** Report issues, do not proceed
4. **Sanitize payload** (strip read-only and export-only fields)
5. **Call n8n_workflow tool:**
   ```
   action: upload
   workflow_path: <provided path>
   ```
6. **Report success** with created workflow ID

## Key Behaviors

* Always validate before upload (fail fast)
* Auto-sanitize removable fields without separate user confirmation
* Suggest creating an invocation file after successful upload

## Example

**User:** "Upload the workflow from n8n/authoring/my-workflow.json"

**Agent:**

```
Workflow uploaded successfully!

Workflow ID: W98765
Workflow Name: My Content Processor
Source: n8n/authoring/my-workflow.json

The workflow is now available in your n8n instance.

Next steps:
- Set up a webhook trigger in n8n if needed
- Use register_invocation to create execution metadata
```

## Error Cases

| Error | Response |
|-------|----------|
| Config missing | Explain api_base_url and api_key required, direct to Agent Settings UI |
| Validation failed | List validation errors, suggest using validate_workflow first |
| API error | Report error details from n8n API |
| Duplicate name | n8n may reject duplicates - suggest renaming |
