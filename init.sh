#!/bin/bash

CACHE=${MAGPIE_ROOT}/._magpie_cache
ARCHIVE=linux-6.6.tar.gz
SRC=${CACHE}/${ARCHIVE}

mkdir -p ${CACHE}

if [ ! -f ${SRC} ] ; then
    wget -O ${SRC} https://cdn.kernel.org/pub/linux/kernel/v6.x/${ARCHIVE}
fi

tar -xf ${SRC}
