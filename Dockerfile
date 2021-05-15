FROM alpine:3.10

# variable "VERSION" must be passed as docker environment variables during the image build
# docker build --no-cache --build-arg VERSION_3.5.4 -t echinen/alpine-helm:3.5.4 .

ARG VERSION

ENV BASE_URL="https://get.helm.sh"
ENV TAR_FILE="helm-v${VERSION}-linux-amd64.tar.gz"

RUN apk add --no-cache curl ca-certificates bash git

# Install helm
RUN curl -L ${BASE_URL}/${TAR_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64

# Clean
RUN apk del curl && \
    rm -f /var/cache/apk/*

ENTRYPOINT []
CMD []
