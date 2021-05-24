#!/bin/bash

# Check for existing SHS keys
DIR="$HOME/.ssh"

if [ -d "$DIR" ] && [ "$(ls -A $DIR)" ]
then
  echo -n "SSH key exists, continue adding? (y/N) : "
  read choice
  if [[ $choice != "y" ]] && [[ $choice != "Y" ]]; then
    exit 1;
  fi
fi

# Generate SSH keys
echo Creating SSH key..
echo -n "Enter email : "
read email
ssh-keygen -t ed25519 -C "$email"

# Add SSH key to the ssh-agent
echo Adding SSH key to ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy public SSH key to clipboard
echo -n "Copy SSH key to clipboard (will install xclip)? (Y/n) : "
read choice

if [[ $choice != "n" ]] && [[ $choice != "N" ]]; then
  xclip_installed=$(which xclip)

  if [ -z $xclip_installed ]; then
    sudo apt install xclip -y
  fi

  xclip -selection clipboard < "$DIR/id_ed25519.pub"
  echo "Public SSH key copied to clipboard! Try adding to GitHub or something."
fi
