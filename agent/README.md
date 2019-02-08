# Buildkite Agent GitHub Action

A GitHub Action for running a [Buildkite Agent](https://buildkite.com/docs/agent).

Features:

* Starting a one-off agent with a specified queue and tags

## Usage

```workflow
workflow "Start a Buildkite Agent" {
  on = "push"
  resolves = ["Start Agent"]
}

action "Start Agent" {
  uses = "toolmantim/actions/agent@master"
  secrets = ["BUILDKITE_AGENT_TOKEN"]
  env = {
    TAGS = "github-action"
    NAME = "github-action-%n"
    QUEUE = "github-actions"
  }
}
```

## TODO

- [ ] Decide if this is a good idea
- [x] Implement everything