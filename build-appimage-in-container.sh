#!/bin/sh

cp -a vol/AppDir .

cp -a vol/oxce/. AppDir/.
rm AppDir/OpenXcomEx

mkdir -p AppDir/usr/bin \
  && cp vol/oxce/OpenXcomEx AppDir/usr/bin/ \
  && chmod +x AppDir/usr/bin/OpenXcomEx

/usr/bin/linuxdeploy --appdir AppDir --output appimage
mv *.AppImage out/
# bash
