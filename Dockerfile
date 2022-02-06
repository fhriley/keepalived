FROM alpine:3.15 as build

WORKDIR /tmp/keepalived

RUN apk add --no-cache \
  keepalived=2.2.4-r2 \
  curl \
  iptables

VOLUME /etc/keepalived

CMD ["keepalived", "-f", "/etc/keepalived/keepalived.conf", "--dont-fork", "--log-console"]
