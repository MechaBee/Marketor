# n8n Workflows Skill

Manage n8n workflow automation including execution, downloading, uploading, validation, and invocation metadata.

## Quick Reference

| Goal | Capability | Example Trigger |
|------|------------|-----------------|
| Execute a workflow | `execute_workflow` | "Run the summarize-contents workflow" |
| Check async job | `check_job_status` | "Is job abc123 done?" |
| Download from n8n or URL | `download_workflow` | "Download workflow W12345 from n8n" / "Download workflow from GitHub" |
| Validate before upload | `validate_workflow` | "Validate the workflow in authoring/" |
| Upload to n8n | `upload_workflow` | "Deploy workflow to n8n" |
| Register execution info | `register_invocation` | "Register invocation for summarize workflow" |

## Workspace Structure

```
n8n/
├── outputs/              # Response JSONs from executions
│   └── {job_id}.json
├── staging/              # Workflow definitions from any source
│   └── {name}.json       # (n8n API, GitHub, manual download)
├── authoring/            # Workflows being edited/created
│   └── {name}.json
└── invocations/          # Execution configuration files
    └── {name}-invocation.yaml
```

## User Configuration

The skill relies on an optional user-level config file the user must have already set up the `n8n_config.yaml` configuration file in the web app UI /account page "Agent Settings" tab. (not visible by the workspace sandbox of the Ai Agent)

> [!IMPORTANT]
> This file is managed by the user via UI "Agent Settings" tab. The AI capability
> is aware this file may exist but cannot read its contents directly for security
> reasons. The n8n tool itself has access when executing operations.

**Required for upload/download operations (n8n API only):**
- `api_base_url` - Base URL of n8n instance
- `api_key` - API key for authentication

**Optional:**
- `allowed_url_patterns` - Glob patterns to restrict webhook URLs

## Invocation Infosets

Invocation files store reusable execution configuration:

```yaml
# n8n/invocations/summarize-contents-invocation.yaml
workflow_name: summarize-contents
description: Summarizes content from source URL to target

execution:
  # Full URL OR short path (if api_base_url is set)
  url: "https://moob.app.n8n.cloud/webhook/summarize-contents"
  # OR: url_path: "summarize-contents"

payload_schema:
  sourceUrl:
    type: string
    description: "URL of content to summarize"
    required: true
  targetUrl:
    type: string
    description: "Destination URL for summary"
    required: true

# Optional fields
example_payload:
  sourceUrl: "https://example.com/article"
  targetUrl: "https://example.com/summary"

async_mode: poll  # poll (default) | fire_and_forget
```

## Common Workflows

### Execute an Existing Workflow

```
User provides webhook URL or invocation file →
execute_workflow with payload →
(if poll) check_job_status later →
Read response from n8n/outputs/
```

### Download and Modify Workflow

```
download_workflow (saves to n8n/staging/) →
Copy to n8n/authoring/ for editing →
User edits workflow JSON →
validate_workflow →
upload_workflow
```

### Create New Workflow

```
User creates workflow JSON in n8n/authoring/ →
validate_workflow →
upload_workflow →
register_invocation (for future executions)
```

## Payload Workspace References

When executing workflows, use special prefixes for file references:

- `workspace://<path>` - Input files (tool generates download URL)
- `workspace+write://<path>` - Output files (tool generates upload URL)

**Example payload:**
```json
{
  "inputFile": "workspace://data/source.csv",
  "outputFile": "workspace+write://n8n/outputs/result.csv"
}
```

## Tool Reference

All capabilities use the `n8n_workflow` tool with different action parameters:

| Capability | Tool Action |
|------------|-------------|
| execute_workflow | `action: execute` |
| check_job_status | `action: status` |
| download_workflow | `action: download` |
| upload_workflow | `action: upload` |
| validate_workflow | (local validation, no tool call) |
| register_invocation | (workspace write, no n8n tool call) |

**External downloads:** When `download_workflow` uses `source_url`, it calls the `http_request` tool to fetch the JSON and save it to `n8n/staging/`.

## Error Handling

| Error | Response Pattern |
|-------|------------------|
| Missing n8n_config.yaml | Explain that api_base_url/api_key needed, user must configure in Agent Settings |
| Invalid workflow JSON | List validation errors, suggest fixes |
| Webhook URL not allowed | Explain URL pattern restriction, suggest updating allowed_url_patterns |
| Job not found | Suggest job may have expired (TTL), offer to re-execute |

## See Also

- Detailed capability instructions in `capabilities/` directory
- Validation rules in `resources/n8n-workflow-validation-instructions.md`
- Templates in `templates/` directory
