+++
archetype = "chapter"
ordinal = "8"
title = "Theme Shortcodes"
weight = 90
pre = "8. "
+++

{{% notice note %}}

These pages are taken directly from the example site for the [Hugo Relearn Theme](https://mcshelby.github.io/hugo-theme-relearn/shortcodes/). They are included here to test those shortcodes under this theme's CSS.

{{% /notice %}}

Hugo uses Markdown for its simple content format. However, there are a lot of things that Markdown doesn’t support well. You could use pure HTML to expand possibilities.

But this happens to be a bad idea. Everyone uses Markdown because it's pure and simple to read even non-rendered. You should avoid HTML to keep it as simple as possible.

To avoid this limitations, Hugo created [shortcodes](https://gohugo.io/extras/shortcodes/). A shortcode is a simple snippet inside a page.

The Relearn theme provides multiple shortcodes on top of existing ones.

{{%children containerstyle="div" style="h2" description="true" %}}
