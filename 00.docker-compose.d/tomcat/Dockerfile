FROM tomcat:8.5
MAINTAINER yeori.seo@gmail.com

ARG server_name

RUN mv  /usr/local/tomcat/conf/server.xml /usr/local/tomcat/conf/server.xml.origin
COPY server.xml /usr/local/tomcat/conf/server.xml
RUN sed -i "s/@{TCNAME}/$server_name/g" /usr/local/tomcat/conf/server.xml
EXPOSE $port

CMD ["catalina.sh", "run"]
