#!/bin/bash

LIBRARY_VERSION=0.0.1

echo "Hello Vesuvius" > ${HEROKU_VENDOR_DIR}/vesuvius.txt \
  && tar -C ${HEROKU_VENDOR_DIR} -czvf ${TARGET_DIR}/vesuvius-${LIBRARY_VERSION}-heroku.tar.gz .
