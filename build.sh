#!/usr/bin/env bash
# Sammelt die statische Seite in dist/ (wird vom GitHub-Workflow aufgerufen).
set -euo pipefail
cd "$(dirname "$0")"

rm -rf dist
mkdir -p dist/node_modules/bootstrap-icons/font dist/node_modules/bootstrap/dist/js

cp index.html dist/
cp -r css font img dist/
rm -f dist/css/*.map

# Nur die Dateien aus node_modules, die index.html wirklich lädt
cp -r node_modules/bootstrap-icons/font/bootstrap-icons.min.css node_modules/bootstrap-icons/font/fonts \
      dist/node_modules/bootstrap-icons/font/
cp node_modules/bootstrap/dist/js/bootstrap.js dist/node_modules/bootstrap/dist/js/

echo "Built dist/ ($(du -sh dist | cut -f1))"
