FROM ubuntu:latest

RUN apt-get update -qqy
RUN apt-get -y upgrade
RUN apt-get install -y dialog
RUN apt-get install -y apt-utils
RUN apt-get install -y build-essential
RUN apt-get install -y libssl1.0-dev
RUN apt-get install -y liblz4-dev
RUN apt-get install -y libpthread-stubs0-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libsasl2-dev
RUN apt-get install -y libsasl2-modules
RUN apt-get install -y libzstd-dev
RUN apt-get install -y make
RUN apt-get install -y wget
RUN apt-get install -y git
RUN apt-get install -y ca-certificates
RUN apt-get install -y pkg-config
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