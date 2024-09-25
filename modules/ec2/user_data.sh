#!/bin/bash

sudo snap install amazon-ssm-agent --classic
sudo systemctl enable snap.amazon-ssm-agent.amazon-ssm-agent.service
sudo systemctl start snap.amazon-ssm-agent.amazon-ssm-agent.service

git clone https://github.com/aws-deepracer-community/deepracer-for-cloud.git /home/ubuntu/deepracer-for-cloud
cd /home/ubuntu/deepracer-for-cloud && ./bin/prepare.sh
