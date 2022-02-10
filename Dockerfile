FROM ubuntu:18.04

RUN apt update && \
    apt install -y libsdl1.2-dev libsdl-image1.2-dev libsdl-gfx1.2-dev libsdl-mixer1.2-dev && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m oxce

COPY oxce /app

WORKDIR /app

RUN mkdir -p /home/oxce/.config

RUN chown -R oxce.oxce /home/oxce/.config /app

CMD ["./OpenXcomEx"]