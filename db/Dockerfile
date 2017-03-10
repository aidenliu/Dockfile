# Mysql/MongoDB Dockerfile

FROM ubuntu:sshd

MAINTAINER Aiden <aidenliu@qq.com>

ENV DEBIAN_FRONTEND noninteractive

# Mysql
RUN apt-get install -y mysql-server

# MongoDB
RUN apt-get install -y mongodb-server

ADD run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 3306 27017 28017

CMD ["/run.sh"]