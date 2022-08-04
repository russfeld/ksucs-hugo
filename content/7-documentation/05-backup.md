---
title: "Setting Up Backups"
pre: "5. "
weight: 50
---

To provide extra security, you can also set up a live backup of your textbook to be hosted on GitHub. This page gives the instructions for setting this up.

## Create GitHub Repository

1. If you haven't already, ask another textbook author to join the [ksu-cs-textbooks](https://github.com/ksu-cs-textbooks) organization on GitHub.
2. Create a new repository on the [ksu-cs-textbooks](https://github.com/ksu-cs-textbooks) organization on GitHub.
    1. The name of the repository should match the desired URL for your textbook (e.g. `https://ksu-cs-textbooks.github.io/<repo_name>`)
    2. **Do not initialize the repository with a README file**.
    3. The repository itself should be private.

## Mirror GitLab Repository to GitHub

1. On the [CS GitLab Server](https://gitlab.cs.ksu.edu/), open the repository and go to the **Settings -> Repository** menu.
2. Expand the **Mirroring Repositories** section.
3. In the **Git repository URL**, enter the SSH URL for the GitHub repository in the box.
    1. You must add `ssh://` to the front of the repository, and also change the colon between the hostname and the organization name to a slash `/`.
    2. For example, `git@github.com:ksu-cs-textbooks/hugo-starter.git` becomes `ssh://git@github.com/ksu-cs-textbooks/hugo-starter.git`
4. For **Mirror Direction** choose **Push**
5. Click the **Detect Host Keys** button. It should show a key fingerprint for GitHub in a few seconds. **THIS IS IMPORTANT!** There is no way to do this after the fact.
6. For **Authentication Method** choose **SSH Public Key**.
7. Do not check **Keep divergent refs** - since we don't want to commit directly to GitHub, we don't need this. 
8. Checkmark **Mirror only protected branches**. Only the `main` or `master` branch will be mirrored.
9. Click **Mirror Repository** to save the settings.

Once that is done, you'll need to add an SSH public key to your GitHub Account.

1. Click the **Copy SSH Public Key** button in the list of mirrored repositories on GitLab.

![SSH Public Key Button](/images/ssh_public_key.png)

2. On GitHub, navigate to [**Settings -> SSH and GPG Keys**](https://github.com/settings/keys)
3. Click **New SSH Key** and paste that key. Give it a name like **CS GitLab &lt;Textbook>** to help keep track of it. 
4. Click **Add SSH Key** to save it.
5. Go back to GitLab, and click the **Update Now** button (right next to the **Copy SSH Public Key** button). That will try to mirror the repository. After a few seconds, you should see the content appear in GitHub.

## Update the Website

In order to properly build the backup site on GitHub, several changes must be made to the existing website directory.

1. Create a folder `.github` to store GitHub specific configuration files.
2. Create the file `.github/workflows/gh-pages.yml` with the following content:

```yml
# https://github.com/peaceiris/actions-hugo

name: GitHub Pages

on:
  push:
    branches:
      - main  # Set a branch to deploy
  pull_request:

jobs:
  deploy:
    runs-on: ubuntu-20.04
    concurrency:
      group: ${{ github.workflow }}-${{ github.ref }}
    steps:
      - uses: actions/checkout@v3
        with:
          submodules: true  # Fetch Hugo themes (true OR recursive)
          fetch-depth: 0    # Fetch all history for .GitInfo and .Lastmod

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: '0.101.0'
          # extended: true

      - name: Build
        run: hugo -b "https://ksu-cs-textbooks.github.io/hugo-starter"

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        if: ${{ github.ref == 'refs/heads/main' }}
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
```

Update the `-b "https://ksu-cs-textbooks.github.io/hugo-starter"` to match the URL where the site will be deployed (e.g. `https://ksu-cs-textbooks.github.io/<repo_name>`)

Update the two instances of `main` to `master` if needed to match your repository configuration. You can also update the value of the `hugo-version` variable to match your desired Hugo version. 

{{% notice note %}}

For more advanced configuration, copy `config.toml` to `github.toml` and then edit that file to update the `baseURL` and other settings. Update the command to `hugo --config github.toml` to use that configuration file for deployment on GitHub.

{{% /notice %}}

3. [Optional] Create the file `.github/dependabot.yml` with the following content:

```yml
version: 2
updates:
  # Maintain dependencies for GitHub Actions
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "daily"
  # Git Submodules
  - package-ecosystem: "gitsubmodule"
    directory: "/"
    schedule:
      interval: "daily"
```

This will help keep any underlying GitHub actions updated, and it will also send emails when the theme has been updated. 

4. Once these changes are made, commit and push them to GitLab. You should also see them mirrored to GitHub as well. 

## Configure GitHub Pages Environment

Now that the site has the required GitHub configuration, we need to set up GitHub Pages to deploy the rendered site.

1. Once the site is updated, GitHub should automatically run the `gh-pages` action. You can click the **Actions** tab on GitHub to see that the action completed successfully. 
2. On the GitHub repository, click the **Settings** tab and navigate to the **Pages** option.
3. Under the **Branch** heading, choose the `gh-pages` branch and the `/ (root)` folder, then click **Save**

![GitHub Pages Configuration](/images/gh-pages.png)

4. After a minute or so, the GitHub Pages deployment should finish. On the main repository page, you should see is as an active environment on the right side. 
5. Once that is done, you can click on the **github-pages** environment, and click **View Deployment** to see the live version of the site. 

## Add to Homepage

The textbook backups are listed on the homepage available at [https://ksu-cs-textbooks.github.io/](https://ksu-cs-textbooks.github.io/). That page can be updated by editing this [index.html](https://github.com/ksu-cs-textbooks/ksu-cs-textbooks.github.io/blob/main/index.html) page in the base repository. Anyone who is an owner of the group should be able to edit it. When you commit an edit to that page, it will automatically deploy and update. 



