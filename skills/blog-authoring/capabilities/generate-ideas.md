# Capability: generate_ideas

Generate creative blog article angle ideas from product/service documentation or web sources. This capability helps kickstart blog content planning by analyzing source materials and producing structured angle suggestions.

## When to Use
- User requests blog topic ideas, angles, or content suggestions
- Need to explore different approaches to writing about a product/service
- Want to generate multiple blog perspectives from a single source
- Planning blog content calendar and need angle diversity

## Required Parameters
- `workspace_id` – Workspace identifier where source and output files are located. it defaults to the current workspace id set in the context.

## Optional Parameters
- `source_filepath` – Workspace-relative path to source document (e.g., 'knowledge/casco/product-info.md')
- `source_url` – External URL to analyze for blog ideas (alternative to source_filepath)
- `output_filepath` – Workspace-relative path for generated ideas (defaults to appropriate location based on source)
- `target_audience` – Intended reader profile to guide angle suggestions
- `content_goals` – Objectives for the blog content (awareness, engagement, conversion, etc.)
- `number_of_ideas` – How many angle ideas to generate (defaults to 8-10)

**Note:** Either `source_filepath` OR `source_url` must be provided, but not both.

## Output Path Convention

If `output_filepath` is not specified, the tool will determine an appropriate location:

**For knowledge files:**
```
knowledge/[topic-area]/blog-angle-ideas.md
```

**For campaign-related sources:**
```
campaigns/[campaign-name]/knowledge/blog-angle-ideas.md
```

**Custom output:**
```
[user-specified-path]
```

## Workflow

1. **Validate Input**
   - Confirm either `source_filepath` or `source_url` is provided
   - If `source_filepath`: verify file exists in workspace
   - If `source_url`: validate URL format
   - Determine output location if not specified

2. **Prepare Content Processor Brief**
   - Compile source information (filepath or URL)
   - Include target audience and content goals if provided
   - Specify number of ideas to generate
   - Define output structure requirements:
     * Angle title and description
     * Target audience for each angle
     * Key talking points
     * Content format suggestions
     * SEO keyword opportunities

3. **Delegate to Content Processor**
   - Invoke `content_processor` sub-agent with:
     * Source material (filepath or URL)
     * Output filepath (computed or user-specified)
     * Detailed instructions for angle generation
     * Request structured markdown output

4. **Verify Output**
   - After sub-agent completion, read generated file
   - Confirm structure includes:
     * Multiple distinct angle ideas
     * Clear descriptions for each angle
     * Target audience definitions
     * Content suggestions
   - Validate markdown formatting

5. **Report Results**
   - Summarize generated angles
   - Reference output file location
   - Suggest next steps:
     * Select angle for full blog post
     * Refine specific angles
     * Generate additional variations

## Content Processor Instruction Template

When delegating to content_processor, use this instruction format:

```
Workspace: {workspace_id}

Task: Generate {number_of_ideas} creative blog article angle ideas

Source Material:
- {source_filepath OR source_url}

Target Audience: {target_audience if provided}
Content Goals: {content_goals if provided}

Output Requirements:
1. Generate {number_of_ideas} distinct blog article angles
2. For each angle provide:
   - Compelling title
   - Detailed description (2-3 paragraphs)
   - Target audience profile
   - Key talking points (3-5 bullets)
   - Suggested content format (how-to, listicle, case study, etc.)
   - SEO keyword opportunities
   - Estimated word count range

3. Structure output as markdown with clear sections
4. Save output to: {output_filepath}

Format the output as a well-structured markdown document with:
- Document title
- Introduction explaining the source material
- Numbered angle ideas with subsections
- Conclusion with next steps
```

## Quality Checklist

- ✅ Source material properly analyzed (file exists or URL accessible)
- ✅ Output contains requested number of angle ideas
- ✅ Each angle has complete information (title, description, audience, etc.)
- ✅ Angles are diverse and cover different approaches
- ✅ Markdown formatting is clean and readable
- ✅ Output saved to appropriate workspace location
- ✅ File reference provided to user

## Error Handling

- **Missing source**: If neither filepath nor URL provided, request clarification
- **File not found**: If source_filepath doesn't exist, inform user and suggest alternatives
- **Invalid URL**: If source_url is malformed, request correction
- **Sub-agent failure**: Capture error, simplify instructions, retry with adjusted parameters
- **Missing output file**: If file not created after sub-agent completion, surface issue and retry
- **Both sources provided**: If both filepath and URL given, ask user which to prioritize

## Example Usage Scenarios

### Scenario 1: Product Documentation
```yaml
workspace_id: coverme
source_filepath: knowledge/casco/product-info.md
output_filepath: knowledge/casco/blog-angle-ideas.md
target_audience: car owners aged 25-45
content_goals: awareness, education
number_of_ideas: 10
```

### Scenario 2: Competitor Website Analysis
```yaml
workspace_id: coverme
source_url: https://competitor.com/insurance-guide
output_filepath: campaigns/q1-2025/knowledge/competitor-angle-ideas.md
content_goals: differentiation, conversion
number_of_ideas: 8
```

### Scenario 3: Campaign Knowledge Base
```yaml
workspace_id: coverme
source_filepath: campaigns/summer-travel/knowledge/travel-insurance-overview.md
# output_filepath auto-determined: campaigns/summer-travel/knowledge/blog-angle-ideas.md
target_audience: young travelers, families
content_goals: engagement, conversion
```

## Related References

- Blog authoring capability: `capabilities/generate-blog-post.md`
- Content processor sub-agent documentation
- Digital content marketing strategy: `/policies/digital-marketing-plan.md`
- Blog authoring guides: `/policies/blog-*-authoring-guide.md`

## Next Steps After Idea Generation

1. **Review and Select**: User reviews generated angles and selects preferred approach
2. **Refine Angle**: Optionally run capability again with more specific parameters
3. **Create Blog Post**: Use `generate_blog_post` capability with selected angle
4. **Campaign Integration**: Incorporate angle into campaign content calendar
