FROM       mariadb:10.3

MAINTAINER yeori.seo@gmail.com

RUN    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

COPY   ./query/init.sql ./docker-entrypoint-initdb.d/init.sql.copied
VOLUME ["/etc/mysql", "/var/lib/mysql"]

EXPOSE     3306

#ENTRYPOINT ["docker-entrypoint.sh"]
#CMD ["mysqld"]
