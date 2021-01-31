FROM alpine:3.12

EXPOSE 5050

RUN apk update && apk upgrade
RUN apk add nginx \
            supervisor \
            wget \
            php7 \
            php-fpm 
            
# Create the dir for Alpine
RUN mkdir -p /run/nginx

#Install WP
RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xvzf latest.tar.gz && rm -rf latest.tar.gz && \
	mv wordpress /var/www/localhost

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisor.conf /etc/supervisord.conf
COPY ./wp-config.php /var/www/localhost/wordpress

CMD /usr/bin/supervisord -c /etc/supervisord.conf
