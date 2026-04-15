#!/bin/bash

cd /home/ec2-user/My-App--CI-CD

echo "Installing dependencies"
pip3 install -r requirements.txt

echo "Stopping old app"
pkill -f app.py || true

echo "Starting new app"
nohup python3 app.py > output.log 2>&1 &