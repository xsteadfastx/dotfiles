ARG CADDY_VER=2.10.2

FROM caddy:${CADDY_VER}-builder as builder

RUN set -ex \
	&& xcaddy build \
	--with github.com/caddyserver/cache-handler \
	--with github.com/mholt/caddy-ratelimit \
	--with github.com/caddyserver/transform-encoder \
	--with github.com/daegalus/caddy-anubis \
	--with pkg.jsn.cam/caddy-defender

FROM caddy:${CADDY_VER}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile

VOLUME /var/log/caddy
