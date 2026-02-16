# Capability: Validate Workflow

Validate an n8n workflow JSON file before uploading to ensure it conforms to the n8n API schema.

## Parameters

**Required:**

* `workflow_path` - Path to workflow JSON file in workspace

## Process

1. **Read workflow file** from provided path
2. **Parse as JSON** - fail if invalid JSON
3. **Run validation checks** (see Validation Rules below)
4. **Report results:**
   - If valid: Confirm ready for upload
   - If invalid: List all issues with guidance

## Validation Rules

See `resources/n8n-workflow-validation-instructions.md` for complete rules.

### Top-Level Validation

**Required fields:**
- `name` (string)
- `nodes` (array)
- `connections` (object)
- `settings` (object)

**Read-only fields (must be absent for upload):**
- `id`, `active`, `createdAt`, `updatedAt`, `tags`, `activeVersion`

**Export-only fields (must be removed):**
- `pinData`, `versionId`, `meta`

### Node Validation

Each node in `nodes[]` must:
- Have valid type structure
- Not contain read-only fields (`createdAt`, `updatedAt`)
- Have `position` as array of numbers [x, y]

### Settings Validation

Allowed keys only:
- `saveExecutionProgress`, `saveManualExecutions`
- `saveDataErrorExecution`, `saveDataSuccessExecution`
- `executionTimeout`, `errorWorkflow`, `timezone`
- `executionOrder`, `callerPolicy`, `callerIds`
- `timeSavedPerExecution`, `availableInMCP`

### Connections Validation

- Must be an object
- Referenced node names must exist in `nodes[]`

## Key Behaviors

* Offer to auto-fix removable issues (strip read-only/export-only fields)
* If auto-fix applied, save corrected version to `n8n/authoring/{name}-validated.json`
* Always list all issues before auto-fix to get user confirmation

## Example

**User:** "Validate the workflow in n8n/authoring/my-workflow.json"

**Agent (with issues):**

```
Validation Results: my-workflow.json

❌ 3 issues found:

1. Read-only field present: `id` (will be stripped)
2. Export-only field present: `pinData` (will be stripped)  
3. Unknown settings key: `customField` (must be removed)

Would you like me to create a sanitized version ready for upload?
```

**Agent (valid):**

```
Validation Results: my-workflow.json

✅ Workflow is valid and ready for upload!

- Name: My Workflow
- Nodes: 5
- Connections: 4

Use upload_workflow to deploy to n8n.
```

## Error Cases

| Error | Response |
|-------|----------|
| File not found | List JSON files in n8n/staging/ and n8n/authoring/ |
| Invalid JSON | Show parse error, suggest checking syntax |
| Missing required field | Explain which field is missing and expected format |
| Invalid node structure | Point to specific node with issue |
