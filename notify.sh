#!/usr/bin/env bash
set -euo pipefail

# each argument passed to the script becomes a newline
# outputs valid JSON that can be used as payload for the Twist API
json=$(ruby -rjson -e 'puts JSON.generate({ content: ARGV.join("\n") })' "$MESSAGE")

curl --silent \
  --retry 3 \
  --max-time 15 \
  --request POST \
  --header 'Content-type: application/json' \
  --data "$json" \
  "$WEBHOOK_URL"
