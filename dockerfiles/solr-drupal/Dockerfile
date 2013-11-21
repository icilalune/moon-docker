# Solr Drupal
#
# VERSION       1

# use the ubuntu base image provided by dotCloud
FROM ubuntu

MAINTAINER Simon Morvan simon@icilalune.com

# make sure the package repository is up to date
RUN echo "deb http://mir1.ovh.net/ubuntu raring main restricted universe multiverse" > /etc/apt/sources.list
RUN echo "deb http://ftp.free.fr/mirrors/ftp.ubuntu.com/ubuntu raring main restricted universe multiverse" > /etc/apt/sources.list
RUN mkdir -p /etc/apt/conf.d
RUN echo "Acquire::http::Proxy \"http://utilisateur:motdepasse@example.com:port\";" > /etc/apt/conf.d/proxy

RUN apt-get update
#RUN apt-get -y upgrade

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y solr-tomcat python-setuptools vim-tiny

RUN apt-get clean

RUN easy_install supervisor

ADD ./start.sh /start.sh
ADD ./foreground.sh /etc/tomcat6/foreground.sh
ADD ./supervisord.conf /etc/supervisord.conf

RUN mv /etc/solr/conf /etc/solr/conf-dist
ADD solr-conf /etc/solr/conf

RUN chmod 755 /start.sh /etc/tomcat6/foreground.sh
EXPOSE 8080
CMD ["/bin/bash", "/start.sh"]

