---
title: "Deploying Textbook"
pre: "3. "
weight: 30
---

This page gives the basic instructions for deploying a textbook to the server. It is mainly meant as a reference for the server's administrators, but it is helpful for everyone to understand the process.

## Clone Repository on Server

1. Log in to the server via SSH and switch to the `textbooks` account: `sudo su textbooks`.
2. Change directory to the `textbooks` user's home directory: `cd ~`.
3. Clone the repository into this folder: `git clone <url> <directory>`.
4. Change directory to the textbook's directory: `cd <directory>`.
5. Initialize submodules: `git submodule init`.
6. Recursively pull submodules: `git pull --recurse`.
7. Log out of the `textbooks` account: `exit`.

## Set up Webhook on Server

1. Switch to the `config` account: `sudo su config`.
2. Change directory to the `config` user's home directory: `cd ~`.
3. Edit the `webhook/webhook.conf` file to add a new webhook.
    1. In general, just copy an existing webhook definition and edit to match the new site. **Be Careful!** The configuration file is JSON and is very picky about proper JSON syntax.
    1. [Webhook Documentation](https://github.com/adnanh/webhook).
4. Save the file.
5. Log out of the `config` account: `exit`.
6. Restart webhook service: `sudo systemctl restart webhook`.

Example Webhook:

```json
{
  "id": "hugo-starter",
  "execute-command": "/home/config/bin/deploy-101.sh",
  "command-working-directory": "/home/textbooks/hugo-starter/",
  "response-message": "Executing checkout script",
  "pass-arguments-to-command":
  [
    {
        "source": "string",
        "name": "hugo-starter"
    }
  ],
  "trigger-rule":
  {
    "match":
    {
      "type": "value",
      "value": "secret",
      "parameter":
      {
        "source": "header",
        "name": "X-Gitlab-Token"
      }
    }
  }
}
```

Items to configure:

* `id`: this is the identifier for the webhook used in the URL
* `execute-command`: see the scripts in the `/home/config/bin` directory. 
* `command-working-directory`: this is the directory where the textbook repository is stored.
  * `deploy.sh` will use the default version of Hugo
  * `deploy-101.sh` will use Hugo version 0.101.0
* `pass-arguments-to-command`: this determines the folder where the content will be deployed. The `name` should match the URL desired (e.g. `hugo-starter` will deploy at `https://textbooks.cs.ksu.edu/hugo-starter`)
* `trigger-rule`: is used to determine if the webhook request is valid. Change the `value` to match the key given when setting up the webhook in GitLab. 

## Set up Webhook on GitLab

1. Open the repository on GitLab and navigate to the **Settings -> Webhooks** menu.
2. Add a hook using the following settings:
  1. URL: `http://pacer.cs.ksu.edu:9000/hooks/<hook_id>`
  2. Secret Token: `<secret>`
  3. Trigger: **Push events**
     1. You can specify a specific branch; I typically leave this blank. 
  4. **Uncheck SSL Verification** - we currently don't have an SSL certificate on the webhook server.
3. Click **Add Webhook** to save. 
4. Once saved, click the **Test** option and choose **Push Event** to test it. It should quickly return `HTTP 200` at the top of the page if it is working.

## Update Permissions

1. After the first deployment, on the server, go to the web directory: `cd /var/www/textbooks.cs.ksu.edu`
2. Update the permissions on the new directory:
    1. `sudo chown -R textbooks:www-data <directory>`
    1. `sudo chmod -R g+w <directory>`

## Update Homepage

1. Log in to the server via SSH and switch to the `textbooks` account: `sudo su textbooks`.
2. Edit the site's homepage at `/var/www/textbooks.cs.ksu.edu/index.html` to include a link to the new site. 
3. Save the file, and then log out of the `textbooks` account: `exit`.

## Save Configuration

1. Switch to the `config` account: `sudo su config`.
2. Change directory to the `config` user's home directory: `cd ~`.
3. Copy the updated `index.html` file to the `nginx` folder: `cp /var/www/textbooks.cs.ksu.edu/index.html ~/nginx/`.
4. Use `git` to commit and push the changes to the server configuration to GitLab.
    1. The only files changed should be `webhook/webhook.conf` and `nginx/index.html`. 
5. Log out of the `config` account: `exit`.

## Notifications

Deployment notifications are sent to a Discord server. Contact one of the other textbook authors to get access to that Discord server. It is helpful if you want to see that your deployments are starting and completing correctly.

## Debugging

Deployment logs are stored in the `/home/textbooks/<name>.log` file. This can be helpful for debugging. 