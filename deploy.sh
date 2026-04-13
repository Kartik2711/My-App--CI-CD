#!/bin/bash

cd /home/ec2-user/my-git-project

echo "Pull latest code"
git pull origin main

echo "Activate venv"
source venv/bin/activate

echo "Install dependencies"
pip install -r requirements.txt

echo "Stop old app"
pkill -f app.py

echo "Start app"
nohup python3 app.py > output.log 2>&1 &