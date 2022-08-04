---
title: "Cloning an Existing Textbook"
pre: "7. "
weight: 70
---

The instructions to clone an existing textbook are simple, but require a few extra steps compared to a normal git repository setup.

The basic version is to run these commands, where `<directory>` is the directory where the site should be stored:

```bash
git clone <url> <directory>
cd <directory>
git submodule init
git pull --recurse
```

These commands do the following:

* `git clone <url> <directory>` will clone the existing git repository at `<url>` into the local directory `<directory>`.
* `cd <directory>` will change the current working directory to be the directory where the site is stored.
* `git submodule init` will initialize the submodules for this repository. We use git submodules to keep track of the theme and make it easy to update the theme as needed.
* `git pull --recurse` will pull the latest version of the repository AND the theme. The theme will be locked to a specific version unless you go through the steps to [Update the Theme]({{< relref "04-update" >}}). 

