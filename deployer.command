#!/bin/bash

# ============================================================
# LUMIIA Times Up — Deployer v2
# Double-clic pour déployer index.html sur GitHub Pages
# ============================================================

REPO_DIR="/Users/emmanuelexbrayat/Dropbox/DB LUMIIA 2025/Outils APP Claude/TimesUP"
REMOTE="https://github.com/i-immersion/lumiia-timesup.git"

cd "$REPO_DIR" || { echo "Dossier introuvable"; read -p "Entrée pour fermer..."; exit 1; }

echo "📁 $REPO_DIR"
echo ""

if [ ! -f "index.html" ]; then
  echo "index.html introuvable"; read -p "Entrée pour fermer..."; exit 1
fi

# Toujours repartir d'un git propre
rm -rf .git
git init -b main
git remote add origin "$REMOTE"

git add -A
git commit -m "deploy $(date '+%Y-%m-%d %H:%M')"

echo "🚀 Push..."
git push origin main --force

echo ""
echo "✅ Déployé ! https://i-immersion.github.io/lumiia-timesup/"
echo ""
read -p "Entrée pour fermer..."
