---
title: "Links"
pre: "4. "
weight: 60
description: "(DEPRECATED) Link Helper Shortcode"
---

The `link` shortcode from the previous template has been deprecated. Instead, this template will now render links in two ways:

1. If the link `href` contains `http`, then it assumes it is an external link and will open in a new tab.
1. Otherwise, the link will be assumed to be local and will open in the same tab.

See the `externalLinkTarget` configuration item. [Documentation](https://mcshelby.github.io/hugo-theme-relearn/basics/configuration/index.html)