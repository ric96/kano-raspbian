#!/bin/bash

sudo echo "deb http://dev.kano.me/archive/ release main" > /etc/apt/sources.list.d/kano.list
wget http://dev.kano.me/archive/repo.gpg.key
sudo /user/bin/apt-key add repo.gpg.key
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install gnome-panel-control kano-blocks kano-credits kano-desktop kano-extras kano-test kano-themes kano-unlocker kano-vnc kdesk kano-feedback kano-fonts kano-init kano-motd kano-profile kano-settings kano-toolset kano-updater kano-youtube make-minecraft make-music make-pong make-snake openbox-dev openbox xterm -y
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo pip install python-slugify
sudo pip install requests
sudo pip install pam
echo "Installation Copleted"
