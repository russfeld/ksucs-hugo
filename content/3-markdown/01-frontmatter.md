---
title: "Frontmatter"
pre: "1. "
weight: 10
---

{{% notice note %}}

This content details additions to the the original version in the [Hugo Relearn Theme Documentation](https://mcshelby.github.io/hugo-theme-relearn/cont/pages/#frontmatter-configuration).

{{% /notice %}}

## Front Matter configuration

Instead of using `LastModifierDisplayName` and `LastModifierEmail`, this site is instead configured to use [Hugo Git Info Variables](https://gohugo.io/variables/git/) to pull that content from the git repository storing this website. 

This template adds one new Frontmatter option:

* **ordinal**: this is used by the new [chapter](https://mcshelby.github.io/hugo-theme-relearn/cont/archetypes/) archetype to override the weight as the chapter's index.

There are many other items that can be added. See [Hugo Frontmatter](https://gohugo.io/content-management/front-matter/) for details. The [Hugo Theme Relearn](https://mcshelby.github.io/hugo-theme-relearn/cont/frontmatter/index.html) documentation also has an exhaustive list of frontmatter options for the base theme.

### Reveal.js Slides

For Reveal.js slides, the frontmatter is as follows:

```yaml
---
type: "reveal"
hidden: true
---
```

These items are used:

* **type**: this tells Hugo to render this page as a Reveal.js page, which will use a different template
* **hidden**: this will remove this item from the menu on the left. This can be added to any page.

{{% notice note %}}

Yes, I realize that most pages are using the YAML format for frontmatter (as indicated by the `---` surrounding the block as described in the Hugo documentation), but the chapter pages are using TOML (surrounded by `+++` instead). I did this simply because the template pages were set that way, but not for any particular reason.

{{% /notice %}}