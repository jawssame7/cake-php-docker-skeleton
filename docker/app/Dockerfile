FROM php:8.2-apache

COPY ./docker/app/php.ini /usr/local/etc/php/conf.d/php.ini

RUN apt-get update \
  && apt-get install -y vim unzip libicu-dev libssl-dev libzip-dev libjpeg-dev libpng-dev libfreetype6-dev libonig-dev \
  && docker-php-ext-configure gd \
    --with-freetype=/usr/include/freetype2 \
    --with-jpeg=/usr/include \
  && docker-php-ext-install gd \
  && docker-php-ext-install intl \
  && docker-php-ext-install pdo_mysql mysqli mbstring \
  # mod_rewrite有効化
  && a2enmod rewrite \
  && a2enmod headers

RUN pecl install xdebug && docker-php-ext-enable xdebug
RUN pecl install igbinary && docker-php-ext-enable igbinary
RUN pecl install msgpack && docker-php-ext-enable msgpack
RUN pecl install zip && docker-php-ext-enable zip

COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

EXPOSE 80
CMD ["apache2-foreground"]

