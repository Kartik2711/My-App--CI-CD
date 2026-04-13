#!/bin/bash

set -e  # stop on error

cd /home/ec2-user/my-git-project

echo "📥 Pull latest code"
git pull origin main

echo "🐍 Setup virtual environment"
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

source venv/bin/activate

echo "📦 Install dependencies"
pip install -r requirements.txt

echo "🛑 Stop old app"
pkill -f app.py || true

echo "🚀 Start Flask app"
nohup python3 app.py > output.log 2>&1 &

echo "✅ Deployment completed"