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
RUN pacman -Scc --noconfirm --noprogressbar apache
#RUN systemctl start httpd

COPY ./php/php.ini /etc/php/php.ini

USER build

COPY ./httpd/httpd.conf /etc/httpd/conf/httpd.conf
# COPY ./httpd/public-html/ /srv/http/
COPY ./httpd/public-html/ /var/www/html
EXPOSE 80/tcp
EXPOSE 443/tcp
CMD ["php"]
# Apache end config 

# mySQL start config
FROM mysql/mysql-server:5.5
RUN  yum install -y vim
COPY ./mysql/my.cnf /etc/mysql/my.cnf
EXPOSE 3306/tcp
# mySQL end config
