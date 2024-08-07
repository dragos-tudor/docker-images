set -eo pipefail
DENO_IMAGE_VERSION=1.45.2
DOTNET_SDK_IMAGE_VERSION=8.0.303
IMAGE_VERSION=$DOTNET_SDK_IMAGE_VERSION-$DENO_IMAGE_VERSION

docker build \
  --build-arg DENO_IMAGE_VERSION=$DENO_IMAGE_VERSION --build-arg DOTNET_SDK_IMAGE_VERSION=$DOTNET_SDK_IMAGE_VERSION \
  -t ghcr.io/dragos-tudor/dotnet-deno:$IMAGE_VERSION \
  -f Dockerfile.dotnet.deno .
# echo $GITHUB_TOKEN | docker login ghcr.io -u dragos-tudor --password-stdin
# docker push ghcr.io/dragos-tudor/dotnet-deno:$IMAGE_VERSION