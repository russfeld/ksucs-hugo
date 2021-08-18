---
title: "No Render"
pre: "5. "
weight: 70
date: 2021-08-10T01:53:26-05:00
---

The norender shortcode simply disables any additional HTML rendering. It is probably unnecessary at this point but included for backwards compatibility.

<pre>
{{</* norender */>}}

### Example File to be Encrypted

**Password:** testpassword

### Sample Text

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet placerat risus. In hac habitasse platea dictumst. Etiam risus massa, finibus vitae felis non, hendrerit auctor nibh. Morbi ut odio posuere, pharetra metus vitae, venenatis turpis. Nullam interdum imperdiet orci, ut ultrices magna. Donec a odio eu tellus commodo venenatis a nec dolor. Nam dictum auctor enim ut consequat. Phasellus sit amet sapien ipsum. Aenean scelerisque mi orci, ut aliquam eros volutpat id. Proin interdum convallis nunc, vel mollis leo pellentesque interdum.

Donec mollis egestas lacus vitae suscipit. Vestibulum in varius massa. Nam quis velit ut dolor pellentesque molestie vel non massa. Morbi hendrerit consequat mollis. Cras ligula massa, mollis eu urna non, eleifend scelerisque nulla. Mauris vel magna aliquam arcu lobortis sollicitudin in aliquam tortor. Curabitur nec sapien felis. Etiam quis mattis mi. Phasellus leo tortor, rhoncus at viverra at, porta viverra turpis. Ut elementum tortor sit amet ex volutpat pellentesque. Integer posuere enim tortor, eget finibus dolor sodales eleifend. Phasellus at rutrum sapien, in faucibus enim. Praesent vel convallis orci.

**Bold**

_Italics_

`some code`

```
a longer code block
```

{{</* /norender */>}}
</pre>

renders as 

{{< norender >}}

### Example File to be Encrypted

**Password:** testpassword

### Sample Text

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sit amet placerat risus. In hac habitasse platea dictumst. Etiam risus massa, finibus vitae felis non, hendrerit auctor nibh. Morbi ut odio posuere, pharetra metus vitae, venenatis turpis. Nullam interdum imperdiet orci, ut ultrices magna. Donec a odio eu tellus commodo venenatis a nec dolor. Nam dictum auctor enim ut consequat. Phasellus sit amet sapien ipsum. Aenean scelerisque mi orci, ut aliquam eros volutpat id. Proin interdum convallis nunc, vel mollis leo pellentesque interdum.

Donec mollis egestas lacus vitae suscipit. Vestibulum in varius massa. Nam quis velit ut dolor pellentesque molestie vel non massa. Morbi hendrerit consequat mollis. Cras ligula massa, mollis eu urna non, eleifend scelerisque nulla. Mauris vel magna aliquam arcu lobortis sollicitudin in aliquam tortor. Curabitur nec sapien felis. Etiam quis mattis mi. Phasellus leo tortor, rhoncus at viverra at, porta viverra turpis. Ut elementum tortor sit amet ex volutpat pellentesque. Integer posuere enim tortor, eget finibus dolor sodales eleifend. Phasellus at rutrum sapien, in faucibus enim. Praesent vel convallis orci.

**Bold**

_Italics_

`some code`

```
a longer code block
```

{{< /norender >}}