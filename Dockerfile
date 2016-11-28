FROM quay.io/actcat/buildpack_php:latest
MAINTAINER HerrmannHinz <herrmann.hinz@gmail.com>

# install some necesarry packages
RUN apt-get update && apt-get install -y \
  git \
  subversion

# install phpmd latest via phpmd site. PHP Mess Dedector
RUN wget -c http://static.phpmd.org/php/latest/phpmd.phar
RUN mv phpmd.phar /usr/bin/phpmd
RUN chmod +x /usr/bin/phpmd

# debug print
RUN phpmd --version
RUN git --version
