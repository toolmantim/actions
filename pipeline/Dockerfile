FROM alpine

LABEL version="1.0.0"
LABEL repository="http://github.com/toolmantim/actions/pipeline"
LABEL homepage="http://github.com/toolmantim/actions/pipeline"
LABEL maintainer="Tim Lucas <t@toolmantim.com>"

LABEL com.github.actions.name="Buildkite Pipeline"
LABEL com.github.actions.description="Triggers a Buildkite pipeline."
LABEL com.github.actions.icon="zap"
LABEL com.github.actions.color="blue"

RUN apk add --no-cache bash curl jq

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]