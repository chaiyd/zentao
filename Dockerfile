FROM debian:10-slim

LABEL maintainer="zentao Docker Maintainers <chaiyd.cn@gmail.com>"

RUN sed -i s/deb.debian.org/mirrors.aliyun.com/g /etc/apt/sources.list && \
    sed -i s/security.debian.org/mirrors.aliyun.com/g /etc/apt/sources.list && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    apt update -y && \
    apt install -y apache2 php php-curl php-gd php-ldap php-mbstring php-mysql php-xml php-zip php-cli php-json curl unzip libapache2-mod-php

ARG ZENTAO_VERSION=12.3.3

RUN mkdir -p /app/zentaopms
COPY docker-entrypoint.sh /app
RUN chmod 777 /app/docker-entrypoint.sh && \
    curl http://dl.cnezsoft.com/zentao/${ZENTAO_VERSION}/ZenTaoPMS.${ZENTAO_VERSION}.stable.zip -o /var/www/zentao.zip && \
    #curl https://www.zentao.net/dl/ZenTaoPMS.${ZENTAO_VERSION}.zip -o /var/www/zentao.zip && \
    cd /var/www/ && unzip -q zentao.zip && rm zentao.zip

RUN a2enmod rewrite

RUN rm -rf /etc/apache2/sites-enabled/000-default.conf /var/lib/mysql/*
RUN sed -i '1i ServerName 127.0.0.1' /etc/apache2/apache2.conf
COPY config/apache.conf /etc/apache2/sites-enabled/000-default.conf
COPY config/ioncube_loader_lin_7.0.so /usr/lib/php/20151012/ioncube_loader_lin_7.0.so
COPY config/00-ioncube.ini /etc/php/7.0/apache2/conf.d/
COPY config/00-ioncube.ini /etc/php/7.0/cli/conf.d/

VOLUME /app/zentaopms /var/lib/mysql
ENTRYPOINT ["/app/docker-entrypoint.sh"]
