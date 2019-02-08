#!/bin/sh
set -e

# Workaround until https://github.com/buildkite/cli/pull/30 is merged
mkdir -p /tmp/buildkite-plugins
export BUILDKITE_PLUGINS_PATH="/tmp/buildkite-plugins"

exec bk "$@"