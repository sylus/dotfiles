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
brew install ack
brew install docker
brew install docker-compose
brew install dockutil
brew install hub
brew install hugo
brew install go
brew install mercurial
brew install npm
brew install tree
brew install rbenv
brew install ruby-build
brew install webkit2png
brew install wget

# Install OSX Apps
echo "Install OSX Apps"
brew cask install atom
brew cask install boot2docker
brew cask install chefdk
brew cask install coda
brew cask install codebug
brew cask install evernote
brew cask install kaleidoscope
brew cask install google-chrome
brew cask install firefox
brew cask install iterm2
brew cask install macpass
brew cask install optimal-layout
brew cask install skype
brew cask install sublime-text3
brew cask install terraform
brew cask install tower
brew cask install vagrant
brew cask install virtualbox

# Install Cloud Engineer Tools
brew install etcdctl
brew install fleetctl
curl -o /usr/local/bin/kubecfg https://storage.googleapis.com/kubernetes/darwin/kubecfg
chmod +x /usr/local/bin/kubecfg

# Install QuickLooks plugins
# Source: https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install qlprettypatch
qlmanage -r

# Configure OH-MY-ZSH
echo "Install OH-MY-ZSH"
curl -L http://install.ohmyz.sh | sh

# Configure IDE
echo "Configure Atom IDE"
sh <(curl -sSL https://github.com/sylus/atom/raw/master/install.sh)

# Configure Ruby
echo "Configure Ruby"
rbenv install 2.1.5
rbenv rehash
rbenv global 2.1.5

# Configure Ruby Gems
gem install bundler

# Dockutil
dockutil --remove 'Contacts' --allhomes
dockutil --remove 'Maps' --allhomes
dockutil --remove 'Messages' --allhomes
dockutil --remove 'FaceTime' --allhomes
dockutil --remove 'iBooks' --allhomes
dockutil --add '/Users/sylus/Applications' --view grid --display folder --before Downloads
dockutil --add '~/Documents' --view grid --display folder --before Downloads
dockutil --add '/Users/sylus/GitHub' --view grid --display folder --before Downloads
dockutil --add '~/Downloads' --view grid --display folder --replacing Downloads
dockutil --add '/Users/sylus/Applications/Google Chrome.app' --section apps
dockutil --add '/Users/sylus/Applications/Firefox.app' --section apps
dockutil --add '/Users/sylus/Applications/iTerm.app' --section apps
dockutil --add '/Users/sylus/Applications/MacPass.app' --section apps
dockutil --add '/Users/sylus/Applications/Atom.app' --section apps
dockutil --add '/Users/sylus/Applications/Tower.app' --section apps
dockutil --move 'Safari' --after Firefox
dockutil --move 'System Preferences' --after Finder

# Tidy up
brew linkapps
brew cleanup
brew prune
brew cask cleanup
