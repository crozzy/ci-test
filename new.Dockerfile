FROM quay.io/projectquay/clair-action:v0.0.4

RUN DB_PATH=/tmp/matcher.db /bin/clair-action --level info update
RUN df -h
