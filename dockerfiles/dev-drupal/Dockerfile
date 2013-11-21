# Dev Drupal
#
# VERSION       1

# use the ubuntu base image provided by dotCloud
FROM ubuntu

MAINTAINER Simon Morvan simon@icilalune.com

# make sure the package repository is up to date
RUN echo "deb http://mir1.ovh.net/ubuntu raring main restricted universe multiverse" > /etc/apt/sources.list
RUN echo "deb http://ftp.free.fr/mirrors/ftp.ubuntu.com/ubuntu raring main restricted universe multiverse" > /etc/apt/sources.list
RUN apt-get update
#RUN apt-get -y upgrade

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install bzip2 git mysql-client mysql-server apache2 libapache2-mod-php5 pwgen python-setuptools vim-tiny php5-mysql php-apc php5-gd php5-curl php5-memcache php5-xdebug memcached drush mc

RUN apt-get clean
# Make mysql listen on the outside
RUN sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf

RUN easy_install supervisor
ADD ./start.sh /start.sh
ADD ./foreground.sh /etc/apache2/foreground.sh
ADD ./supervisord.conf /etc/supervisord.conf

RUN chmod 755 /start.sh /etc/apache2/foreground.sh
EXPOSE 80
VOLUME /project
RUN rm -rf /var/www ; ln -s /project/www /var/www
CMD ["/bin/bash", "/start.sh"]
