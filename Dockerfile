############################################################
# Dockerfile to build CentOS,Nginx installed  Container
# Based on CentOS
############################################################

# Set the base image to Ubuntu
FROM centos:7

# File Author / Maintainer
MAINTAINER Kaushal Kishore <kaushal.rahuljaiswal@gmail.com>

# Update library
RUN yum -y update

# Add the ngix and PHP dependent repository
ADD nginx.repo /etc/yum.repos.d/nginx.repo

# Installing nginx 
RUN yum -y install nginx

# Installing PHP
RUN yum -y install epel-release
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm \
&& yum -y --enablerepo=remi,remi-php70w install nginx php70w-cli php70w-devel php70w-fpm php70w-gd php70w-mbstring php70w-mcrypt php70w-mysql php70w-pear php70w-opcache php70w-common

# Installing supervisor
RUN yum install -y python-setuptools
RUN easy_install pip
RUN pip install supervisor


# Adding the configuration file of the nginx
ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf

# Adding the configuration file of the Supervisor
ADD supervisord.conf /etc/

# Adding the default file
ADD index.php /var/www/index.php

# Set the port to 80 
EXPOSE 80

# Executing supervisord
CMD ["supervisord", "-n"]
