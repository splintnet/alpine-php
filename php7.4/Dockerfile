FROM php:7.4-fpm-alpine
LABEL maintainer="info@splintnet.de"

# Download script to install PHP extensions and dependencies
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync

RUN apk add --no-cache \
    curl \
    git \
    zip unzip \
    mysql-client \
    && install-php-extensions \
    bcmath \
    bz2 \
    calendar \
    exif \
    gd \
    imagick \
    intl \
    apcu \
    pcntl \
    iconv \
    ldap \
    memcached \
    mysqli \
    opcache \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    redis \
    soap \
    xsl \
    zip \
    sockets

# DataDog PHP Tracer
RUN curl -sSLO https://github.com/DataDog/dd-trace-php/releases/download/0.56.0/datadog-php-tracer_0.56.0_noarch.apk && \
    apk add datadog-php-tracer_0.56.0_noarch.apk --allow-untrusted && \
    rm datadog-php-tracer_0.56.0_noarch.apk

# fix work iconv library with alphine
RUN wget http://dl-cdn.alpinelinux.org/alpine/v3.10/community/x86_64/gnu-libiconv-1.15-r2.apk && apk add --allow-untrusted gnu-libiconv-1.15-r2.apk
# RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted gnu-libiconv
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

# PHP config
COPY php.ini /usr/local/etc/php/conf.d/custom.ini

# Install Composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && ln -s $(composer config --global home) /root/composer
ENV PATH=$PATH:/root/composer/vendor/bin COMPOSER_ALLOW_SUPERUSER=1

# Workdir
WORKDIR /application
