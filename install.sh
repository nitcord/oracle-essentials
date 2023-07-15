#!/bin/bash

echo "Starting installation.."
sleep 3

echo "Configuring updates.."
sleep 2
sudo apt update
sleep 3

echo "Configuring iptables.."
sleep 2
sudo systemctl stop iptables
sudo systemctl disable iptables
sudo iptables -F
sudo iptables -X
sudo iptables -Z
sudo iptables -P INPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -P OUTPUT ACCEPT
sleep 3

echo "Configuring ufw.."
sleep 2
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
sleep 3

echo "Installing neofetch.."
sleep 2
sudo apt-get install neofetch -y
sleep 3
neofetch
sleep 2

echo "Installation has been successfully completed!"
