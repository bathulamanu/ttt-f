#!/bin/bash

cd /home/ubuntu/ttt-app

# Login to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 403135539729.dkr.ecr.us-east-1.amazonaws.com

# Pull latest images
docker pull 403135539729.dkr.ecr.us-east-1.amazonaws.com/ttt-backend:latest
docker pull 403135539729.dkr.ecr.us-east-1.amazonaws.com/ttt-frontend:latest

# Run containers
docker compose down || true
docker compose up -d
