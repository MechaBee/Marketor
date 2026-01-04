# Marketor - The Vibe Marketing Platform

The Marketing skillset used by [mechabee.com/marketor/](https://mechabee.com/marketor)

## Skills (Table of Contents)

Each skill lives under `skills/<skill-id>/` and is defined by a `skill-manifest.yaml`.

| Skill | Status | Purpose | Capabilities |
| --- | --- | --- | --- |
| [`brand-onboarding`](skills/brand-onboarding) ([manifest](skills/brand-onboarding/skill-manifest.yaml)) | active | Complete brand workspace setup, research, and foundational marketing scaffolding. | [setup-brand-workspace](skills/brand-onboarding/capabilities/setup-brand-workspace.md)<br>[create-marketing-plan](skills/brand-onboarding/capabilities/create-marketing-plan.md)<br>[scaffold-regular-social](skills/brand-onboarding/capabilities/scaffold-regular-social.md) |
| [`campaign-management`](skills/campaign-management) ([manifest](skills/campaign-management/skill-manifest.yaml)) | beta | Manage campaign lifecycle: capture ideas, scaffold campaigns, maintain summaries. | [create-idea](skills/campaign-management/capabilities/create-idea.md)<br>[create-campaign](skills/campaign-management/capabilities/create-campaign.md)<br>[update-summary](skills/campaign-management/capabilities/update-summary.md) |
| [`source-ingestion`](skills/source-ingestion) ([manifest](skills/source-ingestion/skill-manifest.yaml)) | beta | Ingest and summarize URLs/documents into reusable workspace knowledge files. | [summarize-external-source](skills/source-ingestion/capabilities/summarize-external-source.md) |
| [`blog-authoring`](skills/blog-authoring) ([manifest](skills/blog-authoring/skill-manifest.yaml)) | beta | Produce long-form blog drafts aligned with campaign goals and SEO intent. | [generate-blog-post](skills/blog-authoring/capabilities/generate-blog-post.md)<br>[generate-ideas](skills/blog-authoring/capabilities/generate-ideas.md) |
| [`social-authoring`](skills/social-authoring) ([manifest](skills/social-authoring/skill-manifest.yaml)) | active | Generate and validate platform-specific social content (FB/IG/Google/LinkedIn). | [create-social-post](skills/social-authoring/capabilities/create-social-post.md)<br>[validate-social-posts](skills/social-authoring/capabilities/validate-social-posts.md) |
| [`image-generation`](skills/image-generation) ([manifest](skills/image-generation/skill-manifest.yaml)) | beta | Generate AI images with optimized prompts; maintain brand-level image guidelines. | [generate-image](skills/image-generation/capabilities/generate-image.md)<br>[generate-brand-guidelines](skills/image-generation/capabilities/generate-brand-guidelines.md) |
| [`content-scheduling`](skills/content-scheduling) ([manifest](skills/content-scheduling/skill-manifest.yaml)) | active | Schedule, publish, and validate content calendars across campaigns and platforms. | [initialize-calendar](skills/content-scheduling/capabilities/initialize-calendar.md)<br>[schedule-post](skills/content-scheduling/capabilities/schedule-post.md)<br>[list-posts](skills/content-scheduling/capabilities/list-posts.md)<br>[review-drafts](skills/content-scheduling/capabilities/review-drafts.md)<br>[mark-published](skills/content-scheduling/capabilities/mark-published.md)<br>[validate-schedule](skills/content-scheduling/capabilities/validate-schedule.md) |
| [`landing-page-authoring`](skills/landing-page-authoring) ([manifest](skills/landing-page-authoring/skill-manifest.yaml)) | beta | Generate and manage conversion-focused landing pages as markdown content. | [create-landing-page](skills/landing-page-authoring/capabilities/create-landing-page.md)<br>[update-landing-page-section](skills/landing-page-authoring/capabilities/update-landing-page-section.md)<br>[list-landing-pages](skills/landing-page-authoring/capabilities/list-landing-pages.md) |


## How is this used by Marketor?

This skillset is initialized into each user new workspace when creating a new one.

## Why this project?

The idea behind this project is to open the skills definition and build a community around Marketor so that open contributions can make it more robust and versatile.

## How this project is used

With each new release we refresh the skillset according to this project. This will seed new workspaces.

## Customization

MechaBee platform user settings is extended to allow the upload of personalized skillsets per agent, so that you can branch off and customize the behaviour of Marketor.

In order to upload your version, go to account / agent settings and  "Agent Bundles" section will let you upload your own skillset. You need to create a .zip file with the skills directory inside and the bundle you need to upload is that .zip file.

From then on, until you remove your skillset it will be used to override the default scaffolding process when creating a new Workspace.

This allows you to customize the basuc Marketing AI Agent workflows however you like.

## Approaches to customization

### Use MechaBee itself to customize it's own skills
Once you find a workflow that works for you, you can easily prompt the agent to save and add a new capability to an existing skillset or create and register a new skill. Then:
1. simply copy / paste the created skill files to a locally checked out repo
2. update the checked out files / add new files as required
3. zip the skills directory (with the skills folder included)
3. upload your skill zip bundle

### Use a coding agent like Claude Code or Codex to develop new skills
TBD

