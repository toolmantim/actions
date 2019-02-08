#!/bin/bash
set -euo pipefail

export BUILDKITE_AGENT_NAME="${NAME:-github-action-%n}"
export BUILDKITE_AGENT_TAGS="${TAGS:-queue=github-actions,github-action=true}"

exec buildkite-agent start --disconnect-after-job
