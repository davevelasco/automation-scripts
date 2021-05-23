# automation-scripts
A collection of automation scripts I personally use

## `install-docker-ubuntu.sh`
A bash script to install the latest stable version of Docker from the official Docker repository on Ubuntu.
It also installs the latest version of Compose, adds user to Docker group, and enables Docker to boot on startup.
Based on the installation guides from [here](https://docs.docker.com/engine/install/ubuntu/) and [here](https://docs.docker.com/compose/install/).

    $ sudo chmod +x install-docker-ubuntu.sh
    $ sudo ./install-docker-ubuntu.sh
