#!/bin/bash

cd linux-6.6

klocalizer			\
    --arch x86_64		\
    --match .config		\
    --show-unsat-core		\
    ${@}

if [[ $? -ne 0 ]]; then
    exit 1
fi

make olddefconfig
make -j$(nproc)

if [[ $? -ne 0 ]]; then
    exit 1
fi
