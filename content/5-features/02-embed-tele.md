---
title: "Embed & Teleprompter"
pre: "2. "
weight: 90
date: 2021-08-10T01:53:26-05:00
---

This site also creates two additional outputs of each page, also accessible from the upper toolbar:

* <i class="fas fa-tv"></i> -  Teleprompter View (add `tele.html` to the URL)
* <i class="fas fa-expand-arrows-alt"></i> - Embedded View (add `embed.html` to the URL)

## Teleprompter View

The teleprompter view is intended to be used on a mirrored teleprompter. It uses some customized CSS in `theme-tele.css`.

It also includes JavaScript code to handle automatically scrolling the page by clicking the mouse, and mirroring/unmirroring the output using the `m` button. Other buttons are programmed to match an IKAN bluetooth remote. See `tele-scroll.js` for details.

It also uses some quick JavaScript to remove any `<iframe>` elements, mainly targeted at removing YouTube embeds. See `hideyt.js` for details.

## Embedded View

The embedded view renders the page without any additional navigation elements. This view is meant to be embedded in an `<iframe>` directly in another site, such as an LMS. It also removes any `noiframe` notices. See `theme-iframe.css` for details.