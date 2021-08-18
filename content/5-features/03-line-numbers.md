---
title: "Line Numbers"
pre: "3. "
weight: 100
date: 2021-08-10T01:53:26-05:00
linenumbers: true
---

Line numbering is supported by [highlight.js-line-numbers](https://github.com/wcoder/highlightjs-line-numbers.js/). 

It can be enabled using `linenumbers: true` setting either in the page frontmatter, or sitewide in `config.toml` in the `[params]` list.

```java
public class Java {

    public static void main(String[] args) {
        System.out.println("This is a test.");
    }
    
}
```