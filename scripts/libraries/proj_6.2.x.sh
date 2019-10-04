#!/bin/bash

LIBRARY_VERSION=6.2.0

# Fix sqlite3 flags
# The standard parameter `-lsqlite3` was being replaced at link time by
# `/usr/lib/x86_64-linux-gnu/libsqlite3.so`, that is not correct.
# Ref: https://github.com/OSGeo/proj.4/issues/1412
SQLITE3_LIBDIR=`which sqlite3 | sed 's/bin\/sqlite3/lib\/x86_64-linux-gnu/g'`
export SQLITE3_LIBS="-L${SQLITE3_LIBDIR} -l:libsqlite3.so.0.8.6"

curl -O http://download.osgeo.org/proj/proj-${LIBRARY_VERSION}.tar.gz \
  && tar -xvf proj-${LIBRARY_VERSION}.tar.gz \
  && cd proj-${LIBRARY_VERSION} \
  && ./configure --prefix=${HEROKU_VENDOR_DIR} \
  && make && make install \
  && tar -C ${HEROKU_VENDOR_DIR} -czvf ${TARGET_DIR}/proj-${LIBRARY_VERSION}-heroku.tar.gz .
