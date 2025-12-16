# Quick Reference

Fast lookup for common patterns, formats, and decisions.

---

## Platform-to-Format Mapping

| Platform | Formats | Best For |
|----------|---------|----------|
| **facebook** | fb-text-post | General updates, engagement |
| | fb-link-post | Article promotion, traffic |
| | fb-short-video | Awareness, viral content |
| **instagram** | ig-reel | Viral reach, trending content |
| | ig-carousel | Educational, multi-point stories |
| | ig-story | Ephemeral, interactive content |
| | ig-image-post | Brand awareness, lifestyle |
| **google** | g-search | High-intent conversions |
| | g-display | Brand awareness, retargeting |
| | g-pmax | Multi-channel optimization |
| | g-discovery | Native feed awareness |
| **linkedin** | li-post | Engagement, thought leadership |
| | li-article | Long-form expertise, SEO |

---

## Metadata Format Template

```markdown
## Post Metadata

**Platform**: [platform]
**Format**: [format]
**Topic**: [topic-slug]
**Context**: [context-slug]  # Optional
**Revision**: [n]
**Target Audience**: [audience-description]
**Objective**: [objective]
**CTA URL**: [url]  # Optional
**Hashtags**: #Tag1, #Tag2, #Tag3  # Optional
**Associated Media**: filename.png  # Optional
**Created**: YYYY-MM-DD
**Updated**: YYYY-MM-DD  # Optional
**Status**: draft|review|approved|published
```

**Required Fields:** Platform, Format, Topic, Revision, Target Audience, Objective, Created, Status

**Optional Fields:** Context, CTA URL, Hashtags, Associated Media, Updated

---

## File Naming Patterns

| Pattern | Example | When to Use |
|---------|---------|-------------|
| `text_[topic]_rev[n].md` | `text_travel-insurance_rev1.md` | No context needed |
| `text_[topic]_[context]_rev[n].md` | `text_travel-insurance_erste-cc_rev1.md` | Specific angle/partnership |
| `text_[topic]_[context]_rev[n].md` | `text_home-safety_winter-prep_rev2.md` | Seasonal variation + revision |

**Rules:**
- Use hyphens for multi-word slugs
- Topic required, context optional
- Revision starts at 1
- No spaces, special chars

---

## Path Construction

**Formula:**
```
campaigns/[campaign]/content-assets/social/[platform]/[format]/text_[topic]_[context]_rev[n].md
```

**Examples:**

| Campaign | Platform | Format | Topic | Context | Result |
|----------|----------|--------|-------|---------|--------|
| summer-travel | facebook | fb-link-post | travel-insurance | — | `campaigns/summer-travel/content-assets/social/facebook/fb-link-post/text_travel-insurance_rev1.md` |
| home-insurance | instagram | ig-reel | home-emergency | erste-cc | `campaigns/home-insurance/content-assets/social/instagram/ig-reel/text_home-emergency_erste-cc_rev1.md` |
| accident-insurance | google | g-search | accident-coverage | — | `campaigns/accident-insurance/content-assets/social/google/g-search/text_accident-coverage_rev1.md` |
| financial-services | linkedin | li-article | risk-management | — | `campaigns/financial-services/content-assets/social/linkedin/li-article/text_risk-management_rev1.md` |

---

## Objective Types

| Objective | Use When | Best Platforms | Best Formats |
|-----------|----------|----------------|--------------|
| **awareness** | Building brand recognition | Instagram, Google Display, LinkedIn | ig-reel, g-display, li-article |
| **engagement** | Encouraging interaction | Facebook, Instagram, LinkedIn | fb-text-post, ig-carousel, li-post |
| **conversion** | Driving sales/signups | Google, Facebook | g-search, g-pmax, fb-link-post |
| **traffic** | Driving website visits | Facebook, LinkedIn, Google | fb-link-post, li-post, g-discovery |
| **thought-leadership** | Establishing expertise | LinkedIn | li-article, li-post |

---

## Common Parameter Combinations

### High-Engagement Social Post
```
platform: facebook
format: fb-text-post
objective: engagement
hashtags: 3-5 relevant
cta: soft (comment/share prompt)
```

### Traffic-Driving Content
```
platform: facebook
format: fb-link-post
objective: traffic
cta_url: required
hashtags: optional
```

### Viral Video Content
```
platform: instagram
format: ig-reel
objective: awareness
hashtags: 8-12 mix of trending/niche
cta: "link in bio" or "DM us"
```

### High-Intent Conversion Ad
```
platform: google
format: g-search
objective: conversion
cta_url: landing page (required)
hashtags: n/a
```

### Professional Thought Leadership
```
platform: linkedin
format: li-article
objective: thought-leadership
audience: professionals, decision-makers
cta: soft (engagement/newsletter)
```

---

## Format Decision Tree

**Need video content?**
→ YES → Instagram Reel or Facebook Short Video
→ NO → Continue

**Need multiple points/tips?**
→ YES → Instagram Carousel
→ NO → Continue

**Need high-intent conversions?**
→ YES → Google Search or Performance Max
→ NO → Continue

**B2B or professional audience?**
→ YES → LinkedIn (Post or Article)
→ NO → Continue

