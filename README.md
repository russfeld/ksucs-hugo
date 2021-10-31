# K-State CS Hugo Framework

[![Docker Image CI](https://github.com/russfeld/ksucs-hugo/actions/workflows/docker-image.yml/badge.svg)](https://github.com/russfeld/ksucs-hugo/actions/workflows/docker-image.yml) 

This is a [Hugo](https://gohugo.io/)-based web framework for K-State CS lecture content. It uses a lightly adapted version of the [Hugo-theme-learn](https://learn.netlify.com/en/) theme called [ksucs-hugo-theme](https://github.com/russfeld/ksucs-hugo-theme)

Major added features are the addition of [Reveal.js](https://github.com/hakimel/reveal.js/) slideshow framework, and the creation of an embeddable version of content pages for use with IFrames in [Canvas](https://www.instructure.com/) and other learning management systems.

**[Demo](https://ksucs-hugo.russfeld.me)**

#### Relevant Documentation

* [Hugo Documentation](https://gohugo.io/documentation/)
* [Hugo-theme-learn Documentation](https://learn.netlify.com/en/)
* [Reveal.js Documentation](https://github.com/hakimel/reveal.js/)

## Installation

Install Hugo > 0.80 on your system. I recommend using Linux or Windows Subsystem for Linux.

Clone this repository and edit your content. After cloning, run `git submodule init` followed by `git pull --recurse-submodules` to load the theme.

To view the content locally, use the `hugo server` command and visit http://localhost:1313 to view a local version of your site

To deploy the content, use the `hugo` command on the destination server to generate a `public` folder. Then, point your web server of choice to that folder.

## Adding Content

To change the content on the homepage, edit `content/_index.md`.

To understand how the rest of the content is structured, review the existing files and folders in the `content` folder. Each subfolder contains a chapter, with the chapter index stored in a `_index.html` file in that subfolder. Pay special attention to the frontmatter on that file. The `title` and `pre` items determine what is shown in the left-hand menu, and the `weight` field is used for sorting. Finally, `chapter` denotes that this is a chapter file, and should use a different layout.

All other files in each subfolder are pages. The important item in the frontmatter is the `title`. Pages are sorted according to the `title` field unless a `weight` field is present.

The Chapter 1 example gives a sample Reveal.js slideshow. Note that the frontmatter gives a `type` field stating that it should use the templates for Reveal, and that the `hidden` field is set to true, which will remove this page from the left-hand menu.

## Layouts

By default, any files not present in the top level directories will be read from the corresponding directory in `themes/hugo-theme-learn`. So, the only files present in the `layouts` and `static` folder are those which are customized from the default theme, or new ones added for this framework. Most customized files have short comments discussing the edits made, or you can diff them with the corresponding theme file to get a summary of the changes.

The biggest addition is the "iframeable" type. For each content page (but not the chapter index pages nor the homepage), a second version of the page will be created at the same URL with a filename `embed.html` instead of `index.html`. This version of the file does not have any of the navigation elements on it, and it is perfect for embedding in an IFrame for use in an LMS.

There is also a "teleprompter" type that creates a mirrored and simplified version of each content page, meant to be used along with a teleprompter. This will be created at the same URL with a filename `tele.html`. It includes JavaScript code to set the scroll speed of the page by clicking it with the mouse, or it can be scrolled manually.

## Questions?

Contact [Russell Feldhausen](https://russfeld.me) - russfeld@ksu.edu 
