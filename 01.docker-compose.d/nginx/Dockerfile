FROM nginx:latest
MAINTAINER yeori.seo@gmail.com

ARG conf

RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
RUN  rm  -rf /etc/nginx/conf.d/*.conf
COPY $conf /etc/nginx/conf.d

EXPOSE     80

CMD       ["nginx", "-g", "daemon off;"]
