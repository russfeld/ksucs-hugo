---
title: "Creating a Docker Container"
pre: "8. "
weight: 80
---

The Hugo textbooks can also be deployed into a Docker container. 

## Dockerfile

1. Create a file named `Dockerfile` in the site's base directory with the following content:

```dockerfile
FROM nginx:alpine as build

RUN apk add --update \
    wget git
    
ARG HUGO_VERSION="0.101.0"
RUN wget --quiet "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" && \
    tar xzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    rm -r hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    mv hugo /usr/bin

COPY ./ /site
WORKDIR /site
RUN hugo -b "https://hugo-starter.textbooks.cs.ksu.edu"

#Copy static files to Nginx
FROM nginx:alpine
COPY --from=build /site/public /usr/share/nginx/html

WORKDIR /usr/share/nginx/html
```

2. Update the following items in this file to match your desired configuration:
    1. The `HUGO_VERSION` argument should be set to the version of Hugo used for the site.
    2. The `RUN` command should include the URL that the site will be deployed to after the `-b` flag. Alternatively, copy `config.toml` to `docker.toml` and update the `baseURL` setting (as well as any other settings as desired), and use `RUN hugo --config docker.toml` instead.

You can find more information on setting up a `Dockerfile` in the [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/).

## Build Docker on GitLab

Docker images can be built using GitLab. The organization or repository on GitLab must be configured with a [GitLab Runner](https://docs.gitlab.com/runner/). This has already been done in most GitLab organizations on the CS GitLab server that contain textbooks. 

1. Create the file `.gitlab-ci.yml` in the site's base directory with the following content:

```yml
image: docker:20.10.11

variables:
  # When using dind service, you must instruct docker to talk with the
  # daemon started inside of the service. The daemon is available with
  # a network connection instead of the default /var/run/docker.sock socket.
  #
  # The 'docker' hostname is the alias of the service container as described at
  # https://docs.gitlab.com/ee/ci/docker/using_docker_images.html#accessing-the-services
  #
  # If you're using GitLab Runner 12.7 or earlier with the Kubernetes executor and Kubernetes 1.6 or earlier,
  # the variable must be set to tcp://localhost:2375 because of how the
  # Kubernetes executor connects services to the job container
  # DOCKER_HOST: tcp://localhost:2375
  #
  DOCKER_HOST: tcp://docker:2375
  #
  # This instructs Docker not to start over TLS.
  DOCKER_TLS_CERTDIR: ""
  # 
  # Checkout submodules recursively
  GIT_SUBMODULE_STRATEGY: recursive

services:
  - docker:20.10.11-dind

before_script:
  - docker info
  - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY

build-latest:
  stage: build
  only:
    - tags
  script:
    - docker pull $CI_REGISTRY_IMAGE:latest || true
    - docker build --cache-from $CI_REGISTRY_IMAGE:latest --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA --tag $CI_REGISTRY_IMAGE:latest .
    - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
    - docker push $CI_REGISTRY_IMAGE:latest

# build-branches:
#   stage: build
#   except:
#     - master
#     - main
#   script:
#     - docker pull $CI_REGISTRY_IMAGE:$CI_COMMIT_BRANCH || true
#     - docker build --cache-from $CI_REGISTRY_IMAGE:latest --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_BRANCH .
#     - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA
#     - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_BRANCH
```

2. Update the following items in this file to match your desired configuration:
    1. Under the `build-latest` job, it uses `- tags` under the `only` heading. This will only build a Docker container when a new tag is pushed. This reduces the number of containers built, since it is a time-consuming job. You can change this to the following to have it build anytime changes are made to the `main` or `master` branches:
```yml
only:
  - main
  - master

```

3. You can also enable additional jobs:
    1. The `build-branches` job is commented out. This will build a Docker container for each branch that is tagged using the branch name. This can be uncommented if you'd like to build Docker containers based on a branch. (Likewise, the `except` section can be replaced with an `only` section to target specific branches.)

More information on the GitLab CI file can be found in the [GitLab Documentation](https://docs.gitlab.com/ee/ci/yaml/)

{{% notice warning %}}

You should also enable package cleanup in GitLab by going to the **Settings -> Packages and Registries** menu in the repository and turning on **Clean Up Image Tags**. This will clean up all tags older than 90 days, except for the last 10 tags. The `latest` tag will be kept indefinitely until replaced by a new version. This will help save space on GitLab as images are built and replaced. 

{{% /notice %}}

## Build Docker on GitHub

Docker images can be built using GitHub.

1. Create a file `.github/worflows/docker-image.yml` with the following content:

```yml
name: Docker Image CI

on:
  push:
    tags:
      - "v*.*.*"

jobs:

  build:
    runs-on: ubuntu-latest
    steps:

    - uses: actions/checkout@v3
      with:
        submodules: recursive
        fetch-depth: 0
      
    - name: Login to GitHub Container Registry
      uses: docker/login-action@v1 
      with:
        registry: ghcr.io
        username: ${{ github.repository_owner }}
        password: ${{ secrets.GITHUB_TOKEN }}
    - name: Build and push
      uses: docker/build-push-action@v2
      with:
        context: .
        push: true
        tags: |
            ghcr.io/${{ github.repository}}:latest
```

2. Update the following items in this file to match your desired configuration:
    1. Under the `push` heading, it is configured to run this only when a new tag is pushed that matches [Semantic Versioning](https://semver.org/) structure. You can change this to the following to have it build anytime changes are made to the `main` or `master` branches:

```yml
push:
    branches: [ master, main ]
```

This can also be configured to send notifications to Discord on a successful deployment, and it can also trigger a webhook after deployment. See [this example](https://github.com/russfeld/ksucs-hugo/blob/master/.github/workflows/docker-image.yml) for how to configure those options. It requires creation of [GitHub Action Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets) for the Discord webhook and deployment webhook.

More information can be found on the [GitHub Actions Documentation](https://docs.github.com/en/actions).

{{% notice warning %}}

As of this writing, GitHub will store all previous versions of this package, and there is no automatic way to delete older packages outside of using another GitHub action. So, if you choose to go this route, you may have to deal with manually cleaning up old packages at some point in the future if you run out of space on GitHub.  

{{% /notice %}}