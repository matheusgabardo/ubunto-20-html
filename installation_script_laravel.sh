#!/bin/bash

red=tput setaf 1
green=tput setaf 2
yellow=tput setaf 3
blue=tput setaf 4
reset=tput sgr0

echo "${yellow}Starting...${reset}"
echo ""

echo "${green}[1/2] Installing APACHE${reset}"
echo ""
sudo apt-get update
sudo apt-get install apache2 -y 

echo "${green}[2/2] Setting up your HTML files${reset}"
echo ""
sudo rm -rf /var/www/html/*
echo "${yellow}[QUESTION] Type the path to your HTML directory:${reset}"
read htmlDirectory
sudo cp -R $htmlDirectory/* /var/www/html/

echo "${green}Finish${reset}"
