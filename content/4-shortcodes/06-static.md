---
title: "Static"
pre: "6. "
weight: 80
---

The `static` shortcode has been deprecated. All static content should be stored in the `static` folder outside of `content`, and with the `canonifyURLs` option set to `true` in the site config, they can be referenced directly at the root of the site.

For example, the file at `/static/images/core-logo-on-white.svg` can be referenced using:

```
![Core Logo](/images/core-logo-on-white.svg)
```

![Core Logo](/images/core-logo-on-white.svg)