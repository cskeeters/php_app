#!/bin/bash

if [[ $1 == "serve" ]]; then
    /usr/bin/supervisord -c /etc/supervisor.conf

elif [[ $1 == "bash" ]]; then
    cd /var/www/app/
    bash

elif [[ $1 == "simple" ]]; then
    cd /var/www/app/public
    php81 -S 0.0.0.0:80
fi
