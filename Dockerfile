FROM jenkins/jenkins:lts-alpine
MAINTAINER Nikolas <nikolas@admintuts.net> 

USER root

ENV DOCKER_HOST_GID=1001
ENV JAVA_OPTS=""

RUN set -ex \
&& apk --no-cache update \
&& apk --no-cache upgrade --available \
&& apk --no-cache add shadow \
&& apk --no-cache add docker curl --repository http://dl-cdn.alpinelinux.org/alpine/latest-stable/community

RUN set -ex \
&& deluser --remove-home jenkins \
&& addgroup -S jenkins -g $DOCKER_HOST_GID \
&& adduser -S -G jenkins -u $DOCKER_HOST_GID jenkins \
&& usermod -aG docker jenkins

USER jenkins

WORKDIR $JENKINS_HOME
