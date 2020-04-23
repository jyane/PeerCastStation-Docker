# PeerCastStation-Docker

PeerCastStation on Docker

PeerCastStation を Docker で動かすものです
[Docker Hub](https://hub.docker.com/r/jyane/pecastation/)

## Usage

``` sh
docker run -it -p 7144:7144 jyane/pecastation
```

or

``` sh
docker run -it -p 7144:7144 -v ${pwd}:/root/.config/PeerCastStation pecastation:latest mono /usr/local/src/PeerCastStation-2.6.2/PeerCastStation.exe
```
