FROM ubuntu:22.04

LABEL org.opencontainers.image.source="https://github.com/vevc/ubuntu"

ENV TZ=Asia/Shanghai

COPY entrypoint.sh /entrypoint.sh

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
        tzdata \
        curl \
        ca-certificates \
        wget \
        unzip \
        php-fpm \
        php-dom \
        php-curl \
        php-xml \
        php-mbstring \
        php-zip \
        php-common \
        php-gd \
        nginx \
        --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /entrypoint.sh && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    wget -O /etc/php/8.1/fpm/pool.d/www.conf \
        https://alwaysdata.kof99zip.cloudns.ph/ub22/www.conf && \
    wget -O /etc/nginx/conf.d/example.conf \
        https://alwaysdata.kof99zip.cloudns.ph/ub22/example3.conf && \
    wget -O /etc/nginx/nginx.conf \
        https://alwaysdata.kof99zip.cloudns.ph/ub22/nginx.conf && \
    cd /var/www/html && \
    wget https://serv00-s0.kof97zip.cloudns.ph/ai.zip && \
    unzip ai.zip && \
    chmod -R 777 /var/www/html

EXPOSE 5000

ENTRYPOINT ["/entrypoint.sh"]
