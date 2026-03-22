FROM archlinux:base-devel-20260308.0.497099 AS builder

ARG DONETICK_VERSION
ARG DONETICK_RELEASE=https://github.com/donetick/donetick/releases/download/v${DONETICK_VERSION}/donetick_Linux_x86_64.tar.gz

WORKDIR /extract/donetick
RUN curl --silent --show-error --location --output donetick.tar.gz \
  "${DONETICK_RELEASE}" \
  && tar xzf donetick.tar.gz \
  && chmod a+x donetick

FROM scratch

ARG DONETICK_VERSION

COPY --from=builder /extract/donetick/donetick /usr/bin/donetick

ENV DT_ENV=selfhosted
WORKDIR /var/lib/donetick

ENTRYPOINT ["/usr/bin/donetick"]

LABEL org.opencontainers.image.title="distroless donetick"
LABEL org.opencontainers.image.description="distroless donetick"
LABEL org.opencontainers.image.version="${DONETICK_VERSION}"
LABEL org.opencontainers.image.source="https://github.com/simons-containers/distroless-donetick"
LABEL org.opencontainers.image.volumes.config="/var/lib/donetick"
