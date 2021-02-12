#!/bin/bash

LIBRARY_VERSION=4.9.3

curl -O https://ftp.osuosl.org/pub/osgeo/download/proj/proj-${LIBRARY_VERSION}.tar.gz \
  && tar -xvf proj-${LIBRARY_VERSION}.tar.gz \
  && cd proj-${LIBRARY_VERSION} \
  && ./configure --prefix=${HEROKU_VENDOR_DIR} \
  && make && make install \
  && tar -C ${HEROKU_VENDOR_DIR} -czvf ${TARGET_DIR}/proj-${LIBRARY_VERSION}-heroku.tar.gz .
