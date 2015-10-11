#!/bin/sh
echo Manually install App Store apps first!
# no solution to automate AppStore installs
read -p "Press any key to continue... " -n1 -s
echo  '\n'

# Install Homebrew and Cask
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask

# Install apps with Cask
# export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# brew cask install dropbox
# brew cask install firefox
# brew cask install google-chrome
# brew cask install google-drive
# brew cask install spotify
# brew cask install sourcetree
# brew cask install sublime-text3
# brew cask install virtualbox
# brew cask install vlc
# brew cask install webstorm

# Install GPG which is dep of RVM
brew install gnupg gnupg2

# Install RVM
\curl -sSL https://get.rvm.io | bash

# Install Node, NPM, and global packages
brew install node
npm install -g bower
npm install -g http-server
npm install -g grunt-cli
npm install -g express-generator

# Create dotfile symlinks in ~/
./symlink-setup.sh

# Clean up
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*