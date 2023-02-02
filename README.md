# php_app

This repository builds a docker image for running web apps written in php

# Build

```shell
make build
```

# Inspect

```shell
make shell
composer install
```

# Detail

* Starts from [Alpine Linux](https://www.alpinelinux.org/)
* Adds [php 8.1](https://www.php.net/) with intl.so (supports ext-intl)
* Adds [php-fpm](https://www.php.net/manual/en/install.fpm.php)
* Adds [nginx](https://www.nginx.com/)
* Adds [composer](https://getcomposer.org/)
* Adds [supervisor](http://supervisord.org/) for running nginx and php-fpm in one container
* Adds bash with ll alias
* Adds vim
* Configured to use ./app as volume in /var/www/app
* `init.sh` script enables the container to be used for different functions

# Motivation

* This enables me to have a single container to run a php web application
* The version of php and composer come from the Apine package repository so they are tested to work
* I can inspect the container with bash
