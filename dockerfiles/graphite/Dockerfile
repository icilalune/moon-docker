# Solr Drupal
#
# VERSION       1

# use the ubuntu base image provided by dotCloud
FROM ubuntu:precise

MAINTAINER Simon Morvan simon@icilalune.com

# make sure the package repository is up to date
RUN echo "deb http://mir1.ovh.net/ubuntu precise main restricted universe multiverse" > /etc/apt/sources.list
RUN echo "deb http://mir1.ovh.net/ubuntu precise-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://ftp.free.fr/mirrors/ftp.ubuntu.com/ubuntu precise main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://ftp.free.fr/mirrors/ftp.ubuntu.com/ubuntu precise-updates main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update
#RUN apt-get -y upgrade

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git wget apache2 apache2-mpm-worker apache2-utils apache2.2-bin apache2.2-common libapr1 libaprutil1 libaprutil1-dbd-sqlite3 build-essential python3.2 python-dev libpython3.2 python3-minimal libapache2-mod-wsgi libaprutil1-ldap memcached python-cairo-dev python-django python-ldap python-memcache python-pysqlite2 sqlite3 erlang-os-mon erlang-snmp rabbitmq-server bzr expect libapache2-mod-python python-setuptools python-software-properties

RUN apt-add-repository ppa:chris-lea/node.js

RUN apt-get -y install nodejs

RUN apt-get clean

RUN easy_install django-tagging zope.interface twisted==11.1.0 txamqp daemonize


RUN cd /root ; wget https://launchpad.net/graphite/0.9/0.9.10/+download/graphite-web-0.9.10.tar.gz
RUN cd /root ; wget https://launchpad.net/graphite/0.9/0.9.10/+download/carbon-0.9.10.tar.gz
RUN cd /root ; wget https://launchpad.net/graphite/0.9/0.9.10/+download/whisper-0.9.10.tar.gz
RUN cd /root ; find *.tar.gz -exec tar -zxvf '{}' \;

RUN cd /root/whisper* ; python setup.py install

RUN cd /root/carbon* ; python setup.py install

RUN cd /root/graphite* ; python setup.py install

RUN cp /opt/graphite/conf/carbon.conf.example /opt/graphite/conf/carbon.conf
ADD conf/storage-schemas.conf /opt/graphite/conf/storage-schemas.conf
RUN cd /opt/graphite/webapp/graphite/ ; python manage.py syncdb --noinput

RUN cp /opt/graphite/webapp/graphite/local_settings.py.example /opt/graphite/webapp/graphite/local_settings.py

ADD conf/apache.conf /etc/apache2/sites-available/default
RUN cp /opt/graphite/conf/graphite.wsgi.example /opt/graphite/conf/graphite.wsgi
RUN chown -R www-data:www-data /opt/graphite/storage
RUN mkdir -p /etc/httpd/wsgi

RUN cd /opt ; git clone git://github.com/etsy/statsd.git

ADD conf/statsd.localConfig.js /opt/statsd/localConfig.js



ADD start.sh /start.sh

EXPOSE 80
CMD ["/bin/bash", "/start.sh"]

