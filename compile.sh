#!/bin/bash

cd linux-6.6

tmp=.tmp.args

for arg in ${@} ; do
    echo "--define ${arg}" >> ${tmp}
done

klocalizer			\
    --arch x86_64		\
    --match .config		\
    --show-unsat-core		\
    $(paste -s -d ' ' ${tmp})

if [[ $? -ne 0 ]]; then
    exit 1
fi

rm ${tmp}
make olddefconfig
make -j$(nproc)

if [[ $? -ne 0 ]]; then
    exit 1
fi
