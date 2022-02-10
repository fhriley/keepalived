FROM alpine:3.15 as build

RUN apk add --no-cache \
  keepalived=2.2.4-r2 \
  curl \
  py-pip \
  python3-dev \
  libffi-dev \
  openssl-dev \
  gcc \
  libc-dev \
  rust \
  cargo \
  make

COPY --from=mazzolino/docker:20.10.12-dind /usr/local/bin/docker /usr/bin/docker

ARG COMPOSE_VERSION=2.2.3
RUN curl -Lo /usr/local/bin/docker-compose \
    https://github.com/docker/compose/releases/download/v${COMPOSE_VERSION}/docker-compose-linux-$(if [ "$(uname -m)" == "armv7l" ]; then echo armv7; else echo "$(uname -m)"; fi) \
  && chmod +x /usr/local/bin/docker-compose

VOLUME /etc/keepalived

ENTRYPOINT ["keepalived", "-f", "/etc/keepalived/keepalived.conf", "--dont-fork", "--log-console"]
