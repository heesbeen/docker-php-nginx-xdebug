FROM php:8.1-fpm

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

ADD docker/php/xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini