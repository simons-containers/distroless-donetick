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