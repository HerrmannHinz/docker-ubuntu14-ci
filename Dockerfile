FROM quay.io/actcat/buildpack_php:latest
MAINTAINER Tobias Herrmann Hinz <tobias.hinz@gmail.com>

# install some necesarry packages
RUN apt-get install -y \
  git \
  subversion

# install composer
RUN curl -sS https://getcomposer.org/installer | \
    sudo php -- --install-dir=/usr/bin --filename=composer

# install phpmd latest via phpmd site. PHP Mess Dedector
RUN wget -c http://static.phpmd.org/php/latest/phpmd.phar
RUN mv phpmd.phar /usr/bin/phpmd
RUN chmod +x /usr/bin/phpmd

# debug print
RUN phpmd --version
RUN composer --version
RUN git --version
