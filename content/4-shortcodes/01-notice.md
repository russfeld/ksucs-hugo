---
title: "Notice"
pre: "1. "
weight: 30
description: "Updates to the Notice shortcode"
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

That item will not render on the [embed]({{% ref "4-shortcodes/01-notice" "embed" %}}) version of this page.
