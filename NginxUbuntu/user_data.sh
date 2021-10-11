#!/bin/bash

sudo apt update

#sudo apt -y install gpm
#sudo apt -y install mc

sudo apt -y install nginx

sudo rm /var/www/html/*
sudo wget https://raw.githubusercontent.com/sandyaea/NginxUbuntu/main/index.html -O /var/www/index.html
sudo chmod 644 /var/www/html/index.html
sudo chown root:root /var/www/html/index.html

sudo wget https://raw.githubusercontent.com/sandyaea/NginxUbuntu/main/NginxDefaultBlock.conf -O /etc/nginx/sites-available/default
sudo chmod 644 /etc/nginx/sites-available/default
sudo chown root:root /etc/nginx/sites-available/default

sudo systemctl reload nginx


sudo apt -y install zsh
