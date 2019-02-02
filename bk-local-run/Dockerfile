FROM buildkite/agent

LABEL version="1.0.0"
LABEL repository="http://github.com/toolmantim/actions/bk-local-run"
LABEL homepage="http://github.com/toolmantim/actions/bk-local-run"
LABEL maintainer="Tim Lucas <t@toolmantim.com>"

LABEL com.github.actions.name="Buildkite Local Run"
LABEL com.github.actions.description="Proof of concept of running a Buildkite agent pipeline entirely on GH."
LABEL com.github.actions.icon="zap"
LABEL com.github.actions.color="blue"

ADD https://github.com/buildkite/cli/releases/download/v0.2.0/bk-linux-amd64-0.2.0 /usr/bin/bk
RUN chmod +x /usr/bin/bk

ENTRYPOINT ["bk", "run", "local"]