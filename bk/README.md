# Buildkite CLI GitHub Action

A wrapper allowing you to use the [Buildkite CLI](https://github.com/buildkite/cli) with GitHub Actions.

## Usage

```workflow
workflow "Run the Buildkite pipeline locally" {
  on = "push"
  resolves = ["bk run"]
}

action "bk run" {
  uses = "toolmantim/actions/bk@master"
  args = ["run"]
}
```

## TODO

- [ ] Decide if this is a good idea
- [x] Implement everything

