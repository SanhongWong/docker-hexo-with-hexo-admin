FROM ubuntu:16.10

MAINTAINER haocen.xu@gmail.com

WORKDIR /blog

VOLUME /blog

EXPOSE 4000

RUN \
  cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' > /etc/timezone && \
  echo '' > /etc/apt/sources.list && \
  echo 'deb-src http://archive.ubuntu.com/ubuntu xenial main restricted #Added by software-properties' >> /etc/apt/sources.list & 
  echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted' >> /etc/apt/sources.list & 
  echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted multiverse universe #Added by software-properties' >> /etc/apt/sources.list & 
  echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted' >> /etc/apt/sources.list & 
  echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted multiverse universe #Added by software-properties' >> /etc/apt/sources.list & 
  echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial universe' >> /etc/apt/sources.list & 
  echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe' >> /etc/apt/sources.list & 
  echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial multiverse' >> /etc/apt/sources.list & 
  echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-updates multiverse' >> /etc/apt/sources.list & 
  echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse' >> /etc/apt/sources.list & 
  echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse #Added by software-properties' >> /etc/apt/sources.list & 
  echo 'deb http://archive.canonical.com/ubuntu xenial partner' >> /etc/apt/sources.list & 
  echo 'deb-src http://archive.canonical.com/ubuntu xenial partner' >> /etc/apt/sources.list & 
  echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted' >> /etc/apt/sources.list & 
  echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted multiverse universe #Added by software-properties' >> /etc/apt/sources.list & 
  echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe' >> /etc/apt/sources.list & 
  echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-security multiverse' >> /etc/apt/sources.list &
  apt-get update && apt-get install -y curl && \
  curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get update && apt-get install -y nodejs git cron && \
  mkdir -p /blog && \
  mkdir -p /script

COPY init.sh /script/

RUN chmod +x /script/init.sh

RUN \
  npm install -g hexo-cli

CMD \
  /script/init.sh
