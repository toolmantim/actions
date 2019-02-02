FROM buildkite/agent

LABEL version="1.0.0"
LABEL repository="http://github.com/toolmantim/actions/buildkite-agent"
LABEL homepage="http://github.com/toolmantim/actions/buildkite-agent"
LABEL maintainer="Tim Lucas <t@toolmantim.com>"

LABEL com.github.actions.name="Buildkite Agent"
LABEL com.github.actions.description="Proof of concept of running a single shot buildkite-agent."
LABEL com.github.actions.icon="zap"
LABEL com.github.actions.color="blue"

ENV BUILDKITE_AGENT_TAGS="github-action=true"
ENV BUILDKITE_AGENT_NAME="github-action-agent-%n"

CMD ["start", "--disconnect-after-job"]