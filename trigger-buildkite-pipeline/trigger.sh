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

BUILDKITE_ORG_SLUG=$(echo "${BUILDKITE_PIPELINE}" | cut -d'/' -f1)
BUILDKITE_PIPELINE_SLUG=$(echo "${BUILDKITE_PIPELINE}" | cut -d'/' -f2)

BRANCH="${GITHUB_REF#"refs/heads/"}"

curl \
  -X POST \
  -H "Authorization: Bearer ${BUILDKITE_API_ACCESS_TOKEN}" \
  "https://api.buildkite.com/v2/organizations/${BUILDKITE_ORG_SLUG}/pipelines/${BUILDKITE_PIPELINE_SLUG}/builds" \
  -d @- << JSON
{
  "message": "Test",
  "commit": "${GITHUB_SHA}",
  "branch": "${BRANCH}"
}
JSON