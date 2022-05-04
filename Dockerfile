ARG GO_VERSION=1.18
FROM quay.io/projectquay/golang:${GO_VERSION} AS build
WORKDIR /build/
ADD . /build/
RUN go build .

FROM registry.access.redhat.com/ubi8:8.5-226.1645809065 AS final

RUN set -ex\
	; dnf -y install python38 \
	; dnf -y clean all
COPY requirements.txt .
RUN set -ex\
	; python3 -m pip install --no-cache-dir --progress-bar off\
		--user --requirement requirements.txt --no-cache\
	;

COPY --from=build /build/ci-test /bin/ci-test
