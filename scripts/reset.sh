#!/usr/bin/env bash

set -euo pipefail

echo "Resetting database (will remove all data)"
docker compose down -v
docker compose up -d
echo "Database reset complete"
