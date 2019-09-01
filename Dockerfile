# from registry.cn-hangzhou.aliyuncs.com/rancococ/jenkins-jnlp-slave:3.29.5-centos
FROM registry.cn-hangzhou.aliyuncs.com/rancococ/jenkins-jnlp-slave:3.29.5-centos

# maintainer
MAINTAINER "rancococ" <rancococ@qq.com>

# set arg info
ARG DOCKER_HOST=tcp://127.0.0.1:2375
ARG DOCKER_VERSION=19.03.1
ARG DOCKER_URL=https://mirrors.aliyun.com/docker-ce/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz

# set environment
ENV DOCKER_HOST=${DOCKER_HOST}

# set current user
USER root

# install docker
RUN curl --create-dirs -fsSLo /tmp/docker.tgz ${DOCKER_URL} && \
    mkdir -p /tmp/docker && \
    tar -xzf /tmp/docker.tgz --directory=/tmp/docker --strip-components=1 && \
    \cp -rf /tmp/docker/docker /usr/local/bin/docker && \
    chown -R jenkins:jenkins /usr/local/bin/docker && \
    \rm -rf /tmp/docker.tgz && \
    \rm -rf /tmp/docker

# set current user
USER jenkins
