ARG CADDY_VER=2.7.6

FROM caddy:${CADDY_VER}-builder-alpine as builder

RUN set -ex \
	&& xcaddy build \
	--with github.com/caddy-dns/hetzner

FROM caddy:${CADDY_VER}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

COPY Caddyfile /etc/caddy/Caddyfile
