ARG DOCKER_VERSION="stable"

FROM docker:${DOCKER_VERSION}

ARG RUBY_VERSION="2.5.3-r1"

LABEL maintainer="sklemmer@knet.network"

COPY Gemfile /Gemfile

RUN apk add --no-cache \
        openssh-client=7.9_p1-r4 \
        alpine-sdk=1.0-r0 \
        ruby="${RUBY_VERSION}" \
        ruby-dev="${RUBY_VERSION}" \
        ruby-irb="${RUBY_VERSION}" \
        ruby-rake="${RUBY_VERSION}" \
        ruby-io-console="${RUBY_VERSION}" \
        ruby-bigdecimal="${RUBY_VERSION}" \
        ruby-json="${RUBY_VERSION}" \
        ruby-bundler="1.17.1-r0" \
 && bundle install --no-cache --quiet \
 && apk del alpine-sdk

