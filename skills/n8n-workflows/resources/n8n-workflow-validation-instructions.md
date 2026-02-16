# n8n Workflow Validation Instructions (OpenAPI v1.1.1)

Purpose: Validate an exported n8n workflow JSON before uploading it to the n8n Public API.

Source of truth: n8n OpenAPI schema (workflow, node, workflowSettings) in `n8n-openapi-doc.json`.

---

## 1) Top-level validation

1. The workflow must be a JSON object.
2. Allowed top-level keys only (no extras):
   - id
   - name
   - active
   - createdAt
   - updatedAt
   - nodes
   - connections
   - settings
   - staticData
   - tags
   - shared
   - activeVersion
3. Required keys:
   - name
   - nodes
   - connections
   - settings
4. Read-only keys (must be absent for upload; strip or reject):
   - id
   - active
   - createdAt
   - updatedAt
   - tags
   - activeVersion
   Note: Even though these keys appear in the schema, they are marked readOnly and are invalid for create/upload requests.
5. Common export-only keys that are invalid for upload (must be removed):
   - pinData
   - versionId
   - meta

If any required key is missing, or any unknown key is present, reject the workflow.

---

## 2) Type checks for top-level fields

- name: string
- nodes: array of node objects (see section 3)
- connections: object (see section 5)
- settings: object (see section 4)
- staticData (optional): object, JSON string, or null

---

## 3) Node validation (each item in nodes[])

Each node is a JSON object with allowed keys only:
id, name, webhookId, disabled, notesInFlow, notes, type, typeVersion, executeOnce,
alwaysOutputData, retryOnFail, maxTries, waitBetweenTries, continueOnFail (deprecated),
onError, position, parameters, credentials, createdAt, updatedAt

Read-only keys (must be absent for upload; strip or reject):
- createdAt
- updatedAt

Type checks:
- id, name, webhookId, notes, type, onError: string
- disabled, notesInFlow, executeOnce, alwaysOutputData, retryOnFail: boolean
- typeVersion, maxTries, waitBetweenTries: number
- position: array of numbers (expect [x, y])
- parameters: object (sub-keys allowed)
- credentials: object (typically { "<credType>": { "id": "...", "name": "..." } })

Recommended (not enforced by schema but practical):
- Each node SHOULD include id, name, type, typeVersion, position, parameters.
- Node names SHOULD be unique, because connections reference names.

---

## 4) settings validation (workflowSettings)

Allowed keys only:
saveExecutionProgress, saveManualExecutions, saveDataErrorExecution, saveDataSuccessExecution,
executionTimeout, errorWorkflow, timezone, executionOrder, callerPolicy, callerIds,
timeSavedPerExecution, availableInMCP

Type checks:
- saveExecutionProgress: boolean
- saveManualExecutions: boolean
- saveDataErrorExecution: enum "all" | "none"
- saveDataSuccessExecution: enum "all" | "none"
- executionTimeout: number
- errorWorkflow: string
- timezone: string
- executionOrder: string
- callerPolicy: enum "any" | "none" | "workflowsFromAList" | "workflowsFromSameOwner"
- callerIds: string (comma-separated list of workflow IDs)
- timeSavedPerExecution: number
- availableInMCP: boolean

If any unknown key is present, reject the workflow.

---

## 5) connections validation

Schema allows a generic object, but validate safely:
1. connections MUST be an object.
2. If present, keys SHOULD match node names in nodes[].
3. For each connection entry, the typical shape is:
   {
     "main": [
       [ { "node": "<NodeName>", "type": "main", "index": 0 } ]
     ]
   }
4. For each referenced "node" value, ensure a node with that name exists.

If any referenced node does not exist, reject the workflow.

---

## 6) Final decision rules

Accept for upload only if:
- All required fields exist.
- No unknown top-level keys are present.
- No read-only or export-only fields remain.
- All nodes conform to the node schema and do not contain read-only keys.
- settings conforms to workflowSettings and has no extra keys.
- connections references only known nodes.

Otherwise, reject or sanitize (strip read-only/export-only keys and re-validate).

---

## 7) Minimal valid payload example (schema-compliant)

```json
{
  "name": "Example Workflow",
  "nodes": [],
  "connections": {},
  "settings": {}
}
```
