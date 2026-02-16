# Capability: Complete Submission

Mark a submission as completed in both meta and index files.

## Parameters

**Required:**

- `form_id`
- `submission_id`

## Process

1. Read descriptor and index.
2. Locate submission entry.
3. Read `meta.yaml` for submission.
4. Set completion fields in `meta.yaml`:
   - `status: completed`
   - `completed: true`
   - `completed_at`
   - `updated_at`
5. Set completion fields in index entry:
   - `status: completed`
   - `updated_at`
6. Update `latest_submission_id`:
   - if completed submission was latest and another in-progress exists,
     set latest to newest in-progress
   - otherwise keep current latest value
7. Persist index.
8. Return completion summary and file references.
