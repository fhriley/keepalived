FROM alpine:3.15 as build

RUN apk add --no-cache \
  keepalived=2.2.4-r2 \
  curl \
  jq

COPY --from=mazzolino/docker:20.10.12-dind /usr/local/bin/docker /usr/bin/docker

VOLUME /etc/keepalived

ENTRYPOINT ["keepalived", "-f", "/etc/keepalived/keepalived.conf", "--dont-fork", "--log-console"]
