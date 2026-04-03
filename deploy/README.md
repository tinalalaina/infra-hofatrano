# Deploy VPS

Ce dossier contient le script appelé par GitHub Actions pour déployer la version fraîchement buildée.

## Pré-requis VPS
- Docker + Docker Compose installés
- Dossier `/opt/gasy-car/infra` contenant ce repo (ou copie des fichiers infra)
- Fichier `/opt/gasy-car/backend.env` pour les variables Django
- Certificats TLS disponibles dans `/etc/letsencrypt`
- Sous-domaine configuré: `hofatrano.tina-lalaina.site` (A/AAAA vers le VPS)

## Script
```bash
/opt/gasy-car/infra/deploy/deploy.sh <dockerhub_username> <image_tag>
```

Le script:
1. exporte `DOCKERHUB_USERNAME` et `IMAGE_TAG`
2. fait `docker compose pull`
3. redémarre en `up -d --remove-orphans`


## Configuration Nginx
- Vérifier que `infra/nginx/conf.d/default.conf` contient le bon `server_name` et les chemins TLS réels (ex: `/etc/letsencrypt/live/tina-lalaina.site/fullchain.pem`).

## Variables recommandées

Dans `/opt/gasy-car/backend.env`:

```env
DJANGO_ALLOWED_HOSTS=hofatrano.tina-lalaina.site,localhost,127.0.0.1
CORS_ALLOWED_ORIGINS=https://hofatrano.tina-lalaina.site,http://localhost:5173,http://127.0.0.1:5173
CSRF_TRUSTED_ORIGINS=https://hofatrano.tina-lalaina.site,http://localhost:5173,http://127.0.0.1:5173
```

Pour l'image frontend, builder avec:

```bash
--build-arg VITE_API_URL=https://hofatrano.tina-lalaina.site/api
```
