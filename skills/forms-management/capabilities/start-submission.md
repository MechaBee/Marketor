# Capability: Start Submission

Start or resume a form submission according to descriptor lifecycle settings.

## Parameters

**Required:**

- `form_id`

**Optional:**

- `case_id`
- `force_new`

## Process

1. Read `/forms/{form-id}.yaml`.
2. Validate descriptor schema and submission settings.
3. Resolve storage root from `submission.storage_root`.
4. Ensure submission root exists.
5. Ensure index exists at `.../submissions-index.yaml`.
   - if missing, initialize from template.
6. Read lifecycle:
   - `mode`
   - `max_in_progress`
7. Find in-progress submissions from index.
8. Resume logic:
   - if `mode = resume_latest` and `force_new != true` and in-progress exists:
     - pick latest in-progress by `updated_at`
     - return resumed submission
9. Create-new logic:
   - if `mode = always_new` or no resumable submission:
     - enforce `max_in_progress` gate
     - if gate exceeded: block and explain
     - generate submission id `{prefix}_YYYYMMDD_HHMMSS_NNN`
     - increment `next_sequence`
     - create submission folder
     - write `meta.yaml`
     - append entry to index
10. Return submission id and paths.

## `meta.yaml` Minimum Fields

- `form_id`
- `submission_id`
- `status: in_progress`
- `completed: false`
- `created_at`
- `updated_at`
- `case_id` (if provided)
