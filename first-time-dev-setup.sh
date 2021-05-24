#!/bin/bash

echo Full system update and upgrade..
sudo apt update
sudo apt upgrade

# Install dev-related packages
echo Installing dev-related packages..

sudo apt install build-essential git -y

# Install VSCodium
echo -n "Install VSCodium? (Y/n) : "
read choice

if [[ $choice != "n" ]] && [[ $choice != "N" ]]; then
  . ./install-vscodium-ubuntu.sh
fi

# Generate SHS key
echo -n "Create SHS key and add to SHS-agent? (Y/n) : "
read choice

if [[ $choice != "n" ]] && [[ $choice != "N" ]]; then
  . ./create-ssh-key.sh
fi

# Set up Git
echo -n "Setup Git? (Y/n) : "
read choice

if [[ $choice != "n" ]] && [[ $choice != "N" ]]; then
  . ./setup-git.sh
fi
