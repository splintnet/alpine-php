FROM php:8.0-fpm-alpine
LABEL maintainer="info@splintnet.de"

# Download script to install PHP extensions and dependencies
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync

# Install PECL until its included in php8 package
RUN apk add --update \
    $PHPIZE_DEPS \
    && rm -rf /var/cache/apk/*

RUN apk add --no-cache \
    curl \
    git \
    zip unzip \
    && install-php-extensions \
    bcmath \
    bz2 \
    calendar \
    exif \
    gd \
    # imagick \
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
RUN curl -sSLO https://github.com/DataDog/dd-trace-php/releases/download/0.54.0/datadog-php-tracer_0.54.0_noarch.apk && \
    apk add datadog-php-tracer_0.54.0_noarch.apk --allow-untrusted && \
    rm datadog-php-tracer_0.54.0_noarch.apk

# fix work iconv library with alphine
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted gnu-libiconv
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

# PHP config
COPY php.ini /usr/local/etc/php/conf.d/custom.ini

# Install Composer.
RUN echo "Composer V2" && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && ln -s $(composer config --global home) /root/composer
ENV PATH=$PATH:/root/composer/vendor/bin COMPOSER_ALLOW_SUPERUSER=1

# Workdir
WORKDIR /application
