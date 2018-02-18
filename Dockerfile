FROM ubuntu:16.04

ENV BUILD_DIR /opt/eos

WORKDIR $BUILD_DIR

ARG BUILD_VERSION

### Install dependencies

RUN apt-get update && apt-get install -y \
  build-essential git wget curl

RUN mkdir -p $BUILD_DIR && cd $BUILD_DIR && git clone https://github.com/eosio/eos --recursive .
RUN git checkout $BUILD_VERSION
RUN sed -i -e 's/sudo //g' scripts/install_dependencies.sh

RUN ./build.sh ubuntu full

### Configure

ENV BINDIR=/opt/eos/build/install/bin

RUN cd /opt/eos/build && make install

RUN sed -i -e 's/fno-exceptions -I/fno-exceptions -I .\/.. -I/g' $BINDIR/eoscpp

ENV PATH="$PATH:$BINDIR"

COPY ./data-dir /opt/eos/build/programs/eosd/data-dir

WORKDIR /opt/eos/build/programs/eosd

CMD './eosd'