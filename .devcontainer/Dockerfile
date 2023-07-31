# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.231.0/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version (use jammy or bionic on local arm64/Apple Silicon): jammy, focal, bionic
ARG VARIANT="jammy"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# Install chezmoi to /usr/bin/chezmoi
RUN cd /usr && sudo sh -c "$(curl -fsLS chezmoi.io/get)"
