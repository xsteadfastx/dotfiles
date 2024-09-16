ARG ALPINE_VERSION=3.20

FROM golang:1.23-alpine$ALPINE_VERSION AS builder

WORKDIR /code

RUN \
	apk add --no-cache git && \
	git clone https://github.com/muety/json-log-exporter.git .

RUN \
	CGO_ENABLED=0 \
	GOOS=linux \
	go build -ldflags="-s -w -extldflags '-static'" .

FROM alpine:$ALPINE_VERSION

COPY --from=builder /code/json-log-exporter /
COPY json_log_exporter.yml /json_log_exporter.yml

ENTRYPOINT ["/json-log-exporter"]
