
FROM ubuntu:14.04

MAINTAINER Anton Golubtsov <agolubts@yandex.ru>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install \
			   cmake \
			   ffi-dev \
			   gcc \
			   nginx \
			   python-dev \
			   python-pip \
			   sed \
			   ssh \
			   supervisor \
			   uwsgi-plugin-python \
			   wget

WORKDIR /tmp
RUN wget -q https://github.com/libgit2/libgit2/archive/v0.20.0.tar.gz
RUN tar xzf v0.20.0.tar.gz
WORKDIR libgit2-0.20.0
WORKDIR cmake . 
WORKDIR cmake install

WORKDIR /
RUN rm -rf /tmp/*

RUN mkdir -p /var/log/nginx/app
RUN mkdir -p /var/log/uwsgi/app/

RUN rm /etc/nginx/sites-enabled/default
COPY flask.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/flask.conf /etc/nginx/sites-enabled/flask.conf
COPY uwsgi.ini /var/www/app/


RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

copy app /var/www/app
RUN pip install -r /var/www/app/requirements.txt


CMD ["/usr/bin/supervisord"]