**Driving traffic to article/blog?**
→ YES → Facebook Link Post
→ NO → Continue

**General engagement/update?**
→ Facebook Text Post or Instagram Image Post

---

## Character Limits Reference

| Platform | Element | Limit |
|----------|---------|-------|
| **Facebook** | Text post | 63,206 chars (optimal: 40-80 words) |
| | Link post caption | No limit (optimal: 2-3 paragraphs) |
| **Instagram** | Caption | 2,200 chars (optimal: 125-150 words) |
| | Reel caption | 2,200 chars (first line critical) |
| | Story text | No limit (visual readability matters) |
| | Hashtags | 30 max (optimal: 8-12) |
| **Google Search** | Headlines | 30 chars each |
| | Descriptions | 90 chars each |
| **Google Display** | Short headlines | 30 chars |
| | Long headline | 90 chars |
| **LinkedIn** | Post | 3,000 chars (optimal: 150-300 words) |
| | Article | 125,000 chars (optimal: 800-2000 words) |
| | Hashtags | 3-5 recommended |

---

## Hashtag Strategy

| Platform | Count | Strategy |
|----------|-------|----------|
| **Facebook** | 3-5 | Branded + 2-3 relevant niche tags |
| **Instagram** | 8-12 | Mix: 30% trending, 50% niche (10k-500k), 20% branded |
| **LinkedIn** | 3-5 | Industry-specific, professional tags only |
| **Google** | N/A | Not applicable |

---

## Source Material Handling

| Source Type | Parameter | Example | Agent Action |
|-------------|-----------|---------|--------------|
| Workspace file | `source_filepaths` | `["campaigns/x/knowledge/info.md"]` | Read file, extract key points, incorporate |
| External URL | `source_urls` | `["https://example.com/article"]` | Crawl URL, extract content, integrate |
| Multiple sources | Both params | Files + URLs | Read all, synthesize, cite sources |
| No sources | Omit params | — | Use policies and strategies only |

---

## Revision Workflow

| Scenario | Action | Filename |
|----------|--------|----------|
| First version | Create rev1 | `text_topic_rev1.md` |
| Minor edits | Create rev2 | `text_topic_rev2.md` |
| Major rewrite | Create rev2+ | `text_topic_rev3.md` |
| Different angle | Use context | `text_topic_newcontext_rev1.md` |
| Seasonal update | Use context | `text_topic_spring_rev1.md` |

**Note:** Previous revisions are preserved, not overwritten.

---

## Status Progression

```
draft → review → approved → published
```

| Status | Meaning | Actions Available |
|--------|---------|-------------------|
| **draft** | Initial creation | Edit, review, delete |
| **review** | Under review | Approve, request changes, reject |
| **approved** | Ready to publish | Schedule, publish, revert to draft |
| **published** | Live content | Archive, track performance |

---

## Platform-Specific CTAs

| Platform | CTA Type | Example |
|----------|----------|---------|
| **Facebook** | Direct | "Get a free quote: [link]" |
| | Engagement | "Tag someone who needs this!" |
| **Instagram** | Bio link | "Link in bio 👆" |
| | DM | "DM us 'QUOTE' for details" |
| | Engagement | "Save this for later!" |
| **Google** | Button | "Get Quote" / "Learn More" / "Sign Up" |
| **LinkedIn** | Soft | "What's your experience? Comment below." |
| | Direct | "Download our guide: [link]" |

---

## Validation Quick Checks

Before finalizing content, verify:

**Metadata:**
- [ ] Platform and format valid
- [ ] Topic slug uses hyphens
- [ ] Revision number specified
- [ ] Target audience defined
- [ ] Objective selected
- [ ] Created date present
- [ ] Status set

**Content:**
- [ ] Hook/first line engaging
- [ ] CTA present and clear
- [ ] Tone matches platform
- [ ] Length appropriate
- [ ] Hashtags optimized (if applicable)

**Technical:**
- [ ] Metadata header format correct (NOT YAML)
- [ ] Markdown formatting valid
- [ ] Filename follows pattern
- [ ] Path structure correct

---

## Error Resolution

| Error | Cause | Solution |
|-------|-------|----------|
| Campaign not found | Invalid campaign name | List available campaigns, verify spelling |
| Invalid format | Unsupported format for platform | Show supported formats for platform |
| File exists | Duplicate filename | Offer revision increment, context variation |
| Source file missing | Invalid file path | Verify path, list available files |
| Invalid URL | Malformed URL | Validate URL format, check accessibility |
| Metadata incomplete | Missing required field | Identify missing fields, request values |

---

## Next Step Suggestions

| After Creating | Suggest |
|----------------|---------|
| fb-text-post | Schedule post, create image |
| fb-link-post | Generate thumbnail, schedule |
| ig-reel | Create video, design thumbnail |
| ig-carousel | Generate slides (N images), schedule |
| ig-story | Design story frames, add stickers |
| ig-image-post | Generate image, schedule |
| g-search | Upload to Google Ads, configure keywords |
| g-display | Generate image assets, configure targeting |
| li-post | Schedule, boost post |
| li-article | Add header image, publish, promote |
