#!/usr/bin/env bash
set -euo pipefail

if [ -z "${TWIST_WEBHOOK_URL:-}" ]
then
  >&2 echo "Failure: env var TWIST_WEBHOOK_URL must be present"
  exit 1
fi

# each argument passed to the script becomes a newline
# outputs valid JSON that can be used as payload for the Twist API
json=$(ruby -rjson -e 'puts JSON.generate({ content: ARGV.join("\n") })' "$MESSAGE")

curl --silent \
  --retry 3 \
  --max-time 15 \
  --request POST \
  --header 'Content-type: application/json' \
  --data "$json" \
  "$TWIST_WEBHOOK_URL"
