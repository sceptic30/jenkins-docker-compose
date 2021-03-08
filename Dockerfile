FROM jenkins/jenkins:lts-alpine

USER root

ARG DOCKER_HOST_GID=1001
ARG JAVA_OPTS=""

ENV DOCKER_HOST_GID $DOCKER_HOST_GID
ENV JAVA_OPTS $JAVA_OPTS

RUN set -eux \
&& apk --no-cache update \
&& apk --no-cache upgrade --available \
&& apk --no-cache add shadow \
&& apk --no-cache add docker curl --repository http://dl-cdn.alpinelinux.org/alpine/latest-stable/community \
&& deluser --remove-home jenkins \
&& addgroup -S jenkins -g $DOCKER_HOST_GID \
&& adduser -S -G jenkins -u $DOCKER_HOST_GID jenkins \
&& usermod -aG docker jenkins \
&& apk del shadow

USER jenkins

WORKDIR $JENKINS_HOME
