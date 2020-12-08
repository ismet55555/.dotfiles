#!/bin/bash

###############################################################################
#
# NOTES: 
#
#       1. Give this script file executable rights: 
#           sudo chmod +x linux_setup_debian`
#
#       2. Run the script with amdin/sudo:
#           sudo ./linux_setup_debian
#
#   ZSH Customization
#       https://linuxhint.com/install_zsh_shell_ubuntu_1804/
#       https://github.com/romkatv/powerlevel10k
#   
#   Manual Instalations and Downloads:
#
#   Balena CLI
#       1. Download the latest release of Balena CLI from github:bash-wakatime.sh
# 	            https://github.com/balena-io/balena-cli/releases
#       2. Unzip the the .zip file
#       3. Move the the containing `balena-cli` folder into `/opt` directory using root privelages
#               - sudo su
#	            - cp -r /home/ismet/Downloads/balena-cli /opt/
#
#   Zoom Meeting
#       - https://zoom.us/download?os=linux
#       - https://support.zoom.us/hc/en-us/articles/204206269-Installing-Zoom-on-Linux
#
#   VNC Viewer
#       - https://www.realvnc.com/en/connect/download/viewer/linux/
###############################################################################


echo
echo "================================================================"
echo "|            _   _   _       _   ___ _____   _   _ ____    _   |"
echo "|   ___  ___| |_| |_(_)_ __ ( ) |_ _|_   _| | | | |  _ \  | |  |"
echo "|  / __|/ _ \ __| __| | '_ \|/   | |  | |   | | | | |_) | | |  |"
echo "|  \__ \  __/ |_| |_| | | | |    | |  | |   | |_| |  __/  |_|  |"
echo "|  |___/\___|\__|\__|_|_| |_|   |___| |_|    \___/|_|     (_)  |"
echo "|                                                              |"
echo "================================================================"
echo "System Information:"
echo "     -  Network Node Name:  $(uname -n)"
echo "     -  Machine:            $(uname -m)"
echo "     -  Processor:          $(uname -p)"
echo "     -  Hardware Platform:  $(uname -i)"
echo "     -  Operating System:   $(uname -o)"
echo "     -  Kernel Name:        $(uname -s)"
echo "     -  Kernel Release:     $(uname -r)"
echo "     -  Kernel Version:     $(uname -v)"
echo "=============================================================="
echo
echo
echo "=============== Changing Background ==================="
gsettings set org.gnome.desktop.background picture-uri ''
gsettings set org.gnome.desktop.background primary-color 'rgb(0, 0, 0)'


###############################################################################
#                        Basic Linux Update/Upgrade
###############################################################################
echo
echo "=============== Updating Repos ==================="
apt -y update
echo
echo "========= Upgrading System Packages =============="
apt -y upgrade


###############################################################################
#                        Basic Linux Update/Upgrade
###############################################################################
echo
echo "======== Instaling snap Package Manager =========="
apt -y install snapd
# Adding snap apps to system PATH enviromental variable
PATH=$PATH:/snap/bin


###############################################################################
#                       Terminal and Development Tools
###############################################################################
# git source control
echo
echo "=============== Installing: git =================="
# git Setup:
#    git config --global user.email "Ismet.Handzic@gmail.com"
#    git config --global user.name "Ismet Handzic"
#    Generate ssh key (ssh-keygen -t rsa -C "Ismet.Handzic@gmail.com")
#    Copy public SSH key (cat ~/.ssh/id_rsa.pub) to github account settings 
apt -y install git

# screen terminal multiplexer
echo
echo "============= Installing: screen ================="
apt -y install screen

# tmux terminal multiplexer
echo
echo "============== Installing: tmux =================="
apt -y install tmux

# byobu terminal multiplexer
echo
echo "============= Installing: byobu =================="
apt -y install byobu

# VIM Text Editor
echo
echo "=============== Installing: vim =================="
apt -y install vim

# Tree Fancy Command Line Directory Visualizer
echo
echo "============= Installing: tree ==================="
apt -y install tree

# xclip and xsel for copying to clipboard using CLI
echo
echo "======== Installing: xclip and xsel =============="
apt -y install xclip
apt -y install xsel

# Python Virtual Enviroments
echo
echo "======== Installing: python3-venv ================"
apt install -y python3-venv

# pip python package manager
echo
echo "============= Installing: pip3 ==================="
apt install -y python3-pip

