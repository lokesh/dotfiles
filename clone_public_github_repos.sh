#!/bin/bash

NORMAL=$(tput sgr0)
YELLOW=$(tput setaf 190)
BLUE=$(tput setaf 153)

# Clone public repos
echo "\n${YELLOW}This script will clone your public repos. Private repos will NOT be cloned.${NORMAL}"
echo "\n${BLUE}Enter your Github username:${NORMAL}"
read username

echo "\n${YELLOW}Cloning repos${NORMAL}"
cd ~/git
curl -s https://api.github.com/users/${username}/repos?per_page=200 | ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each { |repo| %x[git clone #{repo["ssh_url"]} ]}'

echo "\n${YELLOW}Don't forget to clone your private repos.${NORMAL}"