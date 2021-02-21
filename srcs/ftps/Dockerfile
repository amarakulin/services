FROM alpine:3.12

EXPOSE 21

RUN apk update && apk upgrade
RUN apk add vsftpd \
            openssl \
            filezilla \
            openrc

COPY ./openssl.conf .
COPY ./init_ftps.sh .
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN openssl req -x509 -nodes -days 365 -new -config openssl.conf -batch -newkey rsa:2048 -keyout /etc/ssl/ftps_ssl.key -out /etc/ssl/ftps_ssl.crt

RUN adduser -D admin && echo "admin:admin" | chpasswd
RUN touch /var/log/vsftpd.log

CMD ./init_ftps.sh

