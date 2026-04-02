# Deploy VPS

Ce dossier contient le script appelé par GitHub Actions pour déployer la version fraîchement buildée.

## Pré-requis VPS
- Docker + Docker Compose installés
- Dossier `/opt/gasy-car/infra` contenant ce repo (ou copie des fichiers infra)
- Fichier `/opt/gasy-car/backend.env` pour les variables Django
- Certificats TLS disponibles dans `/etc/letsencrypt`

## Script
```bash
/opt/gasy-car/infra/deploy/deploy.sh <dockerhub_username> <image_tag>
```

Le script:
1. exporte `DOCKERHUB_USERNAME` et `IMAGE_TAG`
2. fait `docker compose pull`
3. redémarre en `up -d --remove-orphans`
