[![Current Version](https://raw.githubusercontent.com/simons-containers/distroless-donetick/badges/.badges/main/release.svg)](https://github.com/simons-containers/distroless-donetick/pkgs/container/distroless-donetick) [![Tags](https://raw.githubusercontent.com/simons-containers/distroless-donetick/badges/.badges/main/tags.svg)](https://github.com/simons-containers/distroless-donetick/pkgs/container/distroless-donetick) <br> ![Current Size](https://raw.githubusercontent.com/simons-containers/distroless-donetick/badges/.badges/main/size.svg) ![Wasted Size](https://raw.githubusercontent.com/simons-containers/distroless-donetick/badges/.badges/main/wasted.svg) ![Efficiency](https://raw.githubusercontent.com/simons-containers/distroless-donetick/badges/.badges/main/efficiency.svg) <br> ![Critical](https://raw.githubusercontent.com/simons-containers/distroless-donetick/badges/.badges/main/critical.svg) ![High](https://raw.githubusercontent.com/simons-containers/distroless-donetick/badges/.badges/main/high.svg) ![Medium](https://raw.githubusercontent.com/simons-containers/distroless-donetick/badges/.badges/main/medium.svg) ![Low](https://raw.githubusercontent.com/simons-containers/distroless-donetick/badges/.badges/main/low.svg) <br> [![Publish Workflow](https://img.shields.io/github/actions/workflow/status/simons-containers/distroless-donetick/deploy.yaml?label=Publish%20Workflow&logo=github)](https://github.com/simons-containers/distroless-donetick/actions/workflows/deploy.yaml) [![Update Workflow](https://img.shields.io/github/actions/workflow/status/simons-containers/distroless-donetick/update-versions.yaml?label=Update%20Workflow&logo=github)](https://github.com/simons-containers/distroless-donetick/actions/workflows/update-versions.yaml)

# Distroless Donetick container

Bare-bones distroless Donetick container image.

## Running

Mount data directory at `/var/lib/donetick`.

Example:

```bash
docker run -it --rm -v ./data:/var/lib/donetick \
  ghcr.io/simons-containers/distroless-donetick:latest
```

## Building

| Arg | Description |
|---|---|
| `DONETICK_VERSION` | Version of Donetick to use

Build container using build-args from versions.yaml:

```bash
docker build -t \
  distroless-donetick:$(yq -r .donetick versions.yaml) \
  $(yq -r 'to_entries | .[] | "--build-arg \(.key | ascii_upcase)_VERSION=\(.value)"' versions.yaml) -f Containerfile .
```

## License

Repository contents (e.g., `Containerfile`, build scripts, and configuration) are licensed under the **MIT License**.

Software included in built container images (such as **Donetick**) are provided under their respective upstream licenses and are not covered by the MIT license for this repository.

## Acknowledgements

This project depends on a number of upstream components and data sources:

- **Donetick** - Donetick an open-source, user-friendly app for managing tasks and chores, featuring customizable options to help you and others stay organized.  
  https://donetick.com
