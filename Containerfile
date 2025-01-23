# SOURCE_IMAGE arg can be anything from ublue upstream which matches your desired version:
# See list here: https://github.com/orgs/ublue-os/packages

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

FROM scratch AS ctx
COPY / /

FROM ghcr.io/ublue-os/bluefin-dx:stable-daily

# RUN mkdir -p /var/lib/alternatives && \
#     /tmp/build.sh && \
#     ostree container commit && \
#     bootc container lint

RUN --mount=type=cache,dst=/var/cache/rpm-ostree \
    --mount=type=bind,from=ctx,source=/,target=/ctx \
    /ctx/build.sh