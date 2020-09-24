#!/usr/bin/env bash
set -euo pipefail

webhook_url="$1"
shift
messages="$*"

# each argument passed to the script becomes a newline
# outputs valid JSON that can be used as payload for the Twist API
json=$(ruby -rjson -e 'puts JSON.generate({ content: ARGV.join("\n") })' "$messages")

echo "$json"
