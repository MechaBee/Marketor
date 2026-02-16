# Capability: Save Section

Validate and save one section answer payload for a submission.

## Parameters

**Required:**

- `form_id`
- `submission_id`
- `section_id`
- `answers`

**Optional:**

- `case_id`

## Process

1. Read and validate descriptor `/forms/{form-id}.yaml`.
2. Read `submissions-index.yaml` and locate submission.
3. Reject unknown submission IDs.
4. Reject writes to submissions already `completed`.
5. Validate section exists.
6. Validate answers:
   - question IDs must exist in target section
   - values must match question type and options
7. Write section file:
   - `.../{submission-id}/{section-id}.yaml`
8. Update `meta.yaml`:
   - `updated_at`
   - `status: in_progress`
   - `completed: false`
9. Update index entry:
   - `updated_at`
   - `status: in_progress`
10. Return saved path and timestamp.

## Section File Format

- `section_id`
- `updated_at`
- `answers` (validated object)
