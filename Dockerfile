FROM ubuntu:20.04 AS base

RUN apt-get update && \
    apt-get install -y --no-install-recommends gosu libsdl1.2-dev libsdl-image1.2-dev libsdl-gfx1.2-dev libsdl-mixer1.2-dev && \
    rm -rf /var/lib/apt/lists/*

COPY oxce /app

WORKDIR /app

FROM base AS regular

RUN useradd -m oxce

RUN mkdir -p /home/oxce/.config

RUN chown -R oxce.oxce /home/oxce/.config /app

COPY docker-entrypoint.sh /

CMD ["./OpenXcomEx"]

ENTRYPOINT ["/docker-entrypoint.sh"]

FROM base AS rootless

RUN mkdir -p /root/.config

CMD ["./OpenXcomEx"]