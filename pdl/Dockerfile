# 基础镜像
FROM sshd:ubuntu

MAINTAINER Aiden <aidenliu@qq.com>

# python
RUN apt-get install -y python

# c
RUN apt-get install -y gcc

#golang
RUN wget https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.7.1.linux-amd64.tar.gz
RUN rm -rf go1.7.1.linux-amd64.tar.gz
RUN export PATH=$PATH:/usr/local/go/bin
RUN echo PATH=$PATH:/usr/local/go/bin >> /etc/profile

# 开放8080端口
EXPOSE 8080