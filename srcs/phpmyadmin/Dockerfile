FROM alpine:3.12

EXPOSE 5000

RUN apk update && apk upgrade
RUN apk add nginx \
            supervisor \
            wget \
            openssl \
            php7 \
            php7-fpm \
            php7-mysqli \
            php7-json \
            php7-mbstring \
            php7-session


# Set the tools for Alpine
RUN mkdir -p /run/nginx
RUN touch /run/nginx/nginx.pid
RUN adduser -D -g www 'www'

#Install phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && \
    tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz

RUN mv phpMyAdmin-5.0.1-english phpmyadmin && \
    mv phpmyadmin /var/www/localhost

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisor.conf /etc/supervisord.conf
COPY ./config.inc.php /var/www/localhost/phpmyadmin
COPY ./openssl.conf .

RUN openssl req -x509 -nodes -days 365 -new -config openssl.conf -batch -newkey rsa:2048 -keyout /etc/ssl/nginx_ssl.key -out /etc/ssl/nginx_ssl.crt
RUN rm openssl.conf


CMD /usr/bin/supervisord -c /etc/supervisord.conf