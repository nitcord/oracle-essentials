#!/bin/bash

echo "Starting installation.."

echo "Configuring updates.."
sudo apt update

echo "Configuring iptables.."
sudo systemctl stop iptables
sudo systemctl disable iptables
sudo iptables -F
sudo iptables -X
sudo iptables -Z
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT

echo "Configuring ufw.."
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable

echo "Installing neofetch.."
sudo apt-get install neofetch -y
neofetch

echo "Installation has been successfully completed!"
