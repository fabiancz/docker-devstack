FROM lyberteam/php-7.1.4-fpm-alpine

USER root
RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev
RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli
