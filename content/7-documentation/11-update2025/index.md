---
title: "Update 2025"
pre: "11. "
weight: 110
---

In Summer 2025 this theme was updated to match version 8.0.0 of the base [Hugo Relearn Theme](https://github.com/McShelby/hugo-theme-relearn/releases/tag/8.0.0)

## Updated Hugo Version

The new version of the theme was tested on [Hugo v0.148.1](https://github.com/gohugoio/hugo/releases) or later. I recommend updating your Hugo installation (either locally or by updating the `devcontainer` configuration and rebuilding).

## New Features

A full list of changes to the theme can be found on the [What's New](https://mcshelby.github.io/hugo-theme-relearn/introduction/releasenotes/index.html) page and in the [Changelog](https://mcshelby.github.io/hugo-theme-relearn/introduction/changelog/index.html).

Some notable feature updates:

* [Many new Markdown features](https://mcshelby.github.io/hugo-theme-relearn/authoring/markdown/index.html)
* [Link Effects](https://mcshelby.github.io/hugo-theme-relearn/authoring/linking/linkeffects/index.html)
* [Tree Shortcode](https://mcshelby.github.io/hugo-theme-relearn/shortcodes/tree/index.html)

## Update the Theme

1. Install [Hugo v0.148.1](https://github.com/gohugoio/hugo/releases) or later.
  * If the repository includes a devcontainer, update the image in `.devcontainer/devcontainer.json`. After updating, you'll need to rebuild the devcontainer to get the new version of Hugo.
  * If the repostiroy includes a GitHub Pages action, update the version in `.github/workflows/gh-pages.yml`
2. Confirm the Hugo version in the terminal: `hugo version`
3. In the repository folder, update the Hugo module for the theme: `hugo mod get -u`
4. Update `hugo.toml` using this [sample file](https://github.com/ksu-cs-textbooks/hugo-theme-relearn/blob/main/hugo.toml.sample) as a template.
    1. Look for items labelled `# TODO changeme` to see what settings should be updated for each site. Many settings can be carried over from the existing `config.toml` but some settings are new. [Configuration Documentation](https://mcshelby.github.io/hugo-theme-relearn/basics/configuration/index.html).
5. Render the site and check for any errors: `hugo serve`
6. If everything looks good, commit and push.
7. After a few minutes, check the deployed version and make sure it has updated. Clear the cache (<kbd>CTRL</kbd> + <kbd>F5</kbd>) and look for version 8.0.0 in the footer. 