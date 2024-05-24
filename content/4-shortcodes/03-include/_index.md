---
title: "Include"
pre: "3. "
weight: 50
description: "Updates to the Include shortcode"
---

A shortcode was created to enable the inclusion of other markdown files. This allows us to create modular websites that reuse pieces of content, such as standardized syllabus statements.

There are two forms of the include shortcode - one to include files relative to the project root, and one to include files relative to the current file. 

{{% notice note %}}

This should also now work with shortcodes! See [this GitHub Issue](https://github.com/gohugoio/hugo/issues/6703) for more information. The `.markdownify` function was substituted for `safeHTML` in the `include` shortcode.

{{% /notice %}}

### Include Local

This will include a file relative to the current page's file path.

```
{{</* include-local "includes/01-include.md" */>}}
```

renders as

{{< include-local "includes/01-include.md" >}}

### Include

This will include a file with the filepath relative to the project root. This takes advantage of Hugo's [Union File System](https://gohugo.io/getting-started/directory-structure/#union-file-system) so that directories from the theme module are also accessible at paths relative to the project root.

```
{{</* include "data/syllabus/netiquette.md" */>}}
```

renders as

{{< include "data/syllabus/netiquette.md" >}}