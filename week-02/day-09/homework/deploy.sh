#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

# Start NGINX
docker run -d --name bootcamp-web -p 9999:80 nginx

# Copy website into container
docker cp bootcamp-web/. bootcamp-web:/usr/share/nginx/html/

# Verify deployed files
docker exec bootcamp-web ls /usr/share/nginx/html

echo "Website available at http://localhost:9999"
