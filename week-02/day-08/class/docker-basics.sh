#!/usr/bin/env bash
set -euo pipefail

CONTAINER="day08-demo"

# Verify Docker is available
docker --version
docker info > /dev/null

# Pull a lightweight image
docker pull alpine:latest

# Create and start a container
docker run -d --name "$CONTAINER" alpine:latest sleep 300

# List containers and images
docker ps
docker ps -a
docker images

# Inspect the running container
docker inspect "$CONTAINER"

# Stop and remove the container
docker stop "$CONTAINER"
docker rm "$CONTAINER"

echo "Docker basics completed."
