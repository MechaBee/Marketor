# Capability: Initialize Forms Workspace

Ensure forms root folders exist for descriptor and submission lifecycle operations.

## Parameters

None.

## Process

1. Ensure `/forms/` exists.
2. Ensure `/data/forms/` exists.
3. Do not create sample descriptors by default.
4. Confirm both roots are ready.

## Result

Workspace contains required forms roots:

- `/forms/`
- `/data/forms/`

This capability is idempotent and safe to rerun.
