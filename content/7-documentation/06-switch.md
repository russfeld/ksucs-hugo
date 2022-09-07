---
title: "Switching to New Theme"
pre: "6. "
weight: 60
---

{{% notice warning %}}

This page gives instructions for switching an existing textbook using the previous theme to the new version of [Hugo Theme Relearn](https://github.com/ksu-cs-textbooks/hugo-theme-relearn). Only use these instructions once per textbook!

{{% /notice %}}

## Update Hugo

The new theme requires Hugo version `0.101.0` or higher. Install Hugo from the [Hugo Releases](https://github.com/gohugoio/hugo/releases).

## Installing the Theme

Install the new theme as a git submodule:

```bash
git submodule add https://github.com/ksu-cs-textbooks/hugo-theme-relearn.git themes/hugo-theme-relearn
```

## Updating the Configuration

1. Copy `config.toml` to `config.toml.bak` as a backup.
2. Replace the content in `config.toml` with the content from the [config.toml](https://github.com/ksu-cs-textbooks/hugo-starter/blob/main/config.toml) from the starter site.
3. Customize `config.toml` to match the desired site configuration (refer to the `config.toml.bak` as needed).
    1. Update the `baseURL` at the top to match the URL where the site will eventually be deployed.
    2. Update the `title` to match the site's name
    3. Under `[params]`, update the following:
        1. `editURL` to match the location where files can be edited in GitLab or GitHub.
        2. `author` used for metadata
        3. `description` used for metadata
        4. `commitURL` to match the location where individual commits can be found.
        5. Most of the parameters are documented in the [Hugo Theme Relearn Documentation](https://mcshelby.github.io/hugo-theme-relearn/basics/configuration/)
        6. Add any custom parameters used in the previous site.
4. Once all updates have been made, delete the `config.toml.bak` file.

## Updating Other Configurations

Depending on how the site is used, the following other configuration updates must be made.

### GitHub Backups

If the site is set up for GitHub backups, there are two options:

1. If `github.toml` is present, and you'd like to continue using multiple configuration files, replace it with the current contents of the `config.toml` file and update the `baseURL` to match what was previously in the `github.toml` file (e.g. `https://ksu-cs-textbooks.github.io/<repo_name>`). Ensure that the `hugo` command in `.github/workflows/gh-pages.yml` is `hugo --config github.toml` so that the correct file will be used.
2. If `github.toml` is not present, or you'd like to simplify the configuration, set the `hugo` command in the `.github/workflows/gh-pages.yml` file to be `hugo -b "https://ksu-cs-textbooks.github.io/<repo_name>"` and update `<repo_name>` to match the correct URL. This will use the `config.toml` file but override the `baseURL` when building it.

In addition, you should confirm that the `hugo-version` setting in `.github/workflows/gh-pages.yml` is set to `0.101.0`. 

### Docker images

If the site is set up to build Docker images, there are two options:

1. If `docker.toml` is present, and you'd like to continue using multiple configuration files, replace it with the current contents of the `config.toml` file and update the `baseURL` to match what was previously in the `docker.toml` file (e.g. `https://<name>.textbooks.cs.ksu.edu`). Ensure that the `hugo` command in the `Dockerfile` is `hugo --config docker.toml` so that the correct file will be used.
2. If `docker.toml` is not present, or you'd like to simplify the configuration, set the `hugo` command in the `Dockerfile` to be `hugo -b "https://<name>.textbooks.cs.ksu.edu"` and update `<name>` to match the correct URL. This will use the `config.toml` file but override the `baseURL` when building it.

In addition, you should confirm that the `HUGO_VERSION` argument in the `Dockerfile` is set to `0.101.0`. 

Finally, since we aren't currently using Docker images yet, you may wish to configure your textbook to only create a Docker image when a new tag is pushed, or disable this completely for the time being. See the [Docker Container]({{< relref "08-docker.md" >}}) page for more information. 

## Updating layouts

If the site has overridden any layouts in the `layouts` folder, they should be reviewed and updated as needed.

* `layouts/partials/logo.html` - the default logo will use the `title` from the `config.toml` file as a clickable link. If this is desired, then delete `layouts/partials/logo.html`. Otherwise, update it using the following templates as a guide:

**Static Text**

```html
<a id="logo" href="{{ .Site.Home.RelPermalink | default ("/" | relLangURL) }}">
  Hugo Starter
</a>
```

**Logo Image**

```html
<a id="logo" href="{{ .Site.Home.RelPermalink | default ("/" | relLangURL) }}">
    <img src="/images/logo.png" alt="Logo" style="width: 100%">
</a>

```

* `layouts/partials/menu-footer.html` - the default menu footer gives information about the site and the CC-BY-NC-SA license. If this is desired, then delete the `layouts/partials/menu-footer.html` from the site. Otherwise, update it using the following templates as a guide (change only the second paragraph to your desired license information).

{{% notice note %}}

The footer works best with a bit of inline HTML to fix the design. I left it this way since it was easier to override than trying to adjust it in the base theme, since updates to the base theme's CSS may cause issues. 

{{% /notice %}}

**Default Footer**

```html
<style>
#footer {
	font-size: 13px;
	margin-left: auto;
	margin-right: auto;
	padding: 2rem 1rem;
	min-width: 230px;
	max-width: 300px;
}
#footer p {
	margin: 0;
}
</style>

<p>Built using <a href="http://gohugo.io/">Hugo</a> and <a href="https://github.com/ksu-cs-textbooks/hugo-theme-relearn">Hugo Relearn Theme</a>.</p>
<p><a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0; margin: .5rem auto" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.</a></p>
```

**CC Course Footer with License and Attribution Info**

```html
<style>
#footer {
    font-size: 13px;
    margin-left: auto;
    margin-right: auto;
    padding: 2rem 1rem;
    min-width: 230px;
    max-width: 300px;
}
#footer p {
    margin: 0;
}
</style>
    
<p>Built using <a href="http://gohugo.io/">Hugo</a> and <a href="https://github.com/ksu-cs-textbooks/hugo-theme-relearn">Hugo Relearn Theme</a>.</p>
<p><a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0; margin: .5rem auto" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.</a> See <a href="https://core.cs.ksu.edu/license">License & Attribution</a> for details.</p>
```

## Front Matter Changes

By default, the site will now create a printable version of all pages. To remove a page or group of pages from the printed view (such as announcements or assignments pages), add `noprint = true` (TOML) or `noprint: true` (YAML) to the front matter of a page or chapter. Any pages beneath that page in the tree will not be included in the print view. By default, all hidden pages will also not be included (but they also won't be visible in the sidebar menu).

The template no longer includes code for the `section: true` front matter option - it should be switched to `chapter: true` to get the chapter header formatting, otherwise it can be removed entirely.

The `date` option is no longer used. It can be deleted or ignored. 

See the [Hugo Theme Relearn Documentation](https://mcshelby.github.io/hugo-theme-relearn/cont/pages/#frontmatter-configuration) or [Hugo Documentation](https://gohugo.io/content-management/front-matter/) for more on how to use the front matter of each page. 

{{% notice note %}}

This may be an incomplete list of front matter changes - if you run into additional front matter issues when upgrading, let me know and I'll update this document.

{{% /notice %}}

## Content Changes

### LaTeX Math

Hugo Theme Relearn changed the way that LaTeX math is handled in markdown. Now it is best to either include it in a shortcode or a code fence instead of just using dollar signs `$` directly in the markdown. See the [Hugo Theme Relearn Documentation](https://mcshelby.github.io/hugo-theme-relearn/shortcodes/math/) for additional details. 

In general, any inline LaTeX using single dollar signs `$` should be wrapped with the new `math` shortcode, as in {{< math >}}$e^x${{< /math >}}.

For multiline LaTeX using two dollar signs `$$`, use the `math` codefence:

```math
$$
e^{i \pi} + 1 = 0
$$
$$
sin^2(x) + cos^2(x) = tan^2(x)
$$
```

## Shortcode Changes

Click here for [Complete Shortcode Documentation](https://ksucs-hugo.russfeld.me/4-shortcodes/). The following shortcodes should be reviewed for updates:

### New Shortcodes

* `syllabus` - this is a new shortcode to replace the previous `include` shortcodes for default syllabus statements. See the [Syllabus Shortcode Documentation](https://ksucs-hugo.russfeld.me/4-shortcodes/09-syllabus/) for how to use it.
* `quizdown` - this is an implementation of the [Quizdown](https://github.com/bonartm/hugo-quiz) plugin to add short quizzes to the site. 

### Updated Shortcodes

* `include` - this shortcode should now use the `< >` delimiters instead of `% %`. Using `< >` will prevent the Markdown renderer from rendering the content twice, resulting in extra spacing around URLs and other strange formatting issues. See [Shortcodes](https://gohugo.io/content-management/shortcodes/) for more information on the different shortcode delimiters. See [Custom Include Shortcode Documentation](https://ksucs-hugo.russfeld.me/4-shortcodes/03-include/) and [Default Include Shortcode Documentation](https://ksucs-hugo.russfeld.me/4-shortcodes/08-defaults/include/) for more details on the shortcode itself. It should now support other shortcodes in included files! I recommend running a quick search for something like `{% include` and `{%include` to catch most of these and review them on the rendered site before committing.

{{% notice note %}}

If you are including files from the previous theme, such as the default syllabus statements, you should update the path to the new theme or consider using the new `syllabus` shortcode for this.

{{% /notice %}}

* `notice` - this shortcode has many new features, and the syntax for it is slightly different (only if you were using custom titles or icons - the base `notice` shortcode hasn't changed). See [Noiframe Notice Shortcode Documentation](https://ksucs-hugo.russfeld.me/4-shortcodes/01-notice/) and [Notice Shortcode Documentation](https://ksucs-hugo.russfeld.me/4-shortcodes/08-defaults/notice/) for more information.

### Deprecated Shortcodes

* `link` - the `link` shortcode has been removed. Now, the default HTML renderer is configured to have a link either open in the same tab if it is a local link (does not have `http` in the URL), otherwise it will open in a new tab if the link goes to an external site. See [Link Shortcode](https://ksucs-hugo.russfeld.me/4-shortcodes/04-link/) for more information. All links can now be converted to standard Markdown syntax `[Link Name](link_url)` or replaced with an HTML `<a href="link_url" target="_blank" rel="noopener">Link Name</a>` tag. You may also want to review the [relref](https://gohugo.io/functions/relref/) function in Hugo to generate relative links to pages within the site that use the correct base URL. 
* `norender` - the `norender` shortcode has been removed. It can be replaced by enclosing the content in a `<pre> </pre>` HTML element.
* `static` - the `static` shortcode has been removed. Any files in the `/static` folder within the site are now accessible using direct URLs. For example, a file at `/static/images/logo.png` can be included using `![Logo](/images/logo.png)`. As long as the `baseURL` and `canonifyURLs` settings in `config.toml` are correct, Hugo will automatically update these URLs to the correct path. 

{{% notice note %}}

This may be an incomplete list of shortcode changes - if you run into additional shortcode issues when upgrading, let me know and I'll update this document.

{{% /notice %}}

## Preview Content

At this point, you should preview the content in your site using `hugo serve` and ensure that it looks correct. If everything is working properly, then continue. If not, feel free to contact the theme maintainer for assistance.

## Update Deployment

{{% notice warning %}}

As of August 2022, the server has not been updated to use a newer version of Hugo by default. Therefore, before deploying an updated site, contact one of the server administrators to have your site's webhook updated to use the `deploy-101.sh` deployment script, which uses the new version of Hugo.

{{% /notice %}}

## Commit and Push to Test Deployment

If everything is working correctly, you should be able to commit and push. Make sure that everything has deployed and updated properly. You may have to clear your browser's cache using `CTRL+F5` or `CMD+F5` to get the latest version of the CSS file. 

If anything doesn't look correct, contact the theme maintainer for assistance. 

## Removing the Old Theme

Once everything is working properly, you should remove the old theme from your repository using these commands:

```bash
git rm themes/ksucs-hugo-theme
rm -rf .git/modules/themes/ksucs-hugo-theme
git config --remove-section submodule.themes/ksucs-hugo-theme
```

After making those changes, commit and push. 

## Updating Other Copies of the Repository

After updating the textbook on one system, it is recommended to **delete and re-clone** the repository on any other systems that are using it. That will give the cleanest version of the updated repository without any residual files from the previous theme. Run these commands starting outside of the site's directory, where `<directory>` is the directory containing the site. 

```bash
rm -rvf <directory>
git clone <url> <directory>
cd <directory>
git submodule init
git pull --recurse
```

