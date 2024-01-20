#/!usr/bin/env bash
set -euo pipefail

# Name of the Docker image
IMAGE_NAME="ocaml-playground"

echo "Building Docker image for OCaml project..."
docker build -t $IMAGE_NAME .

if [ $? -eq 0 ]; then
    echo "Successfully built Docker image."
    echo "Running tests in Docker container..."

    # Run the Docker container
    docker run --rm $IMAGE_NAME
else
    echo "Failed to build Docker image."
fi
