FROM alpine:3.12

EXPOSE 5050

RUN apk update && apk upgrade
RUN apk add nginx \
            supervisor \
            openssl \
            wget \
            php7 \
            php7-fpm \
            php7-mysqli \
            php7-common \
            php7-json


# Set the tools for Alpine
RUN mkdir -p /run/nginx
RUN touch /run/nginx/nginx.pid
RUN adduser -D -g www 'www'

#Install WP
RUN wget https://wordpress.org/wordpress-5.6.tar.gz && \
    tar -xvzf wordpress-5.6.tar.gz && rm -rf wordpress-5.6.tar.gz && \
    mv wordpress /var/www/localhost/


COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisor.conf /etc/supervisord.conf
COPY ./wp-config.php /var/www/localhost/wordpress
COPY ./openssl.conf .

RUN openssl req -x509 -nodes -days 365 -new -config openssl.conf -batch -newkey rsa:2048 -keyout /etc/ssl/nginx_ssl.key -out /etc/ssl/nginx_ssl.crt
RUN rm openssl.conf


CMD /usr/bin/supervisord -c /etc/supervisord.conf
