#!/bin/bash

APP_NAME="ttt-app"
ECR_REPO="403135539729.dkr.ecr.us-east-1.amazonaws.com/ttt"
PORT=3000

echo "Stopping existing container..."
docker stop $APP_NAME || true
docker rm $APP_NAME || true

echo "Logging in to ECR..."
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_REPO

echo "Pulling latest image..."
docker pull $ECR_REPO:latest

echo "Starting new container..."
docker run -d --name $APP_NAME -p $PORT:3000 $ECR_REPO:latest
