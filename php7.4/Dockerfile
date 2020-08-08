FROM php:7.4-fpm-alpine
LABEL maintainer="info@splintnet.de"

# Download script to install PHP extensions and dependencies
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync

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
RUN curl -sSLO https://github.com/DataDog/dd-trace-php/releases/download/0.47.1/datadog-php-tracer_0.47.1_noarch.apk && \
    apk add datadog-php-tracer_0.47.1_noarch.apk --allow-untrusted && \
    rm datadog-php-tracer_0.47.1_noarch.apk

# PHP config
COPY php.ini /usr/local/etc/php/conf.d/custom.ini

# Install Composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && ln -s $(composer config --global home) /root/composer
ENV PATH=$PATH:/root/composer/vendor/bin COMPOSER_ALLOW_SUPERUSER=1

# Install prestissimo (composer plugin). Plugin that downloads packages in parallel to speed up the installation process
# After release of Composer 2.x, remove prestissimo, because parallelism already merged into Composer 2.x branch:
# https://github.com/composer/composer/pull/7904
RUN composer global require hirak/prestissimo

# Workdir
WORKDIR /application