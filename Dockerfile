FROM ubuntu:latest
MAINTAINER jyane <jyane.kstm@gmail.com>

# FROM https://github.com/mono/docker/blob/master/4.4.1.0/Dockerfile
RUN apt-get update \
  && apt-get install -y curl \
  && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb http://download.mono-project.com/repo/debian wheezy/snapshots/4.4.1.0 main" > /etc/apt/sources.list.d/mono-xamarin.list \
  && apt-get update \
  && apt-get install -y binutils mono-devel ca-certificates-mono fsharp mono-vbnc nuget referenceassemblies-pcl wget unzip \
  && rm -rf /var/lib/apt/lists/* /tmp/*
# FROM end

WORKDIR /usr/local/src/
RUN wget http://www.pecastation.org/files/PeerCastStation-2.2.0.zip
RUN unzip PeerCastStation-2.2.0.zip

ADD ./entrypoint.sh /entrypoint.sh

RUN mkdir -p /root/.config/PeerCastStation
ADD ./PecaSettings.xml /root/.config/PeerCastStation/PecaSettings.xml

EXPOSE 7144
CMD ["/entrypoint.sh"]

