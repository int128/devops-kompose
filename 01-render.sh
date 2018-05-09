#!/bin/bash
set -e
set -o pipefail
set -x

# Base domain
DEVOPS_DOMAIN="devops.example.com"

# PostgreSQL host
DEVOPS_POSTGRES_HOST="xxx.xxx.us-west-2.rds.amazonaws.com"

# Include .env if it exists
if [ -f .env ]; then
  source .env
fi

# Replace variables in YAMLs
for f in */*.yaml; do
  sed -i '' \
    -e "s/{DEVOPS_DOMAIN}/${DEVOPS_DOMAIN}/g" \
    -e "s/{DEVOPS_POSTGRES_HOST}/${DEVOPS_POSTGRES_HOST}/g" \
    "$f"
done
