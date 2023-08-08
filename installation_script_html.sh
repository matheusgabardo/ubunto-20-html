#!/bin/bash

green=tput setaf 2
yellow=tput setaf 3
blue=tput setaf 4
reset=tput sgr0

echo "${yellow}Starting...${reset}"
echo ""

echo "${green}[1/3] Installing APACHE${reset}"
echo ""
sudo apt-get update
sudo apt-get install apache2 -y 

echo "${green}[X/X] Generating SSH Key and Adding to SSH-Agent${reset}"
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
echo "${blue}SSH key generated. Please add the following public key to your GitHub account:${reset}"
cat ~/.ssh/id_rsa.pub
echo "${yellow}[QUESTION] Type 'YES' if you did that:${reset}"
read answer

echo "${green}[2/3] Cloning the repository and setting up your HTML files${reset}"
echo ""
sudo rm -rf /var/www/html/*
echo "${yellow}[QUESTION] Type the Git repository URL:${reset}"
read gitRepository
echo "${yellow}[QUESTION] Type the relative path to your HTML directory inside the repository:${reset}"
read htmlDirectory
sudo git clone $gitRepository /tmp/repo
sudo cp -R /tmp/repo/$htmlDirectory/* /var/www/html/
sudo rm -rf /tmp/repo

echo "${green}[3/3] Finish${reset}"

