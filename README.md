# Vesuvius, a Vulcan replacement
[![Donate once-off to this project using Bitcoin](https://img.shields.io/badge/bitcoin-donate-blue.svg)](bitcoin:1L6sqoG8xXhYziH9NGjPzgR1dEP2SbJrfM)

Build libraries on Heroku without pain.

## Why Vesuvius?

[Vulcan](https://github.com/heroku/vulcan) has been deprecated and GCC is only available [at build time](https://devcenter.heroku.com/articles/stack-packages) on `heroku-16` stack.

Even with `heroku run bash`, compiling stuff on Heroku was painful, time consuming, and you needed a third-party cloud storage to move your compiled library in order to download it.

With **Vesuvius**, this is no longer the case. During the deploy, **Vesuvius** will run all scripts located in `/scripts/libraries` and will move output files to a public directory.

It comes with [PROJ](https://proj.org/) and [GEOS](https://libgeos.org/) as examples.

## Disclaimer

Libraries build by Vesuvius are for demonstration purposes only. Do not use them in you
production environment because they may change anytime.

## Automatic Setup

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## Manual Setup

1. Clone the repo
2. Create a new Heroku application
3. Set your buildpack to Heroku's apt buildpack
```sh
heroku buildpacks:set https://github.com/heroku/heroku-buildpack-apt
```
4. Add Heroku's Ruby buildpack
```sh
heroku buildpacks:add heroku/ruby
```

Deploy and navigate to your application's root path.

## Example script

All you need to do is create a bash script to compile your library and save it
under the `scripts/libraries` folder.

This is an example for the GEOS library:
```shell
#!/bin/bash

LIBRARY_VERSION=3.11.1
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
```

## How to use the compiled libraries

Take a look at [heroku-buildpack-vendorbinaries](https://github.com/diowa/heroku-buildpack-vendorbinaries).

[RGeo-Sinatra](https://rgeo-sinatra.herokuapp.com/) uses Vesuvius

## Authors

**Geremia Taglialatela**

+ https://github.com/tagliala
+ https://twitter.com/gtagliala
