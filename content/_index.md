+++
title = "Homepage"
date = 2018-08-24T10:53:05-05:00
+++

# K-State CS Hugo Theme

This is an adaptation of [Hugo Theme Learn](https://learn.netlify.com/en/) that has been customized for use by K-State Computer Science to build online textbooks. It contains some featuers that are unique to our use case, but they may be useful to others.

More information can be found on [GitHub](https://www.github.com/russfeld/ksucs-hugo-theme)

Some unique features to this theme:
* Fonts and layouts customized to match K-State's websites and color scheme, as well as [Instructure Canvas](https://canvas.instructure.com/).
* Each page generates an embeddable version that strips menus, headers and footers (add /embed.html to almost any URL). This is meant to be embedded in an iFrame within another page, such as an HTML wiki page in Canvas. 
  * By doing so, we can embed course content in Canvas while editing it via Hugo, taking advantage of tools such as git for versioning. In addition, by updating the source website, all versions of the course in Canvas are updated immediately. 
* Each page also generates a teleprompter version to allow creation of course videos (add /tele.html to almost any URL). Many pages are used as a video script for multi-modal learning. 
  * The teleprompter pages include auto-scroll capabilities. It is compatible with an [IKAN Teleprompter Remote](https://ikancorp.com/shop/teleprompters/tablet-teleprompters-accessories/ikan-elite-remote-bluetooth-teleprompter-remote-for-pt-elite-prompters/), but can be controlled using the number keys or easily customized. See /static/js/tele-scroll.js for details.
