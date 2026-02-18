#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${1:-http://localhost:8000}"
HEALTH_URL="${BASE_URL}/health"

STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$HEALTH_URL")

if [ "$STATUS_CODE" = "200" ]; then
  echo "SMOKE_OK: ${HEALTH_URL}"
  exit 0
fi

echo "SMOKE_FAIL: status=${STATUS_CODE}"
exit 1
