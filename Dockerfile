# by init__0 github.com/samsesh
#
#
# PHP config
FROM nubs/arch-build

MAINTAINER Spencer Rinehart <anubis@overthemonkey.com>

COPY ./php/PKGBUILD php/*.patch /package/

RUN makepkg --force

USER root

RUN pacman --upgrade --noconfirm --noprogressbar php-*-x86_64.pkg.tar.xz

COPY ./php/php.ini /etc/php/php.ini

USER build

CMD ["php"]
# PHP end config

# Apache start config  
FROM httpd:2.4

COPY ./httpd/public-html/ /usr/local/apache2/htdocs/
# Apache end config 

# mySQL start config
FROM mysql/mysql-server:5.5
RUN  yum install -y vim
COPY ./mysql/my.cnf /etc/mysql/my.cnf
# mySQL end config
