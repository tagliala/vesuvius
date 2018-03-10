#!/bin/bash

LIBRARY_VERSION=5.0.0

curl -O http://download.osgeo.org/proj/proj-${LIBRARY_VERSION}.tar.gz \
  && tar -xvf proj-${LIBRARY_VERSION}.tar.gz \
  && cd proj-${LIBRARY_VERSION} \
  && ./configure --prefix=${HEROKU_VENDOR_DIR} \
  && make && make install \
  && tar -C ${HEROKU_VENDOR_DIR} -czvf ${TARGET_DIR}/proj-${LIBRARY_VERSION}-heroku.tar.gz .
