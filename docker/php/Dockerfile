FROM php:8.2-fpm

RUN apt-get update -y

RUN apt-get install -y  \
    git \
    unzip \
    zip

RUN mkdir ~/.ssh
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

USER 1000:1000
COPY --from=composer /usr/bin/composer /usr/bin/composer

ADD docker/php/xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini