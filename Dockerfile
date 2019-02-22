FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qqy && apt-get -y upgrade
RUN apt-get install -y dialog apt-utils build-essential libssl1.0-dev liblz4-dev libpthread-stubs0-dev libssl-dev libsasl2-dev libsasl2-modules libzstd-dev make wget git ca-certificates pkg-config
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/edenhill/librdkafka.git && cd librdkafka && ./configure --prefix /usr && make && make install

RUN wget https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.11.5.linux-amd64.tar.gz
RUN mkdir -p $HOME/go/bin
RUN mkdir -p $HOME/go/pkg
RUN mkdir -p $HOME/go/src
ENV GOROOT /usr/local/go
ENV GOPATH "$HOME/go"
ENV PATH "$PATH:$GOROOT/bin:$GOPATH/bin"