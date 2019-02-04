#!/bin/bash

echo Install all AppStore Apps at first!
# no solution to automate AppStore installs
read -p "Press any key to continue... " -n1 -s
echo  '\n'

# Homebrew
echo "Install Homebrew and Cask"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask

# alternative cask versions
brew tap caskroom/versions

# Install OSX CLI
echo "Install OSX CLI"
brew install ack \
             ansible \
             autoconf \
             azure-cli \
             base64 \
             bash \
             bash-completion \
             checkbashisms \
             cmake \
             coreutils \
             corkscrew \
             curl \
             dep \
             docker \
             docker-compose \
             docker-machine \
             docker-machine-nfs \
             dockutil \
             draft \
             etcd \
             gcc \
             gdbm \
             geoip \
             gettext \
             glib \
             gnu-sed \
             gnutls \
             go \
             gox \
             gpatch \
             htop \
             hub \
             hugo \
             jq \
             kube-prompt \
             kubectl \
             kubernetes-cli \
             kubernetes-helm \
             make \
             mc \
             minio \
             mono \
             ncurses \
             node \
             npm \
             packer \
             pcre \
             php \
             protobuf \
             python \
             python3 \
             qemu \
             tree \
             readline \
             rbenv \
             ruby-build \
             sqlite \
             telnet \
             tree \
             watch \
             wget \
             webkit2png \
             wget \
             zplug \
             zsh-syntax-highlighting

# Install OSX Apps
echo "Install OSX Apps"
brew cask install atom \
                  codebug \
                  dotnet \
                  firefox \
                  font-fira-code \
                  google-chrome \
                  graphviz \
                  google-chrome \
                  graphviz \
                  hyper \
                  iterm2 \
                  java \
                  kaleidoscope \
                  macpass \
                  mono-mdk \
                  pgweb \
                  powershell \
                  spectacle \
                  sqlitebrowser \
                  terraform \
                  the-unarchiver \
                  tower \
                  vagrant \
                  vault \
                  virtualbox

# Install QuickLooks plugins
# Source: https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode \
                  qlstephen \
                  qlmarkdown \
                  qlprettypatch
qlmanage -r

# Configure OH-MY-ZSH
echo "Install OH-MY-ZSH"
curl -L http://install.ohmyz.sh | sh

# Configure IDE
echo "Configure Atom IDE"
sh <(curl -sSL https://github.com/sylus/atom/raw/master/install.sh)

# Dockutil
dockutil --remove "Contacts" --allhomes
dockutil --remove "Maps" --allhomes
dockutil --remove "Messages" --allhomes
dockutil --remove "FaceTime" --allhomes
dockutil --remove "iBooks" --allhomes
dockutil --add "/Users/${USER}/Applications" --view grid --display folder --before Downloads
dockutil --add "~/Documents" --view grid --display folder --before Downloads
dockutil --add "/Users/${USER}/GitHub" --view grid --display folder --before Downloads
dockutil --add "~/Downloads" --view grid --display folder --replacing Downloads
dockutil --add "/Users/${USER}/Applications/Google Chrome.app" --section apps
dockutil --add "/Users/${USER}/Applications/Firefox.app" --section apps
dockutil --add "/Users/${USER}/Applications/iTerm.app" --section apps
dockutil --add "/Users/${USER}/Applications/MacPass.app" --section apps
dockutil --add "/Users/${USER}/Applications/Atom.app" --section apps
dockutil --add "/Users/${USER}/Applications/Tower.app" --section apps
dockutil --move "Safari" --after Firefox
dockutil --move "System Preferences" --after Finder

# Tidy up
brew linkapps
brew cleanup
brew prune
brew cask cleanup
