#!/bin/sh

# Check if VSCodium is installed
codium_installed=$(which codium)

if [ -z $codium_installed ]
then
  echo Installing VSCodium...
  wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/vscodium.gpg
  echo 'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
  sudo apt update && sudo apt install codium -y
else
  echo "VSCodium is already installed!"
fi
