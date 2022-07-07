---
title: "Include"
pre: "3. "
weight: 50
date: 2018-08-24T10:53:26-05:00
---

A shortcode was created to enable the inclusion of other markdown files. This allows us to create modular websites that reuse pieces of content, such as standardized syllabus statements.

There are two forms of the include shortcode - one to include files relative to the project root, and one to include files relative to the current file. 

{{% notice note %}}

Shortcodes do not work at this time. See [this issue](https://github.com/gohugoio/hugo/issues/6703) on GitHub for details. Since these local files are rendered in the output with the shortcodes, it may be possible to use `<iframe>` to include these rendered outputs instead of the source markdown. 

{{% /notice %}}

### Include Local

```
{{</* include "includes/01-include.md" */>}}
```

renders as

{{< include "content/4-shortcodes/03-include/includes/01-include.md" >}}

### Include

```
{{</* include "themes/hugo-theme-relearn/static/files/syllabus-statements.md" */>}}
```

renders as

{{< include "themes/hugo-theme-relearn/static/files/syllabus-statements.md" >}}