#!/bin/bash

cd /home/ubuntu/frontend-app

# Stop old container if running
docker stop frontend || true
docker rm frontend || true

# Build and run new container
docker build -t frontend .
docker run -d --name frontend -p 8080:80 frontend
