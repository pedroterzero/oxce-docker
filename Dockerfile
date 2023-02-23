FROM ubuntu:18.04 AS base

FROM base AS sdl

RUN apt-get update && \
    apt-get install -y --no-install-recommends gosu libsdl1.2-dev libsdl-image1.2-dev libsdl-gfx1.2-dev libsdl-mixer1.2-dev && \
    rm -rf /var/lib/apt/lists/*

FROM base AS install

COPY --from=sdl /usr/sbin/gosu /usr/sbin/gosu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libSDL-1.2.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libSDL_image-1.2.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libSDL_gfx.so.15 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libSDL_mixer-1.2.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libGL.so.1 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libasound.so.2 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libpulse-simple.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libpulse.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libX11.so.6 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libXext.so.6 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libcaca.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libpng16.so.16 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libjpeg.so.8 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libtiff.so.5 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libwebp.so.6 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libmikmod.so.3 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libfluidsynth.so.1 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libvorbisfile.so.3 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libFLAC.so.8 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libmad.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libGLX.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libGLdispatch.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/pulseaudio /usr/lib/x86_64-linux-gnu
COPY --from=sdl /lib/x86_64-linux-gnu/libdbus-1.so.3 /lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libxcb.so.1 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /lib/x86_64-linux-gnu/libslang.so.2 /lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libjbig.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libSDL2-2.0.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libopenal.so.1 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libjack.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libsndfile.so.1 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /lib/x86_64-linux-gnu/libreadline.so.7 /lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libvorbis.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libogg.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /lib/x86_64-linux-gnu/libwrap.so.0 /lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libasyncns.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /lib/x86_64-linux-gnu/libapparmor.so.1 /lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libXau.so.6 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libXdmcp.so.6 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libsndio.so.6.1 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libXcursor.so.1 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libXinerama.so.1 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libXi.so.6 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libXrandr.so.2 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libXss.so.1 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libXxf86vm.so.1 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libwayland-egl.so.1 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libwayland-client.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libwayland-cursor.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libxkbcommon.so.0 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libvorbisenc.so.2 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /lib/x86_64-linux-gnu/libbsd.so.0 /lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libXrender.so.1 /usr/lib/x86_64-linux-gnu
COPY --from=sdl /usr/lib/x86_64-linux-gnu/libXfixes.so.3 /usr/lib/x86_64-linux-gnu

RUN useradd -m oxce

COPY oxce /app

COPY docker-entrypoint.sh /

WORKDIR /app

RUN mkdir -p /home/oxce/.config

RUN chown -R oxce.oxce /home/oxce/.config /app

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["./OpenXcomEx"]