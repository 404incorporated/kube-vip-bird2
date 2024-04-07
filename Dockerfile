FROM debian:bullseye

ENV BIRD_RUN_USER=bird
ENV BIRD_RUN_GROUP=bird
ENV BIRD_RUN_DIR=/run/bird
ENV BIRD_ARGS=""

RUN mkdir -p ${BIRD_RUN_DIR}

COPY --chown=${BIRD_RUN_USER}:${BIRD_RUN_GROUP} --chmod=775 start.sh /start.sh

RUN --mount=type=cache,target=/var/cache/apt apt update && apt install -y \
    bird2 \
    procps \
    inetutils-traceroute

CMD ["/start.sh"]