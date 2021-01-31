FROM alpine:3.12

COPY ./init_mysql.sh .
COPY ./my.cnf /etc

RUN apk update && apk upgrade 
RUN apk add mariadb mariadb-client openrc

RUN chmod +x init_mysql.sh

CMD ./init_mysql.sh

