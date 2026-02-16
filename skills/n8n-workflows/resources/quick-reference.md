# n8n Workflows Quick Reference

## Capability Summary

| Capability | Action | Tool Call |
|------------|--------|-----------|
| Execute workflow | Run via webhook | `n8n_workflow(action="execute")` |
| Check job status | Poll async job | `n8n_workflow(action="status")` |
| Download workflow | Fetch from n8n API or URL | `n8n_workflow(action="download")` or `http_request(method="GET")` |
| Validate workflow | Local validation | No tool call |
| Upload workflow | Push to n8n API | `n8n_workflow(action="upload")` |
| Register invocation | Create infoset | Workspace write |

## Workspace Paths

| Path | Purpose |
|------|---------|
| `n8n/outputs/` | Execution response JSONs |
| `n8n/staging/` | Workflow definitions from any source |
| `n8n/authoring/` | Workflows being edited |
| `n8n/invocations/` | Execution configuration files |

## Payload Reference Prefixes

| Prefix | Purpose | Generated URL |
|--------|---------|---------------|
| `workspace://path` | Read input file | Presigned download URL |
| `workspace+write://path` | Write output file | Presigned upload URL |

## Async Modes

| Mode | Behavior |
|------|----------|
| `poll` | Returns job_id, saves response to file |
| `fire_and_forget` | Returns immediate response inline |

## Validation Quick Checklist

Before upload, workflow must:
- [ ] Have required fields: `name`, `nodes`, `connections`, `settings`
- [ ] NOT have read-only fields: `id`, `active`, `createdAt`, `updatedAt`, `tags`, `activeVersion`
- [ ] NOT have export-only fields: `pinData`, `versionId`, `meta`
- [ ] Have valid node structures
- [ ] Have connections referencing existing nodes

## Common Patterns

### Execute from invocation file
```
1. Read n8n/invocations/{name}-invocation.yaml
2. Extract URL and payload schema
3. Build payload from user input
4. Call n8n_workflow(action="execute", ...)
5. Return job_id for poll mode
```

### Download → Edit → Upload
```
1. download_workflow(workflow_id="W123")
2. Copy n8n/staging/W123.json → n8n/authoring/my-workflow.json
3. User edits
4. validate_workflow(workflow_path="n8n/authoring/my-workflow.json")
5. upload_workflow(workflow_path="n8n/authoring/my-workflow.json")
```

### External Download (GitHub raw)
```
1. download_workflow(source_url="https://raw.githubusercontent.com/org/repo/main/workflow.json")
2. Saved to n8n/staging/workflow.json
```

### Create invocation after upload
```
1. upload_workflow returns workflow ID
2. User provides webhook URL from n8n
3. register_invocation with URL and payload schema
4. Future executions can use invocation file
```
