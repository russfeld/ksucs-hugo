---
title: "Link"
pre: "4. "
weight: 60
date: 2021-08-10T01:53:26-05:00
---

The link shortcode simply creates a link with the `target="_blank"` HTML attribute. Notice it uses angle brackets instead of percent in the shortcode tag. This prevents additional processing of the URL.

### Simple

```
{{</* link "https://gohugo.io/" */>}}
```

renders as



### Override Title

```
{{</* link "https://gohugo.io/" "Hugo Homepage" */>}}
```

renders as



{{% notice note %}}

Of course, it is possible to just use raw HTML here:

```html
<a href="https://gohugo.io/" target="_blank">Hugo Homepage</a>
```

will render as 

<a href="https://gohugo.io/" target="_blank">Hugo Homepage</a>

{{% /notice %}}