FROM ubuntu16.04:latest

MAINTAINER Aiden <aidenliu@qq.com>

ENV DEBIAN_FRONTEND noninteractive

# 添加php7.2源
RUN apt-get install -y language-pack-en-base
RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/pkg-gearman
RUN apt-get update

RUN apt-get -y install php7.2 php7.2-fpm php7.2-dev php7.2-curl \
php7.2-gd php7.2-json php7.2-ldap php7.2-mbstring php7.2-mysql \
php7.2-xml php-imagick php-mongodb php-msgpack php-redis php-gearman php-memcache php-memcached php-tideways php-xdebug


# php-yar
RUN apt-get install -y libcurl4-gnutls-dev
RUN pecl install yar
RUN echo "extension=yar.so" > /etc/php/7.2/mods-available/yar.ini
RUN ln -s /etc/php/7.2/mods-available/yar.ini /etc/php/7.2/fpm/conf.d/yar.ini
RUN ln -s /etc/php/7.2/mods-available/yar.ini /etc/php/7.2/cli/conf.d/yar.ini


# php-couchbase
RUN wget http://packages.couchbase.com/releases/couchbase-release/couchbase-release-1.0-6-amd64.deb
RUN dpkg -i couchbase-release-1.0-6-amd64.deb
RUN apt-get update
RUN apt-get install -y libcouchbase-dev build-essential zlib1g-dev
RUN pecl install couchbase
RUN echo "extension=couchbase.so" > /etc/php/7.2/mods-available/couchbase.ini
RUN ln -s /etc/php/7.2/mods-available/couchbase.ini /etc/php/7.2/fpm/conf.d/couchbase.ini
RUN ln -s /etc/php/7.2/mods-available/couchbase.ini /etc/php/7.2/cli/conf.d/couchbase.ini
RUN rm -rf couchbase-release-1.0-6-amd64.deb

# php-rabbitmq
RUN apt-get install -y librabbitmq-dev
RUN pecl install amqp
RUN echo "extension=amqp.so" > /etc/php/7.2/mods-available/amqp.ini
RUN ln -s /etc/php/7.2/mods-available/amqp.ini /etc/php/7.2/fpm/conf.d/amqp.ini
RUN ln -s /etc/php/7.2/mods-available/amqp.ini /etc/php/7.2/cli/conf.d/amqp.ini

# opencc
RUN apt-get install -y python
RUN apt-get install -y doxygen
WORKDIR /tmp
RUN git clone https://github.com/BYVoid/OpenCC.git --depth 1
WORKDIR /tmp/OpenCC
RUN make && make install

WORKDIR /tmp
RUN git clone https://github.com/nauxliu/opencc4php.git
WORKDIR /tmp/opencc4php
RUN phpize
RUN ./configure
RUN make && make install
RUN echo "extension=opencc.so" > /etc/php/7.2/mods-available/opencc.ini
RUN ln -s /etc/php/7.2/mods-available/opencc.ini /etc/php/7.2/fpm/conf.d/opencc.ini
RUN ln -s /etc/php/7.2/mods-available/opencc.ini /etc/php/7.2/cli/conf.d/opencc.ini

WORKDIR /

# nginx
RUN apt-get install -y nginx

ADD run.sh /run.sh
RUN chmod +x /run.sh

# 开放80端口
EXPOSE 80

# 执行命令
CMD ["/run.sh"]





