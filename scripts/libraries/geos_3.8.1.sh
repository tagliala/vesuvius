#!/bin/bash

LIBRARY_VERSION=3.8.1

curl -O https://ftp.osuosl.org/pub/osgeo/download/geos/geos-${LIBRARY_VERSION}.tar.bz2 \
  && tar -xjvf geos-${LIBRARY_VERSION}.tar.bz2 \
  && cd geos-${LIBRARY_VERSION} \
  && ./configure --prefix=${HEROKU_VENDOR_DIR} \
  && make && make install \
  && tar -C ${HEROKU_VENDOR_DIR} -czvf ${TARGET_DIR}/geos-${LIBRARY_VERSION}-heroku.tar.gz .
