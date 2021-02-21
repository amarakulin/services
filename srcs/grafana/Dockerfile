FROM alpine:3.12

EXPOSE 3000

ENV GRAFANA_VERSION 7.3.6

RUN apk update && apk upgrade
RUN apk add wget \
            ca-certificates

#Install grafana
ADD https://dl.grafana.com/oss/release/grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz .
RUN tar -xvzf grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz && rm -rf grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz

#Install glibc
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN apk add glibc-2.32-r0.apk

COPY ./grafana.db /grafana-${GRAFANA_VERSION}/data/grafana.db

CMD /grafana-${GRAFANA_VERSION}/bin/grafana-server --homepath=/grafana-${GRAFANA_VERSION}