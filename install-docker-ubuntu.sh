#!/bin/bash

# Uninstall old versions
sudo apt remove docker docker-engine docker.io containerd runc -y

# Install the Docker stable repository
sudo apt update

sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y

# Install latest version of Compose
# Get latest tag

latest=`curl -s https://api.github.com/repos/docker/compose/releases/latest \
| grep -w "browser_download_url.*docker-compose-$(uname -s)-$(uname -m)\"" \
| cut -d : -f 2,3 | tr -d \"`

sudo curl -L $latest -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
