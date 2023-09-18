FROM mysql:latest

ENV MYSQL_DATABASE=verkauf
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=geheim
ENV MYSQL_ROOT_PASSWORD=geheim

VOLUME /var/lib/mysql

COPY DB.sql /docker-entrypoint-initdb.d/
