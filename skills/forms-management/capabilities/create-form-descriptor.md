# Capability: Create Form Descriptor

Create a new descriptor file at `/forms/{form-id}.yaml` using schema defaults.

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

1. Run `initialize_forms_workspace` if roots are missing.
2. Validate `form_id` safety (`/`, `\\`, `..` are forbidden).
3. Build target file path: `/forms/{form-id}.yaml`.
4. If file exists, ask for overwrite confirmation.
5. Start from `templates/form-descriptor-template.yaml`.
6. Populate top-level fields and submission settings.
7. Ensure at least one section and one question exist.
8. Validate all section/question IDs and question types.
9. Write descriptor YAML.
10. Return descriptor path and `form://` reference.

## Output

- File path: `[file:forms/{form-id}.yaml]`
- Form reference: `form://forms/{form-id}.yaml`
