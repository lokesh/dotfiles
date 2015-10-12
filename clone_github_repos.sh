#!/bin/bash

NORMAL=$(tput sgr0)
YELLOW=$(tput setaf 190)
BLUE=$(tput setaf 153)

# Clone Github repos
echo "\n${YELLOW}This script will clone the Github repos which you own and put them in ~/git${NORMAL}"
echo "\n${BLUE}Enter your Github username:${NORMAL}"
read username

echo "\n${BLUE}Generate a personal access token (https://github.com/settings/tokens) and paste in:${NORMAL}"
read token

echo "\n${YELLOW}Cloning repos${NORMAL}"
mkdir ~/git
cd ~/git
curl -u ${username}:${token} https://api.github.com/user/repos?type=owner | ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each { |repo| %x[git clone #{repo["ssh_url"]} ]}'
