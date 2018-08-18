FROM nginx:latest
MAINTAINER yeori.seo@gmail.com

ARG conf

RUN  rm  -rf /etc/nginx/conf.d/*.conf
COPY $conf /etc/nginx/conf.d

EXPOSE     80

CMD       ["nginx", "-g", "daemon off;"]
