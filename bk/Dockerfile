FROM buildkite/agent

LABEL version="1.0.0"
LABEL repository="http://github.com/toolmantim/actions/bk"
LABEL homepage="http://github.com/toolmantim/actions/bk"
LABEL maintainer="Tim Lucas <t@toolmantim.com>"

LABEL com.github.actions.name="Buildkite CLI"
LABEL com.github.actions.description="Wrapper for the Buildkite CLI."
LABEL com.github.actions.icon="zap"
LABEL com.github.actions.color="blue"

ADD https://github.com/buildkite/cli/releases/download/v0.3.0/bk-linux-amd64-0.3.0 /usr/bin/bk
RUN chmod +x /usr/bin/bk

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]