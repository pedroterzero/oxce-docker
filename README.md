# Get latest version of OpenXcom Extended
```bash
bash get-latest.sh
```

# Build image

```bash
bash build-latest.sh
```

# Publish to docker hub
```
docker login
docker push pedroterzero/oxce:"$(cat VERSION)"
docker push pedroterzero/oxce:latest
```

# Initial setup
- Create a new empty directory and cd into it
- Create required folders
  ```
  mkdir UFO TFTD config user
  ```
- Copy assets into `UFO/` or `TFTD/`, or both (see https://www.ufopaedia.org/index.php/Installing_(OpenXcom)#All_platforms)
- Create the container
  ```bash
  docker run \
   --name oxce \
   -u "$(id -u):$(id -g)" \
   -e DISPLAY \
   -v "/tmp/.X11-unix:/tmp/.X11-unix" \
   -v "/run/user/$(id -u)/pulse:/run/user/1000/pulse" \
   -v "/etc/machine-id:/etc/machine-id" \
   -v "${PWD}/config:/home/oxce/.config/openxcom" \
   -v "${PWD}/UFO:/app/UFO" \
   -v "${PWD}/TFTD:/app/TFTD" \
   -v "${PWD}/user:/app/user" \
   oxce:latest
  ```

# All subsequent runs
```
docker start oxce
```