#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <dockerhub_username> <image_tag>"
  exit 1
fi

DOCKERHUB_USERNAME="$1"
IMAGE_TAG="$2"
PROJECT_DIR="/opt/gasy-car/infra"

cd "$PROJECT_DIR"

export DOCKERHUB_USERNAME
export IMAGE_TAG

docker compose -f docker-compose.prod.yml pull

docker compose -f docker-compose.prod.yml up -d --remove-orphans
