#!/bin/bash

echo "Creating network..."
sudo docker network create --subnet=172.20.0.0/16 main > /dev/null

echo "Creating docker user..."
sudo useradd docker > /dev/null
sudo passwd docker

echo "Adding docker user to the denied user of ssh..."
echo "DenyUsers docker" >> /etc/ssh/sshd_config

echo "Please restart the ssh service with 'sudo service ssh restart' or 'sudo systemctl restart ssh'"

