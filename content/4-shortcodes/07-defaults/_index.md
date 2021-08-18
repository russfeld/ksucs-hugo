---
title: "Default Shortcodes"
pre: "7. "
weight: 90
date: 2018-08-24T10:53:26-05:00
---

## Buttons

{{% button href="https://getgrav.org/" %}}Get Grav{{% /button %}}
{{% button href="https://getgrav.org/" icon="fas fa-download" %}}Get Grav with icon{{% /button %}}
{{% button href="https://getgrav.org/" icon="fas fa-download" icon-position="right" %}}Get Grav with icon right{{% /button %}}

## Expand

{{%expand "Click to expand..." %}}

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

{{% /expand%}}

## Tabs

{{< tabs >}}
{{% tab name="python" %}}
```python
print("Hello World!")
```
{{% /tab %}}
{{% tab name="R" %}}
```R
> print("Hello World!")
```
{{% /tab %}}
{{% tab name="Bash" %}}
```Bash
echo "Hello World!"
```
{{% /tab %}}
{{< /tabs >}}

## Attachments

{{% attachments %}}