---
title: "Notices"
pre: "1. "
weight: 30
date: 2018-08-24T10:53:26-05:00
---

The CSS for the [notice](https://learn.netlify.app/en/shortcodes/notice/) shortcode has been modified, as well as the shortcode itself. The CSS has been updated to allow for full use of markdown within the notice (something that was not possible in the original). This is probably the single most modified part of this theme.

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

That item will not render on the [embed](./embed.html) version of this page.

### Custom Title

The title on a notice can be customized in the third parameter. The second parameter sets the HTML `id` of the element - it is maintained for compatibility with the overall theme.

```
{{%/* notice note note-1 "Custom Title" */%}}
A notice disclaimer
{{%/* /notice */%}}
```

renders as

{{% notice note note-1 "Custom Title" %}}
A notice disclaimer
{{% /notice %}}

#### Full Markdown Support

<pre>
{{%/* notice note */%}}

# A Header 1

A first paragraph

A second paragraph

* Bullet 1
* Bullet 2
* Bullet 3

1. Number 1
2. Number 2
3. Number 3

> Blockquote 1  
> Blockquote 2  
> Blockquote 3  

![Minion](https://octodex.github.com/images/minion.png)

```java
public class Java {

    public static void main(String[] args) {
        System.out.println("This is a test.");
    }
}
```

{{%/* /notice */%}}

</pre>

renders as

{{% notice note %}}

# A Header 1

A first paragraph

A second paragraph

* Bullet 1
* Bullet 2
* Bullet 3

1. Number 1
2. Number 2
3. Number 3

> Blockquote 1  
> Blockquote 2  
> Blockquote 3  

![Minion](https://octodex.github.com/images/minion.png)

```java
public class Java {

    public static void main(String[] args) {
        System.out.println("This is a test.");
    }
}
```

{{% /notice %}}
