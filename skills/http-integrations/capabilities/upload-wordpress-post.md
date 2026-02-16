# Capability: upload_wordpress_post

Publish a WordPress post via the REST API using the `http_request` tool.

## When to Use
- User wants to publish or upload content to a WordPress site.
- Content needs to be pushed from the workspace into WordPress drafts or published posts.

## Required Parameters
- `title`
- `content` (HTML or plain text). If the user provides a workspace file, read it and use its contents.

## Optional Parameters
- `site_name` – Friendly name from `_meta/wordpress-sites.yaml`.
- `posts_url` – Full REST endpoint (e.g., `https://your-site.com/wp-json/wp/v2/posts`).
- `auth_profile` – Name of auth profile in (user-managed, user must provde exact name from the account settings they did on the UI, you can instruct them to go the /account page and look for agent settings to setup authentication profiles).
- `status` – `draft` (default), `publish`, `pending`, `private`.
- `excerpt`
- `slug`
- `categories` – Array of numeric category IDs.
- `tags` – Array of numeric tag IDs.
- `featured_media` – Numeric media ID.
- `output_path` – Workspace path to save the response JSON.
- `workspace_id` – If the user is working in a non-default workspace.

## Workflow
1. **Resolve target site**
   - If `posts_url` is provided, use it directly.
   - Else load `_meta/wordpress-sites.yaml` and match by `site_name` or domain hints from the dialog.
   - If multiple sites match, ask the user to choose.

2. **Resolve authentication**
   - Use `auth_profile` provided by the user or from the site config.
   - If missing, ask the user to add one in UI /account "Agent Settings" tab.

3. **Build payload**
   - Required: `title`, `content`.
   - Optional: `status`, `excerpt`, `slug`, `categories`, `tags`, `featured_media`.
   - If no status is provided, default to `draft` (or config `default_status` if present).

4. **Execute request**
   - Use `http_request` with:
     - `method`: `POST`
     - `url`: resolved `posts_url`
     - `auth_profile`: resolved profile name
     - `body`: JSON string payload
     - `body_content_type`: `json`
     - `output_workspace_path`: `output_path` (if provided)

5. **Confirm result**
   - Report status code and post ID (if returned).
   - If `output_path` used, link to the response file.

## Example Tool Call
```
http_request(
  method="POST",
  url="https://your-site.com/wp-json/wp/v2/posts",
  auth_profile="wordpress-main",
  body_content_type="json",
  body="{\"title\":\"Hello World\",\"content\":\"<p>Draft content</p>\",\"status\":\"draft\"}"
)
```

## Error Cases
| Error | Response |
|-------|----------|
| Missing site config | Ask for `posts_url` or prompt to add `_meta/wordpress-sites.yaml`. |
| Auth profile not found | Ask user to configure on the web app UI in Agent Settings tab / adding a . |
| 401/403 response | Explain authentication failure and request updated credentials. |
| 404 response | Confirm the posts endpoint and site URL. |
| Validation error | Show WordPress error message and suggest fixes. |
