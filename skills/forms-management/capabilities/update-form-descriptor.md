# Capability: Update Form Descriptor

Update an existing form descriptor while preserving valid schema structure.

## Parameters

**Required:**

- `form_id`

**Optional:**

- `title`
- `description`
- `section_definitions`
- `lifecycle_mode`
- `max_in_progress`
- `submission_id_prefix`

## Process

1. Read `/forms/{form-id}.yaml`.
2. If missing, return clear not-found guidance.
3. Validate existing descriptor before applying changes.
4. Apply requested updates without removing required top-level keys.
5. Keep `id` stable unless user explicitly requests a rename flow.
6. Re-validate:
   - ID safety
   - supported question types
   - lifecycle values
7. Write updated descriptor.
8. Return updated path and `form://` reference.

## Notes

If rename is requested:

- Require explicit confirmation.
- Move descriptor file accordingly.
- Update `submission.storage_root` if it contains `{form_id}`-derived paths.
