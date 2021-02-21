FROM alpine:3.12

EXPOSE 3306


RUN apk update && apk upgrade 
RUN apk add mariadb mariadb-client

COPY ./init_mysql.sh .
COPY ./my.cnf /etc
COPY ./wordpress_db.sql .

CMD ./init_mysql.sh