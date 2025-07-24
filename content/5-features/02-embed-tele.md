---
title: "Embed & Teleprompter"
pre: "2. "
weight: 90
---

This site also creates two additional outputs of each page, also accessible from the upper toolbar:

* <i class="fas fa-tv"></i> -  Teleprompter View (add `tele.html` to the URL)
* <i class="fas fa-expand-arrows-alt"></i> - Embedded View (add `embed.html` to the URL)

## Teleprompter View

The teleprompter view is intended to be used on a mirrored teleprompter. It uses some customized CSS in `custom.css`.

It also includes JavaScript code to handle automatically scrolling the page by clicking the mouse, and mirroring/unmirroring the output using the `m` button. Other buttons are programmed to match an IKAN bluetooth remote. See `tele-scroll.js` for details.

It also uses an override for the Hugo YouTube shortcode to hide any embedded YouTube videos. See `/layouts/shortcodes/youtube.tele.html`. 

## Embedded View

The embedded view renders the page without any additional navigation elements. This view is meant to be embedded in an `<iframe>` directly in another site, such as an LMS. It also removes any `noiframe` notices. See `custom.css` for details.

## Test YouTube Embed

{{< youtube dQw4w9WgXcQ >}}