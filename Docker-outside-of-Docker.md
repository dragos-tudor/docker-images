
## Docker outside of Docker
Running *dev container* as non-root user [security reasons]. 

Connecting to host docker daemon from *dev container* alternatives:
- using docker remote api [over tcp on port 2375/2376].
- using docker unix socket [mounting */var/run/docker.sock*].

Connecting to host docker daemon from *dev container* support:
- using docker remote api available on Linux and Windows.
- using docker unix socket available on Linux.

### Docker outside of Docker using docker remote api
Connecting to host docker daemon from *dev container* using docker remote api.
- add to `/etc/docker/daemon.json` and enable docker daemon listening on tcp 2375:
```
{
  "hosts": [
    "tcp://0.0.0.0:2375",
    "unix:///var/run/docker.sock"
  ]
}
```
- add to `/etc/systemd/system/docker.service.d/override.conf`:
```
  [Service]
  ExecStart=
  ExecStart=/usr/bin/dockerd
```
- restart systemd daemon and docker daemon:
```shell
systemctl daemon-reload
systemctl restart docker.service
```

### Docker outside of Docker using docker socket
Connection to host docker daemon from *dev container* using docker unix socket issues:
- available only on Linux.
- *dev container* non-root user needs to have access to mounted docker socket. As non-root user the container user should be member of one container group with the same group id as host *docker* group.


