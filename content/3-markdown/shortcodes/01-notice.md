---
title: "Notices"
pre: "3.1 "
weight: 30
date: 2018-08-24T10:53:26-05:00
---

The CSS for the [notice](https://learn.netlify.app/en/shortcodes/notice/) shortcode has been modified, as well as the shortcode itself.

### Note

```
{{%/* notice note */%}}
A notice disclaimer
{{%/* /notice */%}}
```

renders as

{{% notice note %}}
A notice disclaimer
{{% /notice %}}

### Info

```
{{%/* notice info */%}}
An information disclaimer
{{%/* /notice */%}}
```

renders as

{{% notice info %}}
An information disclaimer
{{% /notice %}}

### Tip

```
{{%/* notice tip */%}}
A tip disclaimer
{{%/* /notice */%}}
```

renders as

{{% notice tip %}}
A tip disclaimer
{{% /notice %}}

### Warning

```
{{%/* notice warning */%}}
A warning disclaimer
{{%/* /notice */%}}
```

renders as

{{% notice warning %}}
A warning disclaimer
{{% /notice %}}

#### No Iframe

```
{{%/* notice noiframe */%}}
A disclaimer that will not be visible on the embedded version of the page
{{%/* /notice */%}}
```

renders as

{{% notice noiframe %}}
A disclaimer that will not be visible on the embedded version of the page
{{% /notice %}}

That item will not render on the [embed](./embed.html) version of this page.