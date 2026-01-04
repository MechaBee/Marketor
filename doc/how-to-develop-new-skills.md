# Skills Framework - Developer Guide

## Overview

This guide provides comprehensive instructions for developing new skills and capabilities within the Skills Framework. It covers the entire lifecycle from concept to implementation, testing, and integration.

## Table of Contents

1. [When to Create a New Skill](#when-to-create-a-new-skill)
2. [Skill Design Principles](#skill-design-principles)
3. [Step-by-Step Skill Creation](#step-by-step-skill-creation)
4. [Capability Design Guidelines](#capability-design-guidelines)
5. [Writing Capability Instructions](#writing-capability-instructions)
6. [Testing and Validation](#testing-and-validation)
7. [Integration and Deployment](#integration-and-deployment)
8. [Templates and Examples](#templates-and-examples)
9. [Best Practices](#best-practices)
10. [Troubleshooting](#troubleshooting)

---

## When to Create a New Skill

### Create a New Skill When:

✅ **Domain-Specific Functionality**
- The functionality belongs to a distinct domain (e.g., calendar management, content validation, analytics)
- It has clear boundaries and doesn't overlap significantly with existing skills
- It requires specialized knowledge or processes

✅ **Multiple Related Capabilities**
- You need 3+ related capabilities that work together
- The capabilities share common concepts, validation rules, or workflows
- They operate on the same data structures or workspace areas

✅ **Reusable Across Campaigns**
- The functionality is needed across multiple campaigns or contexts
- It's not campaign-specific or one-off
- It provides general utility to users

### Add to Existing Skill When:

⚠️ **Extends Current Domain**
- The capability fits naturally within an existing skill's domain
- It uses the same tools and workspace structures
- It complements existing capabilities

⚠️ **Single Capability**
- You only need one capability
- It's closely related to existing capabilities
- Creating a new skill would be overkill

### Example Decision Tree:

```
Question: Do I need calendar-related functionality?
├─ Yes → Use calendar-scheduling skill
│  └─ Does capability exist?
│     ├─ Yes → Use existing capability
│     └─ No → Add new capability to calendar-scheduling
└─ No → Is it a new domain?
   ├─ Yes → Create new skill
   └─ No → Add to appropriate existing skill
```

---

## Skill Design Principles

### 1. Single Responsibility
- Each skill focuses on ONE domain
- Clear boundaries with other skills
- Cohesive set of capabilities

### 2. Conversational First
- Design for natural language interaction
- Support guided, interactive workflows
- Provide helpful prompts and suggestions

### 3. User Control
- Offer suggestions but let users decide
- Warn about issues but allow overrides
- Provide options, not mandates

### 4. Workspace-Native
- Use workspace file structure
- Respect workspace boundaries
- Work with existing conventions

### 5. Tool-Based
- Use existing platform tools
- Don't reinvent functionality
- Map capabilities to tools clearly

### 6. Extensible
- Design for future capabilities
- Use consistent patterns
- Document extension points

---

## Step-by-Step Skill Creation

### Phase 1: Planning

**1.1 Define Skill Scope**
```markdown
**Skill Name**: [descriptive-name]
**Domain**: [domain area]
**Purpose**: [one-sentence description]
**Target Users**: [who will use this]
**Key Capabilities**: [list 3-5 main capabilities]
```

**1.2 Identify Required Tools**
- List all platform tools needed
- Identify required vs. optional tools
- Check tool availability

**1.3 Define Workspace Paths**
- Identify workspace areas used
- Define file/folder patterns
- Document path conventions

**1.4 Design Capabilities**
- List all capabilities needed
- Define parameters for each
- Identify trigger patterns
- Map to tools

### Phase 2: Directory Structure

**2.1 Create Skill Directory**
```bash
/skills/[skill-name]/
  ├── skill-manifest.yaml
  ├── instructions.md
  ├── capabilities/
  └── examples/
```

**2.2 Create Capability Directories**
```bash
/skills/[skill-name]/capabilities/
  ├── [capability-1].md
  ├── [capability-2].md
  └── [capability-3].md
```

### Phase 3: Skill Manifest

**3.1 Create skill-manifest.yaml**

Template:
```yaml
# [Skill Name] Skill Manifest

skill_id: [skill-name]
version: "1.0"
status: beta  # Start with beta, move to active after testing

description: |
  [Multi-line description of skill purpose and scope]

capabilities:
  [capability_1]:
    description: [Brief description]
    instruction_file: capabilities/[capability-1].md
    required_params:
      - [param_1]
      - [param_2]
    optional_params:
      - [param_3]
    trigger_patterns:
      - "[pattern_1]"
      - "[pattern_2]"

required_tools:
  - [tool_1]
  - [tool_2]

optional_tools:
  - [tool_3]

workspace_paths:
  [path_name]: "[path_pattern]"

validation_rules:
  [rule_name]: [rule_value]
```

**3.2 Define Trigger Patterns**

Guidelines:
- Use regex patterns
- Make them specific but flexible
- Cover common phrasings
- Test with natural language

Examples:
```yaml
trigger_patterns:
  - "schedule.*post"        # Matches: "schedule post", "schedule a post"
  - "add.*to.*calendar"     # Matches: "add to calendar", "add post to calendar"
  - "ready.*to.*schedule"   # Matches: "ready to schedule", "I'm ready to schedule"
```

### Phase 4: Overview Instructions

**4.1 Create instructions.md**

Structure:
```markdown
# [Skill Name] Skill - Overview Instructions

## Purpose
[What this skill does and why it exists]

## Core Concepts
[Key concepts users and agents need to understand]

## Common Validation Rules
[Validation rules that apply across capabilities]

## Capabilities Quick Reference
[Brief description of each capability]

## Cross-Capability Workflows
[How capabilities work together]

## Error Handling Patterns
[Common errors and solutions]

## Best Practices
[Guidelines for using this skill effectively]

## Integration Guidelines
[How this skill integrates with other workflows]

## Tool Usage
[Which tools are used and how]
```

**4.2 Write Core Concepts**

Include:
- Domain-specific terminology
- Data structures used
- File/folder conventions
- Relationships between concepts

**4.3 Document Validation Rules**

Format:
```markdown
### [Rule Category]

1. **[Rule Name]**: [Description]
   - Valid: [examples]
   - Invalid: [examples]
   - Error message: [what to show user]
```

### Phase 5: Capability Instructions

**5.1 Create Capability File**

For each capability, create: `capabilities/[capability-name].md`

**5.2 Use Standard Structure**

```markdown
# Capability: [Capability Name]

## Purpose
[What this capability does]

## Required Parameters
[List with descriptions and examples]

## Optional Parameters
[List with descriptions and defaults]

## Execution Steps
[Detailed step-by-step instructions]

## Error Handling
[Error scenarios and responses]

## Output Format
[How to format results]

## Examples
[Complete conversational examples]

## Integration Notes
[How this capability works with others]

## Best Practices
[Guidelines for using this capability]
```

**5.3 Write Execution Steps**

Format:
```markdown
### Step [N]: [Step Name]

```
1. [Action to take]
   - [Detail or sub-action]
   - [Detail or sub-action]

2. [Next action]
   - [Detail]

3. If [condition]:
   - [Action]
   - [Alternative]

4. Proceed to Step [N+1]
```
```

Guidelines:
- Be specific and actionable
- Include tool calls explicitly
- Show decision points clearly
- Handle edge cases
- Validate at each step

**5.4 Write Error Handling**

Format:
```markdown
### [Error Name]
**Error**: [What went wrong]

**Response**:
```
"[User-friendly error message]

[Explanation of the issue]

[Suggested actions]

What would you like to do?"
```
```

Guidelines:
- Be specific about the error
- Explain why it happened
- Offer concrete solutions
- Maintain conversational tone
- Provide options, not just errors

**5.5 Create Examples**

Include:
- User request (natural language)
- Agent process (step-by-step)
- Agent response (conversational)
- Edge cases and variations

Format:
```markdown
### Example [N]: [Scenario Name]

**User Request**:
```
"[Natural language request]"
```

**Agent Process**:
1. [Step 1 with details]
2. [Step 2 with details]
3. [Result]

**Agent Response**:
```
"[Conversational response with results]

[Summary or next steps]"
```
```

### Phase 6: Registration

**6.1 Update Skill Registry**

Add to `/skills/skill-registry.yaml`:
```yaml
skills:
  - skill_id: [skill-name]
    skill_path: skills/[skill-name]
    manifest_file: skills/[skill-name]/skill-manifest.yaml
    version: "1.0"
    status: beta
    description: |
      [Brief description]
```

**6.2 Update Base Instructions**

Add to available skills section:
```markdown
### [skill-name] (v1.0, beta)

**Purpose**: [Brief description]

**Capabilities**:
1. **[capability_1]** - [Description]
2. **[capability_2]** - [Description]

**Required Tools**: [tool list]
```

---

## Capability Design Guidelines

### Naming Conventions

**Capability IDs**: Use snake_case
- ✅ Good: `schedule_post`, `validate_calendar`, `review_unscheduled`
- ❌ Bad: `schedulePost`, `Schedule-Post`, `schedule-a-post`

**Capability Files**: Use kebab-case
- ✅ Good: `schedule-post.md`, `validate-calendar.md`
- ❌ Bad: `schedule_post.md`, `SchedulePost.md`

### Parameter Design

**Required Parameters**:
- Only include truly required parameters
- Can't proceed without them
- No reasonable defaults

**Optional Parameters**:
- Have sensible defaults
- Enhance functionality
- Can be omitted

**Parameter Naming**:
- Use snake_case
- Be descriptive
- Avoid abbreviations
- Examples: `content_file_path`, `scheduled_date`, `campaign_id`

### Trigger Pattern Design

**Guidelines**:
1. **Be Specific**: Match the capability's purpose
2. **Be Flexible**: Allow natural variations
3. **Avoid Conflicts**: Don't overlap with other capabilities
4. **Test Thoroughly**: Try various phrasings

**Pattern Examples**:
```yaml
# Good patterns
trigger_patterns:
  - "schedule.*post"           # Flexible, specific
  - "add.*to.*calendar"        # Natural phrasing
  - "ready.*to.*schedule"      # Conversational

# Avoid
trigger_patterns:
  - "schedule"                 # Too broad
  - "schedule post for Nov 15" # Too specific
  - ".*post.*"                 # Too generic
```

### Validation Rules

**Define Clearly**:
- What's valid/invalid
- Why the rule exists
- How to fix violations

**Example**:
```yaml
validation_rules:
  date_format: "YYYY-MM-DD"
  date_format_explanation: "ISO 8601 standard for consistency"
  date_format_example: "2025-11-15"
  date_format_error: "Please use YYYY-MM-DD format (e.g., 2025-11-15)"
```

---

## Writing Capability Instructions

### Execution Steps Best Practices

**1. Be Explicit About Tools**
```markdown
❌ Bad:
1. Read the file

✅ Good:
1. Read the file using workspace_read_operations:
   - operation: "read"
   - file_path: [path]
   - workspace_id: [workspace]
```

**2. Show Decision Logic**
```markdown
❌ Bad:
1. Check if file exists

✅ Good:
1. Check if file exists:
   - Use workspace_read_operations(operation="exists")
   - If exists: proceed to Step 2
   - If not exists: report error and ask user for correct path
```

**3. Include Validation**
```markdown
✅ Good:
1. Validate date format:
   - Check format is YYYY-MM-DD
   - If invalid: report error with correct format example
   - Parse date to verify validity (no Feb 30, etc.)
   - If valid: proceed to Step 2
```

**4. Handle Edge Cases**
```markdown
✅ Good:
1. Search for content file:
   - Use workspace_read_operations(operation="list")
   - If no files found: report and suggest creating content
   - If multiple files found: present options to user
   - If one file found: use it and proceed
```

### Error Handling Best Practices

**1. Be User-Friendly**
```markdown
❌ Bad:
"Error: File not found"

✅ Good:
"I couldn't find the file at [path].

This might be because:
- The file was moved or renamed
- There's a typo in the path
- The file hasn't been created yet

Would you like me to:
1. Search for similar files
2. List all files in the campaign
3. Help you create the file

What would you prefer?"
```

**2. Provide Context**
```markdown
✅ Good:
"The date '[date]' is in the past.

Posts can only be scheduled for future dates.
Today is [current_date].

Please provide a future date for scheduling."
```

**3. Offer Solutions**
```markdown
✅ Good:
"⚠️ Scheduling conflict detected:

You're scheduling:
- [new_post] for [date] at [time]

Already scheduled:
- [existing_post] for [date] at [time]

Would you like to:
1. Schedule 2 hours later ([alternative_time])
2. Choose a different date
3. Proceed anyway (both posts at same time)

What's your preference?"
```

### Example Writing Best Practices

**1. Show Complete Workflows**
```markdown
### Example 1: [Scenario]

**User Request**: "[Natural language]"

**Agent Process**:
1. [Step with details]
2. [Step with details]
3. [Result]

**Agent Response**: "[Full conversational response]"
```

**2. Include Variations**
- Success cases
- Error cases
- Edge cases
- User corrections

**3. Show Conversational Flow**
```markdown
**User**: "Schedule posts"
**Agent**: "Which campaign?"
**User**: "Summer travel"
**Agent**: "[Proceeds with scheduling]"
```

---

## Testing and Validation

### Pre-Deployment Testing

**1. Capability Testing**

For each capability:
- [ ] Test with valid inputs
- [ ] Test with invalid inputs
- [ ] Test with missing parameters
- [ ] Test with edge cases
- [ ] Test error handling
- [ ] Test with real data

**2. Integration Testing**
- [ ] Test with other capabilities
- [ ] Test with existing workflows
- [ ] Test tool interactions
- [ ] Test workspace operations

**3. Trigger Pattern Testing**

Test each trigger pattern with:
- Exact match
- Natural variations
- Similar but different requests
- Potential conflicts

**4. Validation Rule Testing**
- [ ] Test each validation rule
- [ ] Test rule violations
- [ ] Test error messages
- [ ] Test edge cases

### Testing Checklist

```markdown
## Skill: [skill-name]

### Capability: [capability-name]

**Trigger Patterns**:
- [ ] Pattern 1: "[pattern]" - Tested with: [examples]
- [ ] Pattern 2: "[pattern]" - Tested with: [examples]

**Required Parameters**:
- [ ] [param_1]: Valid input tested
- [ ] [param_1]: Invalid input tested
- [ ] [param_1]: Missing input tested

**Optional Parameters**:
- [ ] [param_2]: With value tested
- [ ] [param_2]: Without value (default) tested

**Execution Steps**:
- [ ] Step 1: Tested successfully
- [ ] Step 2: Tested successfully
- [ ] Error handling: Tested

**Error Scenarios**:
- [ ] [Error 1]: Tested, message clear
- [ ] [Error 2]: Tested, message clear

**Integration**:
- [ ] Works with [capability_2]
- [ ] Works with [existing_workflow]

**Real Data Testing**:
- [ ] Tested with actual campaign data
- [ ] Tested with actual content files
- [ ] Tested with actual calendar
```

---

## Integration and Deployment

### Deployment Checklist

**Phase 1: Beta Release**
- [ ] All capability files created
- [ ] Skill manifest complete
- [ ] Overview instructions written
- [ ] Registered in skill-registry.yaml
- [ ] Status set to "beta"
- [ ] Testing completed
- [ ] Documentation reviewed

**Phase 2: User Testing**
- [ ] Test with real users
- [ ] Gather feedback
- [ ] Identify issues
- [ ] Document improvements needed

**Phase 3: Refinement**
- [ ] Fix identified issues
- [ ] Improve error messages
- [ ] Add missing examples
- [ ] Update documentation

**Phase 4: Active Release**
- [ ] All issues resolved
- [ ] Documentation complete
- [ ] Examples comprehensive
- [ ] Status changed to "active"
- [ ] Version updated if needed
- [ ] Base instructions updated

### Version Management

**Semantic Versioning**: MAJOR.MINOR.PATCH

**MAJOR** (e.g., 1.0 → 2.0):
- Breaking changes to capabilities
- Removed capabilities
- Changed parameter requirements
- Incompatible with previous version

**MINOR** (e.g., 1.0 → 1.1):
- New capabilities added
- New optional parameters
- Enhanced functionality
- Backward compatible

**PATCH** (e.g., 1.0 → 1.0.1):
- Bug fixes
- Documentation updates
- Error message improvements
- No functionality changes

---

## Templates and Examples

### Skill Manifest Template

```yaml
# [Skill Name] Skill Manifest

skill_id: [skill-name]
version: "1.0"
status: beta

description: |
  [Multi-line description of what this skill does,
  who it's for, and what problems it solves]

capabilities:
  [capability_name]:
    description: [One-line description]
    instruction_file: capabilities/[capability-name].md
    required_params:
      - [param_1]
      - [param_2]
    optional_params:
      - [param_3]
    trigger_patterns:
      - "[pattern_1]"
      - "[pattern_2]"
      - "[pattern_3]"

required_tools:
  - workspace_read_operations
  - workspace_write_operations

optional_tools:
  - [optional_tool_1]

workspace_paths:
  [path_name]: "[path_pattern]"
  [path_name_2]: "[path_pattern_2]"

validation_rules:
  [rule_name]: [rule_value]
  [rule_name_2]: [rule_value_2]
```

### Capability Instruction Template

```markdown
# Capability: [Capability Name]

## Purpose

[Detailed description of what this capability does and when to use it]

## Required Parameters

- **[param_1]** (type): [Description]
  - Example: [example_value]
  - Validation: [validation_rules]
  - Error if missing: [error_message]

- **[param_2]** (type): [Description]
  - Example: [example_value]
  - Validation: [validation_rules]

## Optional Parameters

- **[param_3]** (type): [Description]
  - Default: [default_value]
  - Example: [example_value]
  - When to use: [use_case]

## Execution Steps

### Step 1: [Step Name]
```
1. [Action to take]
   - [Detail]
   - [Detail]

2. [Validation or check]
   - If [condition]: [action]
   - If [condition]: [action]

3. Proceed to Step 2
```

### Step 2: [Step Name]
```
[Continue with steps...]
```

## Error Handling

### [Error Name]
**Error**: [What went wrong]

**Response**:
```
"[User-friendly error message]

[Explanation]

[Suggested actions]

What would you like to do?"
```

## Output Format

```
"[Success message]

[Details]

[Summary]

[Next steps]"
```

## Examples

### Example 1: [Scenario Name]

**User Request**:
```
"[Natural language request]"
```

**Agent Process**:
1. [Step]
2. [Step]
3. [Result]

**Agent Response**:
```
"[Conversational response]"
```

## Integration Notes

### With [Other Capability]
- [How they work together]
- [When to use both]
- [Workflow example]

## Best Practices

1. **[Practice 1]**: [Description]
2. **[Practice 2]**: [Description]
3. **[Practice 3]**: [Description]
```

---

## Best Practices

### Documentation

1. **Be Comprehensive**: Cover all scenarios
2. **Be Clear**: Use simple language
3. **Be Specific**: Provide exact examples
4. **Be Consistent**: Follow established patterns
5. **Be Helpful**: Anticipate questions

### Code Organization

1. **Consistent Structure**: Follow templates
2. **Clear Naming**: Use descriptive names
3. **Logical Grouping**: Related capabilities together
4. **Version Control**: Track changes properly

### User Experience

1. **Conversational**: Natural language first
2. **Helpful**: Provide guidance and suggestions
3. **Forgiving**: Handle errors gracefully
4. **Transparent**: Explain what's happening
5. **Efficient**: Minimize steps needed

### Maintenance

1. **Document Changes**: Keep changelog
2. **Test Regularly**: Verify functionality
3. **Update Examples**: Keep them current
4. **Gather Feedback**: Listen to users
5. **Iterate**: Continuously improve

---

## Troubleshooting

### Common Issues

**Issue**: Trigger patterns not matching
- **Cause**: Pattern too specific or too broad
- **Solution**: Test with various phrasings, adjust pattern
- **Prevention**: Include multiple pattern variations

**Issue**: Parameters not extracted correctly
- **Cause**: Ambiguous parameter names or unclear instructions
- **Solution**: Clarify parameter descriptions, add examples
- **Prevention**: Test with natural language variations

**Issue**: Error messages not helpful
- **Cause**: Generic error handling
- **Solution**: Add specific error scenarios with detailed responses
- **Prevention**: Think through all error cases during design

**Issue**: Capability conflicts with existing functionality
- **Cause**: Overlapping trigger patterns or similar names
- **Solution**: Make patterns more specific, rename if needed
- **Prevention**: Review existing skills before creating new ones

**Issue**: Tool calls failing
- **Cause**: Incorrect tool parameters or missing workspace_id
- **Solution**: Review tool documentation, add explicit parameters
- **Prevention**: Test tool calls with real data

### Getting Help

1. **Review Existing Skills**: Look at calendar-scheduling for examples
2. **Check Documentation**: Review base instructions and tool docs
3. **Test Incrementally**: Test each capability as you build
4. **Ask for Feedback**: Get user input early
5. **Iterate**: Don't expect perfection on first try

---

## Appendix: Calendar Scheduling Skill as Reference

The calendar-scheduling skill is a complete, production-ready example. Use it as a reference for:

- **Skill Structure**: See `/skills/calendar-scheduling/`
- **Manifest Design**: See `skill-manifest.yaml`
- **Overview Instructions**: See `instructions.md`
- **Capability Instructions**: See `capabilities/*.md`
- **Trigger Patterns**: See how patterns are designed
- **Error Handling**: See conversational error responses
- **Examples**: See complete workflow examples

### Key Lessons from Calendar Scheduling

1. **Conversational Design**: review_unscheduled capability shows interactive workflow
2. **Platform-Specific Logic**: Different rules for different platforms
3. **User Control**: Suggests but lets user decide
4. **Comprehensive Validation**: validate_calendar shows thorough checking
5. **Clear Examples**: Multiple examples for each capability

---

## Summary

Creating a new skill involves:

1. ✅ **Planning**: Define scope, capabilities, tools
2. ✅ **Structure**: Create directories and files
3. ✅ **Manifest**: Define capabilities and metadata
4. ✅ **Instructions**: Write overview and capability docs
5. ✅ **Testing**: Validate thoroughly
6. ✅ **Integration**: Register and deploy
7. ✅ **Maintenance**: Iterate and improve

**Remember**:
- Start with beta status
- Test with real data
- Gather user feedback
- Iterate based on usage
- Document everything
- Follow established patterns
- Keep user experience first

**Good luck building your skill!** 🚀