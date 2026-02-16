# Capability: Download Workflow

Download a workflow definition either from an n8n instance or some other external URL to the staging folder.

## Parameters

**One of the following required:**

* `workflow_id` - The n8n workflow ID to download
* `source_url` - External URL to download a workflow JSON (e.g., GitHub raw URL)

**Optional:**

* `output_path` - Destination path (default: `n8n/staging/{workflow_id}.json` or `n8n/staging/{basename}.json` for external URLs)
* `exclude_pinned_data` - Strip pinned test data from export (default: false)
* `auth_profile` - Name of auth profile for protected URLs (from `_meta/http_auth_profiles.yaml`)
* `headers` - Optional HTTP headers for external download

## Prerequisites

**For n8n API downloads:** User must have already set up the `n8n_config.yaml` configuration file in the web app UI /account page "Agent Settings" tab. This includes these values:
- `api_base_url` - Base URL of n8n instance
- `api_key` - API key for authentication

**For external URL downloads:** No n8n config required. If the URL is protected, use `auth_profile` (header/basic/digest) from `_meta/http_auth_profiles.yaml`.

If not configured, explain that user must set these in Agent Settings UI.

## Process

1. **If `source_url` provided (external):**
   - If GitHub web URL uses `/blob/`, convert to raw URL:
     `https://github.com/<owner>/<repo>/blob/<branch>/<path>` →
     `https://raw.githubusercontent.com/<owner>/<repo>/<branch>/<path>`
   - **Call http_request tool:**
     ```
     method: GET
     url: <source_url>
     output_workspace_path: <resolved path>
     auth_profile: <if specified>
     headers: <if specified>
     ```
2. **If `workflow_id` provided (n8n API):**
   - **Verify config exists** (api_base_url and api_key required)
   - **Call n8n_workflow tool:**
     ```
     action: download
     workflow_id: <provided ID>
     output_path: <resolved path>
     exclude_pinned_data: <if specified>
     ```
3. **Report success** with saved file location

## Key Behaviors

* Downloaded workflows go to `n8n/staging/` by default
* Suggest copying to `n8n/authoring/` if user wants to modify
* Mention `validate_workflow` before any re-upload
* External downloads must return JSON (HTML responses are usually an error)

## Example

**User:** "Download workflow W12345 from n8n"

**Agent:**

```
Workflow downloaded successfully!

Workflow ID: W12345
Workflow Name: Content Summarizer
Saved to: n8n/staging/W12345.json

To modify this workflow:
1. Copy to n8n/authoring/
2. Make edits
3. Run validate_workflow
4. Run upload_workflow
```

**User:** "Download workflow from GitHub https://github.com/acme/flows/blob/main/workflow.json"

**Agent:**

```
Workflow downloaded successfully!

Source URL: https://raw.githubusercontent.com/acme/flows/main/workflow.json
Saved to: n8n/staging/workflow.json
```

## Error Cases

| Error | Response |
|-------|----------|
| Config missing | Explain api_base_url and api_key required, direct to Agent Settings UI |
| Workflow not found | Verify workflow ID, check if user has access in n8n |
| API error | Report error details from n8n API |
| External URL not JSON | Explain likely HTML page (use GitHub raw URL) |
| External URL too large | Explain 10MB response limit |
