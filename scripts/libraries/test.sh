#!/bin/bash

VESUVIUS_VERSION=0.0.1

echo "Hello Vesuvius" > ${HEROKU_VENDOR_DIR}/vesuvius.txt \
  && tar -C ${HEROKU_VENDOR_DIR} -czvf ${BASE_DIR}/public/libraries/vesuvius-${VESUVIUS_VERSION}-heroku.tar.gz .
