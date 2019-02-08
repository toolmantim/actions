#!/bin/bash
set -euo pipefail

export BUILDKITE_AGENT_QUEUE="${QUEUE:-default}"
export BUILDKITE_AGENT_NAME="${NAME:-github-action-%n}"
export BUILDKITE_AGENT_TAGS="${TAGS:-github-action}"

exec buildkite-agent start --disconnect-after-job
