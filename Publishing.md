### Publish custom Deno image
```shell
echo $GITHUB_TOKEN | docker login ghcr.io -u dragos-tudor --password-stdin
docker push ghcr.io/dragos-tudor/deno:1.45.2
```