# pip setuptools
echo
echo "=========== Installing: pip setuptools ==========="
apt install -y python3-setuptools

# AWS CLI
echo
echo "=========== Installing: AWS CLI =================="
apt -y install awscli

# boto3 AWS python wrapper
echo
echo "=============== Installing: boto3 ================"
pip3 install boto3 --user

# Visual Studio Code
echo
echo "=========== Installing: VS Code =================="
snap install --classic code

# Docker
echo
echo "=========== Installing: Docker =================="
apt -y install docker.io
systemctl start docker
systemctl enable docker
systemctl status docker

# zsh
echo
echo "================= Installing: zsh ==============="
apt-get -y install zsh

# oh-my-zsh
echo
echo "============== Installing: oh-my-zsh ============"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install Powerline command line
sudo apt -y install powerline fonts-powerline

# Install ZSH powerline 10k theme
#     https://github.com/romkatv/powerlevel10k
# NOTE: 
#  - Add "ZSH_THEME="powerlevel10k/powerlevel10k" to ~./zshrc
#  - Will take you trough the setting up powerline look
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# bat (fancy cat)
echo
echo "================ Installing: bat ================"
export BAT_VERSION="0.17.1"
wget -O bat.zip https://github.com/sharkdp/bat/releases/download/v$BAT_VERSION/bat-v$BAT_VERSION-x86_64-unknown-linux-musl.tar.gz
tar -xvzf bat.zip -C /usr/local
mv /usr/local/bat-v$BAT_VERSION-x86_64-unknown-linux-musl /usr/local/bat
alias bat='/usr/local/bat/bat'


###############################################################################
#                               Networking Tools
###############################################################################
# Networking tools
echo
echo "=========== Installing: net-tools ================"
apt -y install net-tools

# ssh interface daemon
echo
echo "=============== Installing: ssh =================="
apt install -y openssh-server

# cURL for network calls
echo
echo "============== Installing: curl =================="
apt -y install curl

# Network Device Scanning Tool ($ arp-scan -l)
echo
echo "========== Installing: arp-scan =================="
apt-get -y  install arp-scan

# Postman
echo
echo "=========== Installing: Postman =================="
snap install postman

# croc
echo
echo "============= Installing: croc =================="
curl https://getcroc.schollz.com | bash


###############################################################################
#                                 Misc Tools
###############################################################################
# Gnome Tweak Tool
echo
echo "======= Installing: gnome-tweak-tool ============="
add-apt-repository universe -y
apt -y update
apt install -y gnome-tweak-tool

# Neofetch system information
echo
echo "=========== Installing: neofetch ================="
apt install -y neofetch

# Install Node.js and npm
echo
echo "========= Installing: Node and npm ==============="
apt -y install nodejs
apt -y install npm

# Balena Etcher
echo
echo "========= Installing: Balena Etcher =================="
#  https://electronjs.org/apps/etcher
echo "deb https://deb.etcher.io stable etcher" | tee /etc/apt/sources.list.d/balena-etcher.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
apt -y update
apt-get -y install balena-etcher-electron

# bat (instead of cat)
echo
echo "============== Installing: bat =================="
wget https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb
dpkg -i bat_0.17.1_amd64.deb



###############################################################################
#                               Fun Stuff
###############################################################################
# https://gist.github.com/zlorb/4a3eff8981fcec8ca1c7
# C-Matrix 
echo
echo "=========== Installing: cmatrix =================="
apt-get -y install cmatrix

# Cow Say
echo
echo "============ Installing: cowsay =================="
apt-get -y install cowsay

# Fortune Tellings and Sayings
echo
echo "=========== Installing: fortune =================="
apt-get -y install fortune

# Large letters from normal input
echo
echo "============ Installing: figlet =================="
#  Show all figlet fonts: showfigfonts
#  Use a figlet font: figlet -f <fontname> <custom text here>
#  Don't forget to pipe!
apt-get -y install figlet


echo
echo " ______   _______  _        _______    _ ";
echo "(  __  \ (  ___  )( (    /|(  ____ \  ( )";
echo "| (  \  )| (   ) ||  \  ( || (    \/  | |";
echo "| |   ) || |   | ||   \ | || (__      | |";
echo "| |   | || |   | || (\ \) ||  __)     | |";
echo "| |   ) || |   | || | \   || (        (_)";
echo "| (__/  )| (___) || )  \  || (____/\   _ ";
echo "(______/ (_______)|/    )_)(_______/  (_)";
echo "                                         ";
echo
