#!/bin/bash

LIBRARY_VERSION=3.6.3

curl -O http://download.osgeo.org/geos/geos-${LIBRARY_VERSION}.tar.bz2 \
  && tar -xjvf geos-${LIBRARY_VERSION}.tar.bz2 \
  && cd geos-${LIBRARY_VERSION} \
  && ./configure --prefix=${HEROKU_VENDOR_DIR} \
  && make && make install \
  && tar -C ${HEROKU_VENDOR_DIR} -czvf ${TARGET_DIR}/geos-${LIBRARY_VERSION}-heroku.tar.gz .
