# Capability: Open Form Reference

Generate a chat-openable workspace reference for an existing form descriptor.

## Parameters

**Required:**

- `form_id`

## Process

1. Resolve descriptor path `/forms/{form-id}.yaml`.
2. Verify descriptor file exists.
3. Emit the exact chat reference:
   - `form://forms/{form-id}.yaml`
4. Optionally include descriptor path for navigation.

## Error Handling

If descriptor is missing:

- list available forms from `/forms/*.yaml`
- suggest creating descriptor first with `create_form_descriptor`
