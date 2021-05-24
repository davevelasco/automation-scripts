#!/bin/sh

# Check if VS Code is installed
echo "Checking if VS Code is installed.."
code_installed=$(which code)

if [ -z $code_installed ]
then
  echo "Downloading VS Code.."
  curl -o code.deb -L http://go.microsoft.com/fwlink/?LinkID=760868
  echo "Installing VS Code.."
  sudo dpkg -i code.deb
  echo "Cleaning up.."
  rm code.deb
else
  echo "VS Code is already installed!"
fi
