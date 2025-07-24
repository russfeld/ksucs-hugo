+++
categories = ['reference']
title = 'Built-In Shortcodes'
type = 'chapter'
weight = 29

[params]
  menuPre = "<b>4A. </b>"
  ordersectionsby = 'title'
+++

Hugo uses Markdown as its content format. However, there are a lot of things that Markdown doesn't support well.

You could use pure HTML to expand your possibilities. But this happens to be a bad idea. Everyone uses Markdown because it's pure and simple to read. You should avoid HTML to keep it as simple and portable as possible.

To avoid Markdown's limitations, Hugo created [shortcodes](https://gohugo.io/content-management/shortcodes/). A shortcode is a simple snippet inside of a page.

The Relearn theme provides many shortcodes on top of [Hugo's existing ones](https://gohugo.io/content-management/shortcodes/#embedded-shortcodes).

{{% children containerstyle="div" style="h2" description=true %}}
