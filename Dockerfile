FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends gosu libsdl1.2-dev libsdl-image1.2-dev libsdl-gfx1.2-dev libsdl-mixer1.2-dev && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m oxce

COPY oxce /app

COPY docker-entrypoint.sh /

WORKDIR /app

RUN mkdir -p /home/oxce/.config

RUN chown -R oxce.oxce /home/oxce/.config /app

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["./OpenXcomEx"]