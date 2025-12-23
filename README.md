# Marketor - The Vibe Marketing Platform

The Marketing skillset used by [mechabee.com/marketor/](https://mechabee.com/marketor)


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

### Use MechaBee itself to customize
Once you find a workflow that works for you, you can easily prompt the agent to save and add a new capability to an existing skillset or create and register a new skill. Then:
1. simply copy / paste the created skill files to a locally checked out repo
2. update the checked out files / add new files as required
3. zip the skills directory (with the skills folder included)
3. upload your skill zip bundle

### Use a coding agent to develop new skills
TBD


