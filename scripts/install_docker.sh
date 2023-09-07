#!/bin/bash

# This script installs Docker

echo "Updating package list..."
sudo apt-get update > /dev/null

echo "Installing required packages..."
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg > /dev/null

echo "Downloading Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg > /dev/null

echo "Adding Docker repository to sources.list.d..."
sudo install -m 0755 -d /etc/apt/keyrings > /dev/null
echo " deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(cat /etc/os-release | grep VERSION_CODENAME | cut -d '=' -f2-) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Updating package list again..."
sudo apt-get update > /dev/null

echo "Installing Docker CE, CLI, and plugins..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin > /dev/null

echo "Installation completed."