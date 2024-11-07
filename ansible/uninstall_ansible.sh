#!/bin/bash
set -e

if [ -f /etc/os-release ]; then
    . /etc/os-release
fi

if [ $ID == "ubuntu" ] || [ $ID == "debian" ]; then
    sudo add-apt-repository --yes -r ppa:ansible/ansible
    sudo apt-get purge ansible --yes
    sudo apt-get autoremove --yes
elif [ $ID == "centos" ] || [ $ID == "rhel" ]; then
    sudo yum remove -y ansible epel-release
fi
