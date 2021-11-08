#!/bin/bash
# -*-mode:bash-*- vim:ft=bash

# Copyright (c) 2021, René-Marc Simard (https://github.com/renemarc/dotfiles)
#
# ~/dotfiles.sh
# =============================================================================
# Setup script to install and / or update shell dependencies.

set -e

command_exists() {
    command -v "$@" >/dev/null 2>&1
}

error() {
    printf -- "%sError: $*%s\n" >&2 "$RED" "$RESET"
}

setup_color() {
    if [ -t 1 ]; then
        RED=$(printf '\033[31m')
        GREEN=$(printf '\033[32m')
        # YELLOW=$(printf '\033[33m')
        BLUE=$(printf '\033[34m')
        BOLD=$(printf '\033[1m')
        RESET=$(printf '\033[m')
    else
        RED=""
        GREEN=""
        # YELLOW=""
        BLUE=""
        BOLD=""
        RESET=""
    fi
}

import_repo() {
    repo=$1
    destination=$2
    if uname | grep -Eq '^(cygwin|mingw|msys)'; then
        uuid=$(powershell -NoProfile -Command "[guid]::NewGuid().ToString()")
    else
        uuid=$(uuidgen)
    fi
    TMPFILE=$(mktemp /tmp/dotfiles."${uuid}".XXXXX --suffix=.tar.gz) || exit 1
    curl -s -L -o "$TMPFILE" "$repo" || exit 1
    chezmoi import --strip-components 1 --destination "$destination" "$TMPFILE" || exit 1
    rm -f "$TMPFILE"
}

setup_dependencies() {
    printf -- "\n%sSetting up dependencies:%s\n\n" "$BOLD" "$RESET"

    # Install Homebrew packages
    if command -v brew > /dev/null; then
        printf -- "%sInstalling/updating apps using Homebrew...%s\n" "$BLUE" "$RESET"
        brew bundle --global
    fi
}

setup_prompts() {
    printf -- "\n%sSetting up shell frameworks:%s\n\n" "$BOLD" "$RESET"

    # Install Oh My Zsh
    PACKAGE_NAME='Oh My Zsh'
    printf -- "%sInstalling/updating %s...%s\n" "$BLUE" "$PACKAGE_NAME" "$RESET"
    CHEZMOIPATH=$(chezmoi source-path)
    rm -rf "$CHEZMOIPATH"/dot_oh-my-zsh/plugins
    import_repo 'https://github.com/robbyrussell/oh-my-zsh/archive/master.tar.gz' "${HOME}/.oh-my-zsh" || {
        error "import of ${PACKAGE_NAME} failed"
        exit 1
    }

    # Install Zsh plugins
    PACKAGE_NAME='zsh-autosuggestions'
    printf -- "%sInstalling/updating Zsh plugin: %s...%s\n" "$BLUE" "$PACKAGE_NAME" "$RESET"
    import_repo 'https://github.com/zsh-users/zsh-autosuggestions/archive/master.tar.gz' "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" || {
        error "import of ${PACKAGE_NAME} failed"
        exit 1
    }

    PACKAGE_NAME='zsh-syntax-highlighting'
    printf -- "%sInstalling/updating Zsh plugin: %s...%s\n" "$BLUE" "$PACKAGE_NAME" "$RESET"
    import_repo 'https://github.com/zsh-users/zsh-syntax-highlighting/archive/master.tar.gz' "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" || {
        error "import of ${PACKAGE_NAME} failed"
        exit 1
    }

    PACKAGE_NAME='Powerlevel10k'
    printf -- "%sInstalling/updating Zsh theme: %s...%s\n" "$BLUE" "$PACKAGE_NAME" "$RESET"
    import_repo 'https://github.com/romkatv/powerlevel10k/archive/master.tar.gz' "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/themes/powerlevel10k" || {
        error "import of ${PACKAGE_NAME} failed"
        exit 1
    }
}

finalize_dotfiles() {
    printf -- "\n%sFinalizing dotfiles:%s\n\n" "$BOLD" "$RESET"

    printf -- "%sUpdating dotfiles at destination...%s\n" "$BLUE" "$RESET"
    chezmoi apply
}

main() {
    printf -- "\n%sDotfiles setup script%s\n" "$BOLD" "$RESET"

    command_exists chezmoi || {
        error "chezmoi is not installed"
        exit 1
    }

    setup_dependencies
    setup_color
    setup_prompts
    finalize_dotfiles

    printf -- "\n%sDone.%s\n\n" "$GREEN" "$RESET"
}

main "$@"
