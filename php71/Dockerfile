FROM php:7.1.4-fpm-alpine

# Set the time zone
ENV TZ=Europe/Prague
RUN touch /etc/timezone \
    && echo "Europe/Prague" > /etc/timezone
RUN apk update \
    && apk upgrade \
    && apk add ca-certificates && update-ca-certificates \
    && apk add --update tzdata \
    && rm -rf /var/cache/apk/*

RUN apk update && apk add  --no-cache \
    git \
    mysql-client \
    curl \
    mc \
    libmcrypt \
    libmcrypt-dev \
    libxml2-dev \
    freetype \
    freetype-dev \
    libpng \
    libpng-dev \
    libjpeg-turbo \
    libjpeg-turbo-dev g++ make autoconf

RUN docker-php-source extract \
    && docker-php-ext-install gd \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install mcrypt pdo_mysql soap

#composer
RUN curl -sSL https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

USER www-data

CMD ["php-fpm"]

EXPOSE 9000

USER root
RUN  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*