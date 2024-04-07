FROM golang as build
COPY bird-gen-config /src
RUN cd /src && go build && chmod +x /src/bird-gen-config

FROM debian:bullseye

RUN adduser --disabled-password --uid 1000 bird

RUN --mount=type=cache,target=/var/cache/apt apt update && apt install -y \
    bird2 \
    procps \
    inetutils-traceroute

RUN mkdir -p /run/bird && chown bird:bird /run/bird

COPY --chmod=775 start.sh /start.sh

COPY --from=build --chmod=775 /src/bird-gen-config /usr/local/bin/bird-gen-config

COPY --chown=bird:bird bird.conf.tmpl /bird.conf.tmpl

ENTRYPOINT [ "/usr/sbin/bird", "-d" ]