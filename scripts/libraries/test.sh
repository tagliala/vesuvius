#!/bin/bash

LIBRARY_VERSION=0.1.0

echo "Vesuvius ${LIBRARY_VERSION} Test Script" > ${HEROKU_VENDOR_DIR}/vesuvius.txt \
  && tar -C ${HEROKU_VENDOR_DIR} -czvf ${TARGET_DIR}/vesuvius-${LIBRARY_VERSION}-heroku.tar.gz .
