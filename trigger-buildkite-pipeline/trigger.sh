#!/bin/bash

set -euo pipefail

if [[ -z "${BUILDKITE_API_ACCESS_TOKEN:-}" ]]; then
  echo "You must set the BUILDKITE_API_ACCESS_TOKEN environment variable (e.g. BUILDKITE_API_ACCESS_TOKEN = \"xyz\")"
  exit 1
fi

if [[ -z "${PIPELINE:-}" ]]; then
  echo "You must set the BUILDKITE_PIPELINE environment variable (e.g. BUILDKITE_PIPELINE = \"my-org/my-pipeline\")"
  exit 1
fi

ORG_SLUG=$(echo "${BUILDKITE_PIPELINE}" | cut -d'/' -f1)
PIPELINE_SLUG=$(echo "${BUILDKITE_PIPELINE}" | cut -d'/' -f2)
COMMIT="${BUILDKITE_COMMIT:-${GITHUB_SHA}}"
BRANCH="${BUILDKITE_BRANCH:-${GITHUB_REF#"refs/heads/"}}"

curl \
  -X POST \
  -H "Authorization: Bearer ${BUILDKITE_API_ACCESS_TOKEN}" \
  "https://api.buildkite.com/v2/organizations/${ORG_SLUG}/pipelines/${PIPELINE_SLUG}/builds" \
  -d @- << JSON
{
  "commit": "${COMMIT}",
  "branch": "${BRANCH}"
}
JSON