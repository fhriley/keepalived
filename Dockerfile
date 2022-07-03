FROM alpine:3.16 as build

RUN apk add --no-cache \
  keepalived \
  curl \
  jq

COPY --from=mazzolino/docker:20-dind /usr/local/bin/docker /usr/bin/docker

VOLUME /etc/keepalived

ENTRYPOINT ["keepalived", "-f", "/etc/keepalived/keepalived.conf", "--dont-fork", "--log-console"]
