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

# allow Apache modules
RUN sed -i '/LoadModule rewrite_module/s/^#//g' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/LoadModule proxy_module/s/^#//g' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/LoadModule proxy_fcgi_module/s/^#//g' /usr/local/apache2/conf/httpd.conf
