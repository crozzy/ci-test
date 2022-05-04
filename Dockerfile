#ARG GO_VERSION=1.18
#FROM quay.io/projectquay/golang:${GO_VERSION} AS build
#WORKDIR /build/
#ADD . /build/
#RUN go build .

FROM registry.access.redhat.com/ubi8/ubi-minimal AS final
RUN echo "do something"
#RUN set -ex\
#	; microdnf -y install python38 \
#	; microdnf -y clean all
#COPY requirements.txt .
#RUN set -ex\
#	; python3 -m pip install --no-cache-dir --progress-bar off\
#		--user --requirement requirements.txt --no-cache\
#	;

#COPY --from=build /build/ci-test /bin/ci-test
