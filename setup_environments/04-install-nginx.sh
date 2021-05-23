#!/usr/bin/env bash

echo "=> Installing Nginx..."
sudo apt-get -y install nginx


echo "=> Disable Nginx on startup ... we will be managing it via Supervisor"
sudo service nginx stop
sudo systemctl disable nginx
