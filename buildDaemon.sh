#!/bin/bash
# Fetch the latest changes from the remote repository
echo "Fetching latest changes..."
git fetch

# Reset the local master branch to match origin/master
echo "Resetting local branch to origin/master..."
git reset --hard origin/master

# Build and run your containers with Docker Compose
echo "Building and starting containers..."
docker-compose up --build
