#!/bin/bash

BUILD_VERSION="${1:-DAWN-2018-02-14}"

docker build --build-arg BUILD_VERSION=$BUILD_VERSION -t oxyaction/eos:$BUILD_VERSION .