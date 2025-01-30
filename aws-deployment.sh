# Launch Script (launch.sh)
#!/bin/bash
cd /home/ubuntu/twitter-discord-bot
source venv/bin/activate
python bot.py

# Systemd Service File (discord-bot.service)
[Unit]
Description=Discord Twitter Monitor Bot
After=network.target

[Service]
Type=simple
User=ubuntu
WorkingDirectory=/home/ubuntu/twitter-discord-bot
Environment=PATH=/home/ubuntu/twitter-discord-bot/venv/bin
ExecStart=/home/ubuntu/twitter-discord-bot/venv/bin/python bot.py
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target

# Requirements File (requirements.txt)
discord.py==2.3.2
tweepy==4.14.0
python-dotenv==1.0.0
