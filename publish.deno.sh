set -euo pipefail
IMAGE_VERSION=${1}

docker build \
  --build-arg IMAGE_VERSION=$IMAGE_VERSION \
  -t ghcr.io/dragos-tudor/deno:$IMAGE_VERSION \
  -f Dockerfile.deno .
echo $GITHUB_TOKEN | docker login ghcr.io -u dragos-tudor --password-stdin
docker push ghcr.io/dragos-tudor/deno:$IMAGE_VERSION

