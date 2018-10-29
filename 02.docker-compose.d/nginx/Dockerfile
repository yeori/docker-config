FROM nginx:latest
MAINTAINER yeori.seo@gmail.com

ARG conf

# timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# logging
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

RUN  rm  -rf /etc/nginx/conf.d/*.conf
COPY $conf /etc/nginx/conf.d

EXPOSE     80
EXPOSE     443
CMD       ["nginx", "-g", "daemon off;"]
