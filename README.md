## Custom Docker images

### Deno Docker image
Reasons to publish on *ghcr.io* custom Deno docker image: 
- *denoland/deno:<version>* for unknown reasons skip making */home/deno* directory even the *deno home* directory entry exists on */etc/passwd*. 
- *denoland/deno:<version>* dont have some neccessary packages: *git ca-certificates mkdir*.
- *denoland/deno:<version>* current shell is not *bash*.
- *denoland/deno:<version>* base image issue when building *dev container*: setting *remoteUser* or *runArgs/user* with *deno* on *devcontainer.json* throw missing */home/deno* directory error [when changing owner with host user/group id in *updateUID.Dockerfile*].