FROM ubuntu:24.04

ARG FLUTTER_STABLE_VERSION=3.44.1

ENV DEBIAN_FRONTEND=noninteractive \
    FLUTTER_HOME=/opt/flutter \
    PATH=/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:/root/.pub-cache/bin:$PATH

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        file \
        git \
        jq \
        unzip \
        xz-utils \
        zip \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 --branch "$FLUTTER_STABLE_VERSION" https://github.com/flutter/flutter.git "$FLUTTER_HOME" \
    && flutter config --no-analytics \
    && flutter precache --web \
    && flutter doctor -v
