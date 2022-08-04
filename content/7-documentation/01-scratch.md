---
title: "Textbook From Scratch"
pre: "1. "
weight: 10
---

This gives the basic steps for creating a brand new Hugo textbook from scratch. 

## Basic Site Setup

The first steps come from the [Hugo Quick Start Guide](https://gohugo.io/getting-started/quick-start/)

1. Install Hugo from the [Hugo Releases](https://github.com/gohugoio/hugo/releases). You should have version `0.101.0` or higher.
2. Create a new site: `hugo new site <sitename>`.
3. Open the site's directory: `cd <sitename>`.
4. Start a git repository: `git init`.
5. Add the theme: `git submodule add https://github.com/ksu-cs-textbooks/hugo-theme-relearn themes/hugo-theme-relearn`
6. Update the `config.toml` file:
    1. Best way to start is simply to copy the [config.toml](https://github.com/ksu-cs-textbooks/hugo-starter/blob/main/config.toml) file for the starter site. It is well documented.
    2. Update the `baseURL` at the top to match the URL where the site will eventually be deployed.
    3. Update the `title` to match the site's name
    4. Update the `theme` to be just `theme = ["hugo-theme-relearn"]` (remove the `"plausible-hugo"` part)
    5. Under `[params]`, update the following:
        1. `editURL` to match the location where files can be edited in GitLab or GitHub.
        2. `author` used for metadata
        3. `description` used for metadata
        4. `commitURL` to match the location where individual commits can be found.
        5. Most of the parameters are documented in the [Hugo Theme Relearn Documentation](https://mcshelby.github.io/hugo-theme-relearn/basics/configuration/)
    6. Remove the `[params.plausible]` section - it is not used by the textbooks site. 
7. Preview the site using `hugo serve`. It will be available at the URL given in the output. If the site loads with default content, then it is working.

## Additional Configuration

Perform a few additional steps to make things work smoothly.

1. Create a `.gitignore` file in the site's base directory with the following content:

```ini
/public/
/resources/_gen
.hugo_build.lock
```

2. If you are using [Visual Studio Code](https://code.visualstudio.com/) to edit the site, create a `.vscode` folder in the site's base directory, and then a `settings.json` file inside of that directory with the following content to change the sort order of your editor's file explorer:

```json
{
    "explorer.sortOrder": "mixed"
}

```

## GitLab Repository Setup

Once the site is working locally, set up a repository on the [CS GitLab](https://gitlab.cs.ksu.edu/) server to store the data.

1. We recommend storing the textbook in the [CS Textbooks](https://gitlab.cs.ksu.edu/cs-textbooks) group. Contact another textbook author to get access.
2. Create a repository that matches your textbook name. Use the other repositories as a naming guide. **Do not initialize the repository in GitLab by creating a `README` file.**
    1. You can choose to make your repository **private** (accessible only to the group), **internal** (accessible to anyone with a CS account), or **public** (accessible to anyone). Only those with permissions can update the repository (typically group members), but others may be able to view the content.
3. In the site directory on your local system, add the repository's URL as a remote: `git remote add origin <url>`
4. Commit and push: `git commit -m "Initial Commit" && git push -u origin main` (substitute `master` for `main` if needed)
    5. Make sure that you don't commit the `.hugo_build.lock` file - it should be excluded via the `.gitignore` file created above. 

## Initial Content Creation

Now that the site is working, it is time to create some basic content. 

### Homepage

To create a home page, create a new `_index.md` file in the `content` directory. It should have at least the following content:

```md
+++
archetype = "home"
title = "Homepage"
+++

Lorem Ipsum
```

You can also create this page using the command `hugo new --kind home _index.md` from the site's directory and then modifying the content a bit.

See the [Hugo Theme Relearn Documentation](https://mcshelby.github.io/hugo-theme-relearn/cont/pages/#frontmatter-configuration) or [Hugo Documentation](https://gohugo.io/content-management/front-matter/) for more on how to use the front matter of each page. 

### Chapter

To create a chapter, first create a folder with the chapter's name in the `content` directory. We recommend including a number in front of the name to help with sorting, such as `01-introduction`. Then, inside of that folder, create a new `_index.md` file with the following content:

```md
+++
archetype = "chapter"
chapter = true
title = "Introduction"
pre = "<b>1. </b>"
weight = 1
+++

Lorem Ipsum.
```

You can also create this page using the command `hugo new --kind chapter 01-introduction/_index.md` from the site's directory and then modifying the content a bit. 

### Content Page

To create a content page, simply create a file inside of the desired directory with the `.md` file extension. Like chapters, we recommend adding a number in front of the file name to help with sorting, such as `01-welcome.md`. Place the following content in the page:

```md
---
title: "Welcome"
pre: "1. "
weight: 1
---

Lorem Ipsum.
```

You can also create this page using the command `hugo new 01-introduction/01-welcome.md` from the site's directory and then modifying the content a bit.

{{% notice tip %}}

Notice that the front matter for the homepage and chapters use plus symbols `+++` as delimiters, while the content pages themselves use dashes `---` instead. This is done by convention in this particular theme, and we follow that in this documentation. The plus symbols `+++` indicate that the front matter is written in [TOML](https://toml.io/en/) while the dashes `---` indicate that the front matter is written in [YAML](https://yaml.org/). The biggest difference is that TOML uses the equals symbol `=` for assignment, while YAML uses a colon `:` instead. See [Front Matter Formats](https://gohugo.io/content-management/front-matter/#front-matter-formats) for more information.

{{% /notice %}}

{{% notice note %}}

When creating this page using the command, it will add `draft: true` to the front matter. You'll want to remove that so it appears on the site, or use `hugo serve -D` to include drafts files when previewing the site. It will also include the date, which can be safely removed - the theme will use the date of the latest commit to GitLab that includes this file instead. 

{{% /notice %}}

### Logo

The site right now uses a default logo based on the site's title in `config.toml`. To override that, create a file at `layouts/partials/logo.html` in the site with the following content:

```html
<a id="logo" href="{{ .Site.Home.RelPermalink | default ("/" | relLangURL) }}">
  Hugo Starter
</a>
```

Replace the text with the desired logo content. Alternatively, an image can be used. Place the image in the `static/images/` folder and adapt the following HTML:

```html
<a id="logo" href="{{ .Site.Home.RelPermalink | default ("/" | relLangURL) }}">
    <img src="/images/logo.png" alt="Logo" style="width: 100%">
</a>

```

### Sidebar Footer

The sidebar footer can also be overridden by creating a file at `layouts/partials/menu-footer.html`. It is best to simply copy the existing content in [`themes/hugo-theme-relearn/layouts/partials/menu-footer.html`](https://github.com/ksu-cs-textbooks/hugo-theme-relearn/blob/main/layouts/partials/menu-footer.html) and edit it from that template. 

### Additional Content

From there, you can continue to create additional chapters and pages as needed. For more advanced content structures, look through the source code to [this site](https://github.com/russfeld/ksucs-hugo/tree/master/content). It includes examples for page bundles, leaf bundles, hidden pages, non-printable pages, syllabus pages, video content, historical content, and more. 