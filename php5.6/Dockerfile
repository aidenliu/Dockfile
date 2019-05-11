FROM ubuntu-14.04:sshd

MAINTAINER Aiden <aidenliu@qq.com>

ENV DEBIAN_FRONTEND noninteractive

# 添加php5.6源
RUN apt-get install -y language-pack-en-base
RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php
RUN apt-get update

# php
 RUN apt-get install -y --force-yes php5.6 php5.6-cli php5.6-dev php5.6-fpm \
 php5.6-curl \
 php5.6-gd \
 php5.6-json \
 php5.6-ldap \
 php5.6-mysql \
 php-gearman \
 php-imagick \
 php5.6-mbstring \
 php5.6-mcrypt \
 php-memcache \
 php-memcached \
 php-mongo \
 php-msgpack \
 php-xhprof \
 php-redis \
 php-msgpack \
 php5.6-xml

# php-xdebug
RUN pecl install xdebug
RUN echo "zend_extension=xdebug.so" > /etc/php/5.6/mods-available/xdebug.ini
RUN ln -s /etc/php/5.6/mods-available/xdebug.ini /etc/php/5.6/fpm/conf.d/xdebug.ini
RUN ln -s /etc/php/5.6/mods-available/xdebug.ini /etc/php/5.6/cli/conf.d/xdebug.ini

# php-rabbitmq
RUN wget http://kr.archive.ubuntu.com/ubuntu/pool/universe/libr/librabbitmq/librabbitmq4_0.7.1-1_amd64.deb
RUN wget http://kr.archive.ubuntu.com/ubuntu/pool/universe/libr/librabbitmq/librabbitmq-dev_0.7.1-1_amd64.deb
RUN dpkg -i librabbitmq4_0.7.1-1_amd64.deb
RUN dpkg -i librabbitmq-dev_0.7.1-1_amd64.deb
RUN rm -rf librabbitmq4_0.7.1-1_amd64.deb
RUN rm -rf librabbitmq-dev_0.7.1-1_amd64.deb
RUN pecl install amqp
RUN echo "extension=amqp.so" > /etc/php/5.6/mods-available/amqp.ini
RUN ln -s /etc/php/5.6/mods-available/amqp.ini /etc/php/5.6/fpm/conf.d/amqp.ini
RUN ln -s /etc/php/5.6/mods-available/amqp.ini /etc/php/5.6/cli/conf.d/amqp.ini

# php-couchbase
RUN wget http://packages.couchbase.com/releases/couchbase-release/couchbase-release-1.0-2-amd64.deb
RUN dpkg -i couchbase-release-1.0-2-amd64.deb
RUN apt-get update
RUN apt-get install -y libcouchbase-dev libcouchbase2-bin build-essential
RUN pecl channel-update pecl.php.net
RUN pecl install pcs-1.3.1
RUN echo "extension=pcs.so" > /etc/php/5.6/mods-available/pcs.ini
RUN ln -s /etc/php/5.6/mods-available/pcs.ini /etc/php/5.6/fpm/conf.d/10-pcs.ini
RUN ln -s /etc/php/5.6/mods-available/pcs.ini /etc/php/5.6/cli/conf.d/10-pcs.ini
RUN pecl install couchbase
RUN echo "extension=couchbase.so" > /etc/php/5.6/mods-available/couchbase.ini
RUN ln -s /etc/php/5.6/mods-available/couchbase.ini /etc/php/5.6/fpm/conf.d/couchbase.ini
RUN ln -s /etc/php/5.6/mods-available/couchbase.ini /etc/php/5.6/cli/conf.d/couchbase.ini
RUN rm -rf couchbase-release-1.0-2-amd64.deb

# php-yar
RUN apt-get install -y libcurl4-gnutls-dev
RUN pecl install yar
RUN echo "extension=yar.so" > /etc/php/5.6/mods-available/yar.ini
RUN ln -s /etc/php/5.6/mods-available/yar.ini /etc/php/5.6/fpm/conf.d/yar.ini
RUN ln -s /etc/php/5.6/mods-available/yar.ini /etc/php/5.6/cli/conf.d/yar.ini

# opencc
RUN apt-get install -y doxygen
ADD ext/opencc/OpenCC /tmp/OpenCC
WORKDIR /tmp/OpenCC
RUN make && make install

# ADD ext/opencc/opencc4php /tmp/opencc4php
WORKDIR /tmp/opencc4php
RUN phpize
RUN ./configure
RUN make && make install
RUN echo "extension=opencc.so" > /etc/php/5.6/mods-available/opencc.ini
RUN ln -s /etc/php/5.6/mods-available/opencc.ini /etc/php/5.6/fpm/conf.d/opencc.ini
RUN ln -s /etc/php/5.6/mods-available/opencc.ini /etc/php/5.6/cli/conf.d/opencc.ini

WORKDIR /

# nginx
RUN apt-get install -y nginx

ADD run.sh /run.sh
RUN chmod +x /run.sh

# 开放80端口
EXPOSE 80

# 执行命令
CMD ["/run.sh"]
