---
title: "Updating the Theme"
pre: "4. "
weight: 40
---

From time to time, the underlying [Hugo Theme Relearn](https://github.com/ksu-cs-textbooks/hugo-theme-relearn) clone may be updated. This page gives the directions for updating your textbook to the latest theme.

1. Save and commit any work done on the textbook and push to GitLab. Wait until the deployment completes before continuing.
2. In the site's directory, open the `themes/hugo-theme-relearn` directory: `cd themes/hugo-theme-relearn`.
3. Check out the `main` branch of the theme if you haven't already: `git checkout main`.
4. Pull the latest version of the theme: `git pull`.
5. Change directory back to the site's directory: `cd ../../`.
6. Preview the changes: `hugo serve`.
7. If everything looks good, commit and push: `git commit -m "Update Theme" && git push`
    1. It should show `modified:   themes/hugo-theme-relearn (new commits)` when running `git status` to confirm that the theme is being updated.
8. The site should deploy with the new theme. 

