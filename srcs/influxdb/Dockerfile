FROM alpine:3.12

EXPOSE 8086

#ENV TELEGRAF_VERSION 1.17.3
ENV TELEGRAF_VERSION 1.6.3

RUN apk update && apk upgrade

RUN     mkdir -p /run/influxdb

RUN apk add openssl \
            supervisor \
            ca-certificates \
            wget \
            influxdb

#RSA key for Glibc
RUN		wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub

#Download Glibc (C - library)
RUN     wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN     apk add glibc-2.32-r0.apk
RUN     mkdir -p /var/lib/influxdb

#Telegraf instalation
ADD https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz ./
RUN tar -C . -xzf telegraf-${TELEGRAF_VERSION}-static_linux_amd64.tar.gz && \
        chmod +x telegraf/* && \
        mv telegraf/telegraf usr/bin/ && \
        mkdir etc/telegraf && \
        rm -rf *.tar.gz* telegraf

COPY ./supervisor.conf .
RUN mv supervisor.conf /etc/supervisord.conf

RUN ./usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

CMD /usr/bin/supervisord -c /etc/supervisord.conf