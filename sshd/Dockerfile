# 基础镜像
FROM ubuntu:14.04

MAINTAINER Aiden <aidenliu@qq.com>

# 选择163源
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
ADD sources.list /etc/apt/sources.list
RUN apt-get update

# 安装add-apt-repository
RUN apt-get install -y software-properties-common

# cmake
RUN apt-get install -y cmake

# curl
RUN apt-get install -y curl

# vim
RUN apt-get install -y  vim

# git
RUN apt-get install -y git

# ssh
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN mkdir -p /root/.ssh

ADD authorized_keys /root/.ssh/authorized_keys
ADD run.sh /run.sh
RUN chmod +x /run.sh

# 开放22端口
EXPOSE 22

# 执行命令
CMD ["/run.sh"]