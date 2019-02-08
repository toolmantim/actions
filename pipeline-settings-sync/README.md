# Buildkite Pipeline Settings Sync GitHub Action

A GitHub Action for storing your Buildkite pipeline settings in your source code, and having them automatically synchronised on `git push` via the [Buildkite Pipelines API](https://buildkite.com/docs/apis/rest-api/pipelines).

Features:

* Sync's your pipeline’s GitHub settings, such as branch filtering rules and pull request rules.
* Sync's your pipeline’s schedule.
* Sync's your pipeline's steps 

## Usage

Create one or more of the following files in your repository:

`.github/buildkite/<org-slug>/<pipeline-slug>/github.json`:

```json
{
  "branch-configuration": "*",
  "build_pull_requests": true,
  "publish_commit_status_per_step": true,
}
```

`.github/buildkite/<org-slug>/<pipeline-slug>/schedule.json`:

```json
[
  {
    "cronline": "@nightly",
    "message": ":alarm_clock: Nightly build",
    "branch": "master",
    "commit": "HEAD"
  }
]
```

`.github/buildkite/<org-slug>/<pipeline-slug>/steps.yml`:

```yml
steps:
  - command: buildkite-agent pipeline upload
```

Then set up the GitHub Action:

```workflow
workflow "Sync Buildkite Settings" {
  on = "push"
  resolves = ["Sync Settings"]
}

action "Sync Settings" {
  uses = "toolmantim/actions/pipeline-settings-sync@master"
  secrets = ["BUILDKITE_API_TOKEN"]
  # Nothing else to configure
}
```

## TODO

- [ ] Decide if this is a good idea
- [ ] Implement everything