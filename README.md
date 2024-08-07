## Custom Docker images
- intended to be used on development process only.
- usually, on CI integrations, containers based on these images should use *self-hosted* github runner agents allowing *docker-outside-of-docker* testing environments, faster *e2e* testing, so.
- these images allow switching from unoptimized caching *devcontainer features* to native docker layers caching.

### Deno Docker image
Reasons to publish on *ghcr.io* custom Deno docker image:
- *denoland/deno:version* for unknown reasons skip making */home/deno* directory even the *deno home* directory entry exists on */etc/passwd*.
- *denoland/deno:version* dont have some neccessary packages: *git ca-certificates mkdir*.
- *denoland/deno:version* current shell is not *bash*.
- *denoland/deno:version* base image issue when building *dev container*: setting *remoteUser* or *runArgs/user* with *deno* on *devcontainer.json* throw missing */home/deno* directory error [when changing owner with host user/group id in *updateUID.Dockerfile*].
- changing [deno dockerfile](https://github.com/denoland/deno_docker/blob/main/debian.dockerfile) or *updateUID.Dockerfile* seems to be impossible due to downstream implications.

### Dotnet Deno Docker image
Reasons to publish on *ghcr.io* Dotnet Deno docker image:
- having one consolidated image with *dotnet sdk* and "deno" for building frontend + backend web applications (eg. vertical slice architecture).