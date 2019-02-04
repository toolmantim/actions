#!/bin/bash

set -euo pipefail

if [[ -z "${BUILDKITE_API_ACCESS_TOKEN:-}" ]]; then
  echo "You must set the BUILDKITE_API_ACCESS_TOKEN environment variable (e.g. BUILDKITE_API_ACCESS_TOKEN = \"xyz\")"
  exit 1
fi

if [[ -z "${BUILDKITE_PIPELINE:-}" ]]; then
  echo "You must set the BUILDKITE_PIPELINE environment variable (e.g. BUILDKITE_PIPELINE = \"my-org/my-pipeline\")"
  exit 1
fi

ORG_SLUG=$(echo "${BUILDKITE_PIPELINE}" | cut -d'/' -f1)
PIPELINE_SLUG=$(echo "${BUILDKITE_PIPELINE}" | cut -d'/' -f2)
COMMIT="${BUILDKITE_COMMIT:-${GITHUB_SHA}}"
BRANCH="${BUILDKITE_BRANCH:-${GITHUB_REF#"refs/heads/"}}"
MESSAGE="${BUILDKITE_MESSAGE:-}"

NAME=$(jq ".pusher.name" "$GITHUB_EVENT_PATH")
EMAIL=$(jq ".pusher.email" "$GITHUB_EVENT_PATH")

# Use jq’s --arg properly escapes string values for us
JSON=$(
  jq -n \
    --arg COMMIT  "$COMMIT" \
    --arg BRANCH  "$BRANCH" \
    --arg MESSAGE "$MESSAGE" \
    --arg NAME    "$NAME" \
    --arg EMAIL   "$EMAIL" \
    '{
      "commit": $COMMIT,
      "branch": $BRANCH,
      "message": $MESSAGE,
      "author": {
        "name": $NAME,
        "email": $EMAIL
      }
    }'
)

RESPONSE=$(
  curl \
    -X POST \
    -H "Authorization: Bearer ${BUILDKITE_API_ACCESS_TOKEN}" \
    "https://api.buildkite.com/v2/organizations/${ORG_SLUG}/pipelines/${PIPELINE_SLUG}/builds" \
    -d "$JSON"
)

echo "Created build:"
echo "$RESPONSE" | jq ".web_url"