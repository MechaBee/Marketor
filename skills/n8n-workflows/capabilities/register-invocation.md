# Capability: Register Invocation

Create or update an invocation infoset file for a workflow, storing execution configuration for reuse.

## Parameters

**Required:**

* `workflow_name` - Human-readable name for the workflow

**Optional (at least one URL form required for new registration):**

* `url` - Full webhook URL for execution
* `url_path` - Short path segment (requires api_base_url in config)
* `payload_schema` - Object describing expected payload fields
* `description` - Human-readable description
* `example_payload` - Sample payload for reference
* `async_mode` - Execution mode (`poll` or `fire_and_forget`)

## Process

1. **Determine file path:** `n8n/invocations/{workflow_name}-invocation.yaml`
2. **Check if exists:**
   - If exists: Read current content, merge updates
   - If new: Require at least one URL form
3. **Validate:**
   - If `url` provided: Must be valid HTTP(S) URL
   - If `url_path` provided: Warn that api_base_url required at runtime
4. **Write invocation file** with provided configuration
5. **Confirm** with summary

## Invocation File Format

```yaml
workflow_name: summarize-contents
description: Summarizes content from source URL to target

execution:
  url: "https://moob.app.n8n.cloud/webhook/summarize-contents"
  # OR: url_path: "summarize-contents"

payload_schema:
  sourceUrl:
    type: string
    description: "workspace relative path to content to summarize"
    required: true
  targetUrl:
    type: string
    description: "workspace relative path for summary"
    required: true

# Optional (URL will be prepared by the tool from the workspace:// schema)
example_payload:
  sourceUrl: "workspace://some_folder/article.md"
  targetUrl: "workspace+write://some_folder/summary.md"

# Optional (defaults to poll)
async_mode: poll
```

## Key Behaviors

* Use kebab-case for workflow_name to create filename
* Preserve existing fields when updating
* Validate payload_schema structure if provided

## Example

**User:** "Register invocation for the summarize workflow at https://moob.app.n8n.cloud/webhook/summarize-contents"

**Agent:**

```
Invocation registered!

File: n8n/invocations/summarize-contents-invocation.yaml

Configuration:
- Workflow: summarize-contents
- URL: https://moob.app.n8n.cloud/webhook/summarize-contents
- Async Mode: poll (default)

To execute this workflow, use:
"Run the summarize-contents workflow with payload {...}"
```

**User:** "Add payload schema - sourceUrl (required string) and targetUrl (required string)"

**Agent:**

```
Invocation updated!

File: n8n/invocations/summarize-contents-invocation.yaml

Added payload schema:
- sourceUrl: string (required)
- targetUrl: string (required)
```

## Error Cases

| Error | Response |
|-------|----------|
| No URL provided for new registration | Require either url or url_path |
| Invalid URL format | Report format requirements |
| Invalid payload_schema | Explain expected structure |
