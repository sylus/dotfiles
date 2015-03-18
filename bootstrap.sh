#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function home_sync() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    --exclude "README.md" --exclude "install.sh" \
    --exclude "LICENSE.txt" -avh --no-perms . ~;
}

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " ans;
echo "";
if [ "$ans" == "y" ]; then
  echo "running"
  home_sync;
fi;
