# Invocation Info Schema

This document describes the schema for n8n workflow invocation infoset files.

## File Location

`n8n/invocations/{workflow-name}-invocation.yaml`

## Schema

```yaml
# Required: Human-readable workflow name
workflow_name: string

# Optional: Description of what the workflow does
description: string

# Required: Execution configuration
execution:
  # One of the following is required:
  url: string      # Full webhook URL (e.g., https://moob.app.n8n.cloud/webhook/summarize-contents)
  url_path: string # Short path segment (requires api_base_url in n8n_config.yaml)

# Optional: Expected payload structure
payload_schema:
  <field_name>:
    type: string | number | boolean | object | array
    description: string
    required: boolean  # default: false

# Optional: Sample payload for reference
example_payload:
  <field_name>: <value>

# Optional: Execution mode (default: poll)
async_mode: poll | fire_and_forget
```

## Field Descriptions

| Field | Required | Description |
|-------|----------|-------------|
| `workflow_name` | Yes | Human-readable identifier, used in filename |
| `description` | No | What the workflow does |
| `execution.url` | One of url/url_path | Full webhook URL |
| `execution.url_path` | One of url/url_path | Short path (needs api_base_url) |
| `payload_schema` | No | Documents expected input fields |
| `example_payload` | No | Sample payload for quick reference |
| `async_mode` | No | `poll` (default) or `fire_and_forget` |

## Examples

### Full URL Example

```yaml
workflow_name: summarize-contents
description: Summarizes content from source URL to target location

execution:
  url: "https://moob.app.n8n.cloud/webhook/summarize-contents"

payload_schema:
  sourceUrl:
    type: string
    description: "URL of content to summarize"
    required: true
  targetUrl:
    type: string
    description: "Destination URL for summary"
    required: true

example_payload:
  sourceUrl: "https://example.com/article"
  targetUrl: "https://example.com/summary"
```

### Short Path Example (requires api_base_url in config)

```yaml
workflow_name: image-processor
description: Processes and optimizes images

execution:
  url_path: "image-processor"

payload_schema:
  imageUrl:
    type: string
    description: "Source image URL"
    required: true
  format:
    type: string
    description: "Output format (webp, png, jpg)"
    required: false
  quality:
    type: number
    description: "Quality 1-100"
    required: false

async_mode: fire_and_forget
```

### Workspace Reference Example

```yaml
workflow_name: csv-transformer
description: Transforms CSV data using workspace files

execution:
  url: "https://moob.app.n8n.cloud/webhook/csv-transform"

payload_schema:
  inputFile:
    type: string
    description: "Input file using workspace://file path"
    required: true
  outputFile:
    type: string
    description: "Output file using workspace+write://file path"
    required: true

example_payload:
  inputFile: "workspace://data/source.csv"
  outputFile: "workspace+write://n8n/outputs/result.csv"
```
