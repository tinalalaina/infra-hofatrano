#!/bin/bash
set -e

DOCKERHUB_USERNAME=$1
IMAGE_TAG=${2:-latest}

if [ -z "$DOCKERHUB_USERNAME" ]; then
  echo "❌ Usage: $0 <dockerhub_username> [image_tag]"
  exit 1
fi

echo "🚀 Déploiement Hofatrano - ${DOCKERHUB_USERNAME} (tag: ${IMAGE_TAG})"

cd /opt/gasy-car/infra

export DOCKERHUB_USERNAME=$DOCKERHUB_USERNAME
export IMAGE_TAG=$IMAGE_TAG

docker compose pull
docker compose up -d --remove-orphans

echo "🔄 Exécution des migrations..."
docker compose exec -T backend python manage.py migrate --noinput || echo "⚠️ Migrations skipped"

echo "📦 Collecte des fichiers static..."
docker compose exec -T backend python manage.py collectstatic --noinput --clear || echo "⚠️ Collectstatic skipped"

echo "✅ Déploiement terminé avec succès !"
