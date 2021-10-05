#!/bin/bash

LIBRARY_VERSION=8.1.1
OUTPUT_LIBRARY_NAME=proj-${LIBRARY_VERSION}-heroku.tar.gz

# Make PROJ's FindSqlite3.cmake happy
SQLITE3_DIR=`which sqlite3 | sed 's/bin\/sqlite3//g'`

mkdir -p ~/.sqlite &&
  ln -s ${SQLITE3_DIR}/include ~/.sqlite/include &&
  ln -s ${SQLITE3_DIR}/lib/x86_64-linux-gnu ~/.sqlite/lib
  ln -fs /usr/lib/x86_64-linux-gnu/libsqlite3.so.0 ~/.sqlite/lib/libsqlite3.so

export LIB_DIR=~/.sqlite

curl -O https://download.osgeo.org/proj/proj-${LIBRARY_VERSION}.tar.gz \
  && curl -O https://download.osgeo.org/proj/proj-${LIBRARY_VERSION}.tar.gz.md5 \
  && md5sum -c proj-${LIBRARY_VERSION}.tar.gz.md5 \
  && tar -xvf proj-${LIBRARY_VERSION}.tar.gz \
  && mkdir build \
  && cd build \
  && cmake ../proj-${LIBRARY_VERSION} -DCMAKE_INSTALL_PREFIX=${HEROKU_VENDOR_DIR} >&2 -DBUILD_TESTING=false >&2 \
  && make -j4 >&2 \
  && make install \
  && tar -C ${HEROKU_VENDOR_DIR} -czvf ${TARGET_DIR}/${OUTPUT_LIBRARY_NAME} . \
  && (cd ${TARGET_DIR} && exec md5sum ${OUTPUT_LIBRARY_NAME} > ${OUTPUT_LIBRARY_NAME}.md5)
