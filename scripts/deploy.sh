#!/bin/bash

cd /home/ubuntu/codedeploy-ttt

# Login to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 403135539729.dkr.ecr.us-east-1.amazonaws.com

# Pull latest images
docker pull 403135539729.dkr.ecr.us-east-1.amazonaws.com/ttt:latest
docker pull 403135539729.dkr.ecr.us-east-1.amazonaws.com/cicd:latest

# Run containers
sudo docker compose down || true
sudo docker compose up -d
