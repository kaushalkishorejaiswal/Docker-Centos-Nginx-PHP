#!/usr/bin/env bash

# Installing PHP
yum -y install epel-release
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum -y --enablerepo=remi,remi-php70w install nginx php70w-cli php70w-devel php70w-fpm php70w-gd php70w-mbstring php70w-mcrypt php70w-mysql php70w-pear php70w-opcache php70w-common

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer

/usr/local/bin/composer global require "laravel/installer"