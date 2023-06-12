# Issue description

When using a BUILD_ARG_PARAM that includes a hastag `#` it's trimmed out from the parameter sent to the docker command:

In the [following build](https://github.com/gastonfournier/build-args-test/actions/runs/5243723251/jobs/9468774478#step:6:112)

where it says

`/usr/bin/docker buildx build --build-arg NPM_TOKEN=HELLO_WORLD --build-arg BUILD_ARG_PARAM=pre-hashtag --file Dockerfile --iidfile /tmp/docker-actions-toolkit-d9yU9i/iidfile --platform linux/arm64`

it should be:

`/usr/bin/docker buildx build --build-arg NPM_TOKEN=HELLO_WORLD --build-arg BUILD_ARG_PARAM=pre-hashtag#post-hashtag --file Dockerfile --iidfile /tmp/docker-actions-toolkit-tU4tBo/iidfile --platform linux/arm64`

```
Run docker/build-push-action@v4
  with:
    context: .
    file: Dockerfile
    platforms: linux/arm64
    push: false
    build-args: NPM_TOKEN=HELLO_WORLD
  BUILD_ARG_PARAM=pre-hashtag#post-hashtag

    load: false
    no-cache: false
    pull: false
    github-token: ***
  env:
    BUILD_ARG_PARAM: pre-hashtag#post-hashtag
GitHub Actions runtime token ACs
  refs/heads/main: read/write
Docker info
Buildx version
  /usr/bin/docker buildx version
  github.com/docker/buildx 0.10.4+azure-1 c513d34049e499c53468deac6c4267ee72948f02
/usr/bin/docker buildx build --build-arg NPM_TOKEN=HELLO_WORLD --build-arg BUILD_ARG_PARAM=pre-hashtag --file Dockerfile --iidfile /tmp/docker-actions-toolkit-tU4tBo/iidfile --platform linux/arm64 --provenance mode=min,inline-only=true,builder-id=https://github.com/gastonfournier/build-args-test/actions/runs/5243652991 --metadata-file /tmp/docker-actions-toolkit-tU4tBo/metadata-file .
WARNING: No output specified with docker-container driver. Build result will only remain in the build cache. To push result image into registry use --push or to load image into docker use --load
#1 [internal] load build definition from Dockerfile
#1 transferring dockerfile: 2B done
#1 DONE 0.0s
```
