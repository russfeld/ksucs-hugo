---
title: "Chapter 0 Notices"
pre: "3."
weight: 30
date: 2021-08-10T01:53:26-05:00
---

## Notice

The old mechanism for notices overriding the block quote syntax (`>>>`) has been deprecated.  Notices are now handled via a dedicated plugin called [Markdown Notices](https://github.com/getgrav/grav-plugin-markdown-notices). However, the old syntax works with this template and is used in a number of places, so it remains in this documentation.

The notice shortcode shows 4 types of disclaimers to help you structure your page.

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
An warning disclaimer
{{%/* /notice */%}}
```

renders as

{{% notice warning %}}
A warning disclaimer
{{% /notice %}}

## Notes with More Formatting

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


{{% notice note %}}

# Header 1

text

{{% /notice %}}

{{% notice note %}}

## Header 2

text

{{% /notice %}}

{{% notice note %}}

### Header 3

text

{{% /notice %}}

{{% notice note %}}

#### Header 4

text

{{% /notice %}}

{{% notice note %}}

##### Header 5

text

{{% /notice %}}

{{% notice note %}}

###### Header 6

text

{{% /notice %}}
