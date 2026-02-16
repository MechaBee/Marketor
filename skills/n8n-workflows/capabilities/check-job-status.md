# Capability: Check Job Status

Check the status of an async n8n workflow job.

## Parameters

**Required:**

* `job_id` - Job ID returned from a previous `execute_workflow` call

## Process

1. **Call n8n_workflow tool:**
   ```
   action: status
   job_id: <provided job_id>
   ```
2. **Parse response** and report to user

## Response Fields

| Field | Description |
|-------|-------------|
| `job_id` | The job identifier |
| `status` | `queued`, `running`, `completed`, or `failed` |
| `response_path` | Path to response JSON (when completed) |
| `http_status` | HTTP status code from n8n (when completed) |
| `execution_id` | n8n execution ID (if available) |
| `response` | Inline response content (for small payloads) |
| `error` | Error message (if failed) |

## Key Behaviors

* If status is `completed`, offer to read the response file
* If status is `failed`, show error and suggest troubleshooting
* Jobs expire after TTL (typically 2 hours), inform user if not found

## Example

**User:** "Check status of job abc123def456"

**Agent:**

```
Job Status: abc123def456

Status: completed
HTTP Status: 200
Response saved to: n8n/outputs/abc123def456.json

Would you like me to read the response?
```

## Error Cases

| Error | Response |
|-------|----------|
| Job not found | Job may have expired (TTL ~2 hours). Suggest re-executing the workflow. |
| Job still running | Report status, suggest checking again later |
