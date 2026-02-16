# Capability: manage_wordpress_sites

Maintain WordPress site configuration entries in `_meta/wordpress-sites.yaml` so other capabilities can publish content reliably.

## When to Use
- User wants to add a new WordPress site configuration.
- User wants to update an existing site's URL, auth profile, or default status.
- User wants to confirm the stored configuration before publishing.

## Required Parameters
- `site_name` – Friendly key used under `sites:` (kebab-case preferred).

## Optional Parameters
- `posts_url` – Full REST endpoint (e.g., `https://your-site.com/wp-json/wp/v2/posts`). Or a domain and you will construct the full rest api url based on Customer specified domain. 
- `auth_profile` – A string, the auth profiles exist outside of Ai visible sandbox in order not to leak security info. It is to be maintained by the user on the /account web app page at "Agent Settings" tab. (user-managed).
- `default_status` – `draft` (default), `publish`, `pending`, `private`.
- `action` – `add` or `update` (infer from context if not provided).

## Workflow
1. **Load config**
   - Read `_meta/wordpress-sites.yaml`.
   - If missing, create a new file with `sites: {}`.

2. **Determine action**
   - If `site_name` exists and user says “update/modify”, treat as update.
   - If `site_name` does not exist, treat as add.
   - If ambiguous, ask for confirmation.

3. **Validate fields**
   - `posts_url` must be a valid http(s) URL and should end with `/wp-json/wp/v2/posts`.
   - `auth_profile` is required for new entries.
   - `default_status` must be one of: `draft`, `publish`, `pending`, `private`.

4. **Apply changes**
   - For add: create new entry under `sites` with provided fields.
   - For update: only overwrite fields explicitly provided by the user.
   - Preserve any fields the user did not mention.

5. **Write config**
   - Save updated YAML back to `_meta/wordpress-sites.yaml`.
   - Confirm the updated entry and show the file reference.

## Example
**User:** “Add my main blog site with https://myblog.com/wp-json/wp/v2/posts and auth profile wordpress-main.”

**Result:**
```
Added WordPress site: main-blog
- posts_url: https://myblog.com/wp-json/wp/v2/posts
- auth_profile: wordpress-main
- default_status: draft

Config updated: [file:_meta/wordpress-sites.yaml]
```

## Error Cases
| Error | Response |
|-------|----------|
| Config missing and no data provided | Ask for site_name + posts_url + auth_profile. |
| posts_url invalid | Request a full `.../wp-json/wp/v2/posts` URL. |
| site not found on update | Ask whether to create a new entry instead. |
