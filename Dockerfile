FROM mono:latest
MAINTAINER jyane <jyane.kstm@gmail.com>

RUN apt-get update \
  && apt-get install -y wget unzip

WORKDIR /usr/local/src/
RUN wget http://www.pecastation.org/files/PeerCastStation-2.6.2.zip
RUN unzip PeerCastStation-2.6.2.zip

EXPOSE 7144
