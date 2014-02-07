# Solr Drupal
#
# VERSION       1

# use the ubuntu base image provided by dotCloud
FROM stackbrew/ubuntu:raring

MAINTAINER Simon Morvan simon@icilalune.com

# make sure the package repository is up to date
RUN echo "deb http://mir1.ovh.net/ubuntu raring  main restricted universe multiverse" > /etc/apt/sources.list
RUN echo "deb http://ftp.free.fr/mirrors/ftp.ubuntu.com/ubuntu raring  main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get update
#RUN apt-get -y upgrade

#RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -s /bin/true /sbin/initctl

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install  python-setuptools vim-tiny
RUN easy_install supervisor

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y solr-tomcat

RUN apt-get clean

ADD ./start.sh /start.sh
ADD ./foreground.sh /etc/tomcat6/foreground.sh
ADD ./supervisord.conf /etc/supervisord.conf
RUN mv /etc/solr/conf /etc/solr/conf-dist
ADD solr-conf /etc/solr/conf

RUN chmod 755 /start.sh /etc/tomcat6/foreground.sh

EXPOSE 8080
CMD ["/bin/bash", "/start.sh"]
