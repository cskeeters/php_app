FROM alpine:3.18
RUN apk add --no-cache nginx php81 php81-opcache php81-fpm composer php81-intl supervisor bash vim

# Setup php-fpm
ADD php.ini /etc/php81/
ADD www.conf /etc/php81/php-fpm.d/

# Setup nginx
ADD default.conf /etc/nginx/http.d
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log
RUN mkdir -p /var/log/app

ADD supervisor.conf /etc/supervisor.conf
ADD .bashrc /root/
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.conf"]

# WORKDIR /var/www/app/
# CMD ["composer", "install"]

# Simple development option without nginx (will be single threaded)
# RUN apk add --no-cache php81 
# WORKDIR /var/www/app/public
# CMD ["php81", "-S", "0.0.0.0:80"]

ADD init.sh /
RUN chmod 755 init.sh
ENTRYPOINT ["/init.sh"]
