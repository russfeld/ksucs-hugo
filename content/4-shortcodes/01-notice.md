---
title: "Notice"
pre: "1. "
weight: 30
---

The notice shortcode has been modified to make the following changes:
* The colors for the `note` and `info` styles have been swapped to match the earlier template
* A special `noiframe` type has been added, see below.

### No Iframe

```
{{%/* notice noiframe */%}}
A disclaimer that will not be visible on the embedded version of the page
{{%/* /notice */%}}
```

renders as

{{% notice noiframe %}}
A disclaimer that will not be visible on the embedded version of the page
{{% /notice %}}

<!-- # TODO Fix Embed Link -->

That item will not render on the embed ./embed.html version of this page.
