FROM httpd:2.4-alpine

# Set the time zone
ENV TZ=Europe/Prague
RUN touch /etc/timezone \
    && echo "Europe/London" > /etc/timezone
RUN apk update \
    && apk upgrade \
    && apk add ca-certificates && update-ca-certificates \
    && apk add --update tzdata \
    && rm -rf /var/cache/apk/*

# insert vhosts conf into origin apache conf
RUN echo "Include /usr/local/apache2/conf/vhosts/*.conf" \
   >> /usr/local/apache2/conf/httpd.conf
