---
title: "Include"
pre: "3. "
weight: 50
---

A shortcode was created to enable the inclusion of other markdown files. This allows us to create modular websites that reuse pieces of content, such as standardized syllabus statements.

There are two forms of the include shortcode - one to include files relative to the project root, and one to include files relative to the current file. 

{{% notice note %}}

This should also now work with shortcodes! See [this GitHub Issue](https://github.com/gohugoio/hugo/issues/6703) for more information. The `.markdownify` function was substituted for `safeHTML` in the `include` shortcode.

{{% /notice %}}

### Include Local

This will include a file relative to the current page's file path.

```
{{</* include "includes/01-include.md" */>}}
```

renders as

{{< include-local "includes/01-include.md" >}}

### Include

This will include a file with the filepath relative to the project root.

```
{{</* include "themes/hugo-theme-relearn/static/files/syllabus-statements.md" */>}}
```

renders as

{{< include "themes/hugo-theme-relearn/static/files/syllabus/netiquette.md" >}}