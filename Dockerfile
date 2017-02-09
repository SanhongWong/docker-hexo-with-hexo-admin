FROM ubuntu:16.10

MAINTAINER haocen.xu@gmail.com

WORKDIR /blog

VOLUME /blog

EXPOSE 4000

RUN \
  apt-get update && apt-get install -y curl && \
  curl -sL https://deb.nodesource.com/setup_5.x | bash - && apt-get update && apt-get install -y curl nodejs git && \
  mkdir -p /blog && \
  mkdir -p /script

COPY check_empty.sh /script/

RUN chmod +x /script/check_empty.sh

RUN \
  npm install -g hexo-cli

CMD \
  /script/check_empty.sh
