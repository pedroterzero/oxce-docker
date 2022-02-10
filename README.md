# Get latest
```bash
bash get-latest.sh
```

# Build image

**Do not forget to update version number in `docker-compose.yml`**

```bash
docker-compose build
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
  docker run -it \
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
   oxce:7.5.3
  ```

# All subsequent runs
```
docker start oxce -u "$(id -u):$(id -g)"
```