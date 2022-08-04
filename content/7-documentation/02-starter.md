---
title: "Textbook From Starter"
pre: "2. "
weight: 20
---

This gives the basic setup for a new textbook based on a starter repository.

## Clone Starter Repository

1. Install Hugo from the [Hugo Releases](https://github.com/gohugoio/hugo/releases). You should have version `0.101.0` or higher.
1. Clone the Starter Repository on [GitLab](https://gitlab.cs.ksu.edu/cs-textbooks/hugo-starter) or [GitHub](https://github.com/ksu-cs-textbooks/hugo-starter) to your local system: `git clone <url> <directory>`.
2. Open the site's directory: `cd <directory>`.
3. Initialize git submodules: `git submodule init`.
4. Recursively pull submodules: `git pull --recurse`.
5. Update the `config.toml` file:
    1. Update the `baseURL` at the top to match the URL where the site will eventually be deployed.
    2. Update the `title` to match the site's name
    3. Under `[params]`, update the following:
        1. `editURL` to match the location where files can be edited in GitLab or GitHub.
        2. `author` used for metadata
        3. `description` used for metadata
        4. `commitURL` to match the location where individual commits can be found.
        5. Most of the parameters are documented in the [Hugo Theme Relearn Documentation](https://mcshelby.github.io/hugo-theme-relearn/basics/configuration/)
6. Preview the site using `hugo serve`. It will be available at the URL given in the output. If the site loads with default content, then it is working.

## GitLab Repository Setup

Once the site is working locally, set up a repository on the [CS GitLab](https://gitlab.cs.ksu.edu/) server to store the data.

1. We recommend storing the textbook in the [CS Textbooks](https://gitlab.cs.ksu.edu/cs-textbooks) group. Contact another textbook author to get access.
2. Create a repository that matches your textbook name. Use the other repositories as a naming guide. **Do not initialize the repository in GitLab by creating a `README` file.**
    1. You can choose to make your repository **private** (accessible only to the group), **internal** (accessible to anyone with a CS account), or **public** (accessible to anyone). Only those with permissions can update the repository (typically group members), but others may be able to view the content.
3. In the site directory on your local system, add the repository's URL as the new remote: `git remote set-url origin <url>`
4. Commit and push: `git commit -m "Initial Commit" && git push -u origin main` (substitute `master` for `main` if needed)
    5. Make sure that you don't commit the `.hugo_build.lock` file - it should be excluded via the `.gitignore` file in the initial repository.

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

The starter repository contains all of the basic content covered in the [Textbook from Scratch]({{< relref "01-scratch" >}}) page. 

From there, you can continue to create additional chapters and pages as needed. For more advanced content structures, look through the source code to [this site](https://github.com/russfeld/ksucs-hugo/tree/master/content). It includes examples for page bundles, leaf bundles, hidden pages, non-printable pages, syllabus pages, video content, historical content, and more. 