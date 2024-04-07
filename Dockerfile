FROM golang as build
COPY bird-gen-config /src
RUN cd /src && go build && chmod +x /src/bird-gen-config

FROM debian:bullseye

ENV BIRD_RUN_USER=bird
ENV BIRD_RUN_GROUP=bird
ENV BIRD_RUN_DIR=/run/bird
ENV BIRD_ARGS=""

RUN --mount=type=cache,target=/var/cache/apt apt update && apt install -y \
    bird2 \
    procps \
    inetutils-traceroute

RUN mkdir -p ${BIRD_RUN_DIR}

COPY --chown=${BIRD_RUN_USER}:${BIRD_RUN_GROUP} --chmod=775 start.sh /start.sh

COPY --from=build --chmod=775 /src/bird-gen-config /usr/local/bin/bird-gen-config

COPY bird.conf.tmpl /etc/bird/bird.conf.tmpl

CMD ["/start.sh"]