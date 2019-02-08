FROM buildkite/agent:3

LABEL version="1.0.0"
LABEL repository="http://github.com/toolmantim/actions/agent"
LABEL homepage="http://github.com/toolmantim/actions/agent"
LABEL maintainer="Tim Lucas <t@toolmantim.com>"

LABEL com.github.actions.name="Buildkite Agent"
LABEL com.github.actions.description="Starts a single-job Buildkite Agent"
LABEL com.github.actions.icon="zap"
LABEL com.github.actions.color="blue"

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]