#!/bin/bash

LIBRARY_VERSION=0.1.0
OUTPUT_LIBRARY_NAME="vesuvius-${LIBRARY_VERSION}-heroku.tar.gz"

echo "Vesuvius ${LIBRARY_VERSION} Test Script" > ${HEROKU_VENDOR_DIR}/vesuvius.txt \
  && tar -C ${HEROKU_VENDOR_DIR} -czvf ${TARGET_DIR}/${OUTPUT_LIBRARY_NAME} . \
  && (cd ${TARGET_DIR} && exec md5sum ${OUTPUT_LIBRARY_NAME} > ${OUTPUT_LIBRARY_NAME}.md5)
