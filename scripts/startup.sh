#!/usr/bin/env bash

set -euo pipefail
docker compose up -d
echo
echo "To view logs: docker logs -f pg-analytics"
