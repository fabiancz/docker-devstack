FROM php:7.3.27-fpm-alpine

# Set the time zone
ENV TZ=Europe/Prague
RUN touch /etc/timezone \
    && echo "Europe/Prague" > /etc/timezone
RUN apk update \
    && apk upgrade \
    && apk add ca-certificates && update-ca-certificates \
    && apk add --update tzdata \
    && rm -rf /var/cache/apk/*

#composer
RUN curl -sSL https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
