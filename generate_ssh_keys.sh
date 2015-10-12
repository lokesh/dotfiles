#!/bin/bash

NORMAL=$(tput sgr0)
YELLOW=$(tput setaf 190)
BLUE=$(tput setaf 153)

# Abort if SSH key files already exists.
if [ -f ~/.ssh/id_rsa ]; then
    echo "\n.ssh/id_rsa already exists. {YELLOW}Aborting.${NORMAL}"
    exit 1
fi

if [ -f ~/.ssh/id_rsa.pub ]; then
    echo "\n.ssh/id_rsa.pub already exists. {YELLOW}Aborting.${NORMAL}"
    exit 1
fi

# Switch to .ssh folder
cd ~/
mkdir .ssh
cd .ssh

# Generate SSH Key
echo "\n${YELLOW}Generating SSH Key${NORMAL}"
echo "\n${BLUE}Enter your Github email address:${NORMAL}"
read email
ssh-keygen -t rsa -b 4096 -C "${email}"

# Add key to the ssh-agent
# https://help.github.com/articles/generating-ssh-keys/#step-3-add-your-key-to-the-ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

echo "\n${YELLOW}SSH Key copied to clipboard. Now go add it to your account on github.com. Once you've done that, press enter.${NORMAL}"
pbcopy < ~/.ssh/id_rsa.pub
read

# Test Github connection
echo "\n${YELLOW}Testing connection to Github.${NORMAL}"
ssh -T git@github.com
