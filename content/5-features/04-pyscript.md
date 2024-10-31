---
title: "PyScript"
pre: "4. "
weight: 150
linenumbers: true
---

This theme now contains the [PyScript](https://pyscript.net/) libraries. This is a work in progress.

Example:

```plaintext
{{</* pyscript */>}}
print("Hello World")
name = input("What is your name? ")
print(f"Hello {name}!")
{{</* /pyscript */>}}
````

Renders as follows below

{{< pyscript >}}
print("Hello World")
name = input("What is your name? ")
print(f"Hello {name}!")
{{< /pyscript >}}