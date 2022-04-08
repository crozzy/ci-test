ARG GO_VERSION=1.18
FROM quay.io/projectquay/golang:${GO_VERSION} AS build
WORKDIR /build/
ADD . /build/
RUN go build .

FROM registry.access.redhat.com/ubi8/ubi-minimal AS final

COPY --from=build /build/ci-test /bin/ci-test
