FROM alpine:3.12

EXPOSE 443 80 22

COPY . /var/www/localhost
WORKDIR /var/www/localhost

RUN apk update && apk upgrade
RUN apk add nginx \
            openssl \
            openssh \
            supervisor

# Create the dir for Alpine
RUN mkdir -p /run/nginx

#Create ssl sertificate
RUN openssl req -x509 -nodes -days 365 -new -config openssl.conf -batch -newkey rsa:2048 -keyout /etc/ssl/nginx_ssl.key -out /etc/ssl/nginx_ssl.crt
RUN rm openssl.conf


RUN mv nginx.conf /etc/nginx/conf.d/default.conf
RUN mv supervisor.conf /etc/supervisord.conf

RUN ssh-keygen -A

RUN adduser -D admin && echo "admin:admin" | chpasswd

CMD /usr/bin/supervisord -c /etc/supervisord.conf
