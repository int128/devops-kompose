# Base domain
DEVOPS_DOMAIN="devops.example.com"

# PostgreSQL host
DEVOPS_POSTGRES_HOST="xxx.xxx.us-west-2.rds.amazonaws.com"

# Include .env if it exists
if [ -f .env ]; then
  source .env
fi
