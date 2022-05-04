FROM registry.access.redhat.com/ubi8/ubi-minimal AS final
RUN set -ex\
	; microdnf -y install python38 \
	; microdnf -y clean all

COPY requirements.txt .
RUN set -ex\
	; python3 -m pip install --no-cache-dir --progress-bar off\
		--user --requirement requirements.txt --no-cache\
	;
