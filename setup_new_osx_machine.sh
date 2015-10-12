# #!/bin/sh

# Options -----------------

install_brew=false
install_cask=false
install_cask_apps=false
install_rvm=false
install_node=false
install_npm_global_package=false
configure_git_globals=false
set_osx_preferences=false
create_dotfile_symlinks=false

# -------------------------

NORMAL=$(tput sgr0)
YELLOW=$(tput setaf 190)
BLUE=$(tput setaf 153)

# Install Homebrew
if [ "$install_brew" = true ]; then
	echo "\n${YELLOW}Installing Homebrew${NORMAL}"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew cleanup --force
	rm -f -r /Library/Caches/Homebrew/*
fi

# Install Cask
if [ "$install_cask" = true ]; then
	echo "\n${YELLOW}Installing Cask${NORMAL}"
	brew install caskroom/cask/brew-cask
fi

# Install apps with Cask
if [ "$install_cask_apps" = true ]; then
	echo "\n${YELLOW}Installing Cask apps${NORMAL}"
	echo "\nManually install App Store apps first! Ctrl-C if you haven't. Press enter to continue."
	read okay
	export HOMEBREW_CASK_OPTS="--appdir=/Applications"
	brew cask install dropbox
	brew cask install firefox
	brew cask install google-chrome
	brew cask install google-drive
	brew cask install spectacle
	brew cask install spotify
	brew cask install sourcetree
	brew cask install sublime-text3
	brew cask install virtualbox
	brew cask install vlc
	brew cask install webstorm
fi


# Install RVM and its deps
if [ "$install_rvm" = true ]; then
	brew install gnupg gnupg2
	\curl -sSL https://get.rvm.io | bash
fi

 # Install Node and NPM
if [ "$install_node" = true ]; then
	echo "\n${YELLOW}Installing Node and NPM${NORMAL}"
	brew install node
fi

 # Install NPM global packages
if [ "$install_npm_global_packages" = true ]; then
	echo "\n${YELLOW}Installing NPM global packages${NORMAL}"
	sudo npm install -g bower
	sudo npm install -g http-server
	sudo npm install -g grunt-cli
	sudo npm install -g express-generator
fi

# Configure git
if [ "$configure_git_globals" = true ]; then
	echo "\n${YELLOW}Configuring Git${NORMAL}"
	git_user_name="$(git config --get user.name)"
	if [[ -z "$git_user_name" ]]; then
		update_git_user_name='y'
	else
		echo "Your git user name is ${BLUE}${git_user_name}${NORMAL}. Change? [y/N]"
		read update_git_user_name
	fi

	if echo "$update_git_user_name" | grep -iq "^y" ;then
		echo "${BLUE}Enter value for git user.name (ex 'Jenny House'):${NORMAL}"
		read git_user_name
		git config --global user.name "${git_user_name}"
	fi

	git_user_email="$(git config --get user.email)"
	if [[ -z "$git_user_email" ]]; then
		update_git_user_email='y'
	else
		echo "Your git user email is ${BLUE}${git_user_email}${NORMAL}. Change? [y/N]"
		read update_git_user_email
	fi

	if echo "$update_git_user_email" | grep -iq "^y" ;then
		echo "${BLUE}Enter value for git user.email (ex 'jenny.house@gmail.com'):${NORMAL}"
		read git_user_email
		git config --global user.email "${git_user_email}"    
	fi
fi

# Create dotfile symlinks in ~/
if [ "$create_dotfile_symlinks" = true ]; then
	echo "\n${YELLOW}Creating dotfile symlinks in ~/${NORMAL}"
	sh _create_dotfile_symlinks.sh
fi

# Set OSX preferences
if [ "$set_osx_preferences" = true ]; then
	echo "\n${YELLOW}Setting OSX preferences${NORMAL}"
	sh _set_osx_preferences.sh
fi

# Clean up
if [ "$install_brew" = true ]; then
	brew cleanup --force
	rm -f -r /Library/Caches/Homebrew/*
fi
