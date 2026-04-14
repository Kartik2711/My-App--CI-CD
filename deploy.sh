#!/bin/bash

set -e

cd /home/ec2-user/myapp   # MUST match appspec.yml

echo "📦 Install dependencies"
pip3 install -r requirements.txt

echo "🛑 Stop old app"
pkill -f app.py || true

echo "🚀 Start Flask app"
nohup python3 app.py > output.log 2>&1 &

echo "✅ Deployment completed"