# Capability: List Submissions

List and summarize submissions from `submissions-index.yaml`.

## Parameters

**Required:**

- `form_id`

**Optional:**

- `status` (`in_progress` or `completed`)
- `date_from` (ISO date or datetime)
- `date_to` (ISO date or datetime)
- `limit` (default 20)

## Process

1. Read descriptor and resolve index path.
2. Read `submissions-index.yaml`.
3. Normalize entries and sort by `updated_at` descending.
4. Apply filters (`status`, date window).
5. Apply `limit`.
6. Return concise report with:
   - submission id
   - status
   - created/updated timestamps
   - submission path
   - case id (if present)
7. Include index file reference for audit.

## Notes

If index is missing, return "no submissions yet" and suggest `start_submission`.
