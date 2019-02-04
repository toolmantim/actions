FROM alpine

LABEL version="1.0.0"
LABEL repository="http://github.com/toolmantim/actions/trigger-buildkite-pipeline"
LABEL homepage="http://github.com/toolmantim/actions/trigger-buildkite-pipeline"
LABEL maintainer="Tim Lucas <t@toolmantim.com>"

LABEL com.github.actions.name="Trigger Buildkite Pipeline"
LABEL com.github.actions.description="Triggers a Buildkite pipeline for the given commit and branch."
LABEL com.github.actions.icon="zap"
LABEL com.github.actions.color="blue"

RUN apk add --no-cache bash curl jq

ADD . /src/

ENTRYPOINT ["/src/trigger.sh"]