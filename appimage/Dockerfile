FROM ubuntu:20.04 AS base

# Install dependencies for OXCE and AppImage creation
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libsdl1.2-dev \
    libsdl-image1.2-dev \
    libsdl-gfx1.2-dev \
    libsdl-mixer1.2-dev \
    libfuse2 \
    wget \
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN update-ca-certificates

# Download and prepare AppImage tools (linuxdeploy)
RUN wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage -O /usr/bin/linuxdeploy && \
    chmod +x /usr/bin/linuxdeploy

WORKDIR /app

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    appstream \
    gnupg2 \
    file \
    && rm -rf /var/lib/apt/lists/*

COPY build-appimage-in-container.sh /app
