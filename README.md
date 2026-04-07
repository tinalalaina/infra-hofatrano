suppression dossier: sudo rm -rf gasy-car


# Infra - Hofatrano

Ce repository contient toute la configuration d'infrastructure pour déployer **Hofatrano** sur le VPS.

### Structure
- `docker-compose.yml` : Services (PostgreSQL, Backend, Frontend, Nginx)
- `backend.env` : Variables d'environnement (secrets)
- `deploy/deploy.sh` : Script de déploiement appelé par GitHub Actions
- `nginx/conf.d/default.conf` : Configuration Nginx + Let's Encrypt

### Déploiement

```bash
cd /opt/gasy-car/infra
./deploy/deploy.sh <dockerhub_username> latest



Domaine : https://hofatrano.tina-lalaina.site
#### D. `.gitignore`

```gitignore
# Environnement
backend.env
.env

# Données
postgres_data/
static/
media/

# Logs
*.log

# Divers
.DS_Store
__pycache__/
