# Capability: Execute Workflow

Execute an n8n workflow via webhook URL or invocation file reference.

## Parameters

**One of the following required:**

* `workflow_url` - Full webhook URL to execute
* `invocation_file` - Path to invocation infoset YAML

**Optional:**

* `payload` - JSON payload to send (overrides invocation defaults)
* `async_mode` - `poll` (default) or `fire_and_forget`

## Process

1. **Resolve workflow URL:**
   - If `workflow_url` provided → use directly
   - If `invocation_file` provided → read and extract URL
     - If invocation uses `url_path` (short form), requires `api_base_url` in user config
2. **Validate URL** against `allowed_url_patterns` if configured
3. **Build payload:**
   - Start with invocation `example_payload` if exists
   - Override with user-provided `payload`
   - when you need to pass an input or output in a payload as an URL you can:
      - pass inputs as: `workspace://some path to a file` and the tool will convert it to a readable presigned URL
      - pass outputs as: `workspace+write://some path to a file` and the tool will convert it to a writable presigned URL
4. **Execute via n8n_workflow tool:**
   ```
   action: execute
   async_mode: poll | fire_and_forget
   workflow_url: <resolved URL>
   payload: <payload>
   ```
5. **Return result:**
   - **poll mode:** Return `job_id`, suggest using `check_job_status` later
   - **fire_and_forget:** Return immediate response summary

## Key Behaviors

* If user provides topic/name instead of path, search `n8n/invocations/` for matching file
* Warn if payload doesn't match expected `payload_schema` from invocation
* For poll mode, note the response will be saved to `n8n/outputs/{job_id}.json`

## Example

**User:** "Run the summarize-contents workflow with source file /some_folder/article.md"

**Agent:**

1. Find `n8n/invocations/summarize-contents-invocation.yaml`
2. Extract webhook URL
3. Build payload: `{"sourceUrl": "workspace://some_folder/article.md"}`
4. Execute with poll mode
5. Respond:

```
Workflow submitted!

Job ID: abc123def456
Status: submitted
Response will be saved to: n8n/outputs/abc123def456.json

Use check_job_status to monitor progress.
```

## Error Cases

| Error | Response |
|-------|----------|
| Neither URL nor invocation provided | Ask user for workflow URL or invocation file |
| Invocation file not found | List available invocations in `n8n/invocations/` |
| URL not in allowed patterns | Explain restriction, suggest adding pattern to config |
| Payload schema mismatch | Warn but proceed (non-blocking) |
