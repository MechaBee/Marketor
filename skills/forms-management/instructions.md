# Forms Management Skill

Manage workspace forms with direct workspace file operations.

## Which Capability?

| Goal | Capability | Example Trigger |
|------|-----------|-----------------|
| Prepare forms storage | `initialize_forms_workspace` | "Initialize forms workspace" |
| Create descriptor | `create_form_descriptor` | "Create a customer intake form" |
| Update descriptor | `update_form_descriptor` | "Add a consent section to the intake form" |
| Emit UI reference | `open_form_reference` | "Open the customer intake form" |
| Start or resume | `start_submission` | "Start submission for customer intake" |
| Save one section | `save_section` | "Save section contact-details" |
| Complete submission | `complete_submission` | "Complete submission sub_20260206_101530_001" |
| List submissions | `list_submissions` | "Show completed submissions for customer intake" |

## Workspace Conventions

- Form descriptors live under `/forms/`.
- Submission data lives under `/data/forms/{form-id}/submissions/`.
- The canonical registry file is `submissions-index.yaml`.
- Each submission folder contains:
  - `meta.yaml`
  - `{section-id}.yaml` files

## Descriptor Contract

Expected top-level fields:

- `id`
- `version`
- `title`
- `description`
- `submission`
- `sections`

`submission` defaults:

- `storage_root: data/forms/{form_id}/submissions`
- `lifecycle.mode: resume_latest`
- `lifecycle.max_in_progress: 1`
- `id.prefix: sub`
- `id.scheme: timestamp_seq`

## Submission Lifecycle

- `resume_latest`:
  - Reuse latest `in_progress` submission if one exists.
  - Create a new submission only if none are in progress.
- `always_new`:
  - Always attempt to create a new submission.
  - Enforce `max_in_progress` gate before creation.

## ID Scheme

`timestamp_seq` format:

- `{prefix}_YYYYMMDD_HHMMSS_NNN`
- Example: `sub_20260206_101530_001`

`NNN` comes from `next_sequence` in `submissions-index.yaml`.

## Safety Rules

Reject IDs containing:

- `/`
- `\\`
- `..`

Validate section/question IDs against descriptor before writing section answers.

## Output Pattern

When user requests opening a form in chat UI, emit:

`form://forms/{form-id}.yaml`

Use this exact scheme and workspace-relative path.
