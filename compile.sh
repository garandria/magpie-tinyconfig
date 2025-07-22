#!/bin/bash

pushd linux-6.6

tmp=.tmp.args

for arg in ${@} ; do
    echo "--define ${arg}" >> ${tmp}
done

klocalizer			\
    --arch x86_64		\
    --match .config		\
    --show-unsat-core		\
    $(paste -s -d ' ' ${tmp})	\
|| exit 1
rm ${tmp}
make olddefconfig
make -j$(nproc)

popd
