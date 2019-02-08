# Buildkite Plugin Linter GitHub Action

A GitHub Action for linting your [Buildkite Plugins](https://buildkite.com/docs/agent/v3/plugins) using the [Plugin Linter](https://github.com/buildkite-plugins/buildkite-plugin-linter).

Features:

* Lints your plugin readme examples
* Lints your plugin.yml file
* Updates the plugin version number in your readme when new releases are made

## Usage

```workflow
workflow "Lint" {
  on = "push"
  resolves = ["Plugin Linter"]
}

workflow "Release" {
  on = "release"
  resolves = ["Plugin Linter"]
}

action "Plugin Linter" {
  uses = "toolmantim/actions/plugin-linter@master"
}
```

## TODO

- [x] Decide if this is a good idea
- [ ] Figure out if release syntax is correct. At the moment it just resolves the same action.
- [ ] Implement everything