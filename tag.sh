#!/bin/bash

# Check if environment is passed as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 {dev|staging|production}"
  exit 1
fi

# Set the image tag based on the environment
case "$1" in
  dev)
    export IMAGE_TAG="dev-latest"
    ;;
  staging)
    export IMAGE_TAG="staging-latest"
    ;;
  production)
    export IMAGE_TAG="prod-latest"
    ;;
  *)
    echo "Unknown environment: $1"
    exit 1
    ;;
esac

# Substitute variables and apply the configuration
envsubst < deploy.template.yaml > onTestingDeploy.yaml
# kubectl apply -f deploy.yaml
