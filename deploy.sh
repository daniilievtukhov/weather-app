#!/bin/bash


IMAGE_NAME="my-node-app"
CONTAINER_NAME="my-node-container"


docker build -t $IMAGE_NAME .


if [ $? -ne 0 ]; then
    echo "Error: Failed to build Docker-образ."
    exit 1
fi

docker run -d -p 3000:3000 --name $CONTAINER_NAME $IMAGE_NAME

if [ $? -ne 0 ]; then
    echo "Error: Failed to start Docker container."
    exit 1
fi

echo "The application has been successfully deployed and is available at http://localhost:3000"
