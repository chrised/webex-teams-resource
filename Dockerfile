FROM alpine:latest

RUN apk add --no-cache curl jq

ADD cmd/* /opt/resource/
