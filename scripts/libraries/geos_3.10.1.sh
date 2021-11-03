#!/bin/bash

LIBRARY_VERSION=3.10.1
OUTPUT_LIBRARY_NAME="geos-${LIBRARY_VERSION}-heroku.tar.gz"

curl -O https://ftp.osuosl.org/pub/osgeo/download/geos/geos-${LIBRARY_VERSION}.tar.bz2 \
  && tar -xjvf geos-${LIBRARY_VERSION}.tar.bz2 \
  && mkdir build \
  && cd build \
  && cmake ../geos-${LIBRARY_VERSION} -DCMAKE_INSTALL_PREFIX=${HEROKU_VENDOR_DIR} -DBUILD_TESTING=false >&2 >&2 \
  && make -j4 >&2 \
  && make install \
  && tar -C ${HEROKU_VENDOR_DIR} -czvf ${TARGET_DIR}/${OUTPUT_LIBRARY_NAME} . \
  && (cd ${TARGET_DIR} && exec md5sum ${OUTPUT_LIBRARY_NAME} > ${OUTPUT_LIBRARY_NAME}.md5)
