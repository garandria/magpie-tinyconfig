#!/bin/bash

# Generate one scenario per subsystem

subsys=${1}
tmp=.tmp
grep ${subsys} linux-6.6-x86-options | cut -d, -f1-2 > ${tmp}
cat <(grep bool ${tmp}) <(grep tristate ${tmp}) | cut -d, -f1 > ${tmp}.2
mv ${tmp}.2 ${tmp}
cat <<EOF
TIMING="compile"
CLI_PREFIX=""
CLI_GLUE="="
CLI_BOOLEAN_PREFIX_TRUE="--define CONFIG_"
CLI_BOOLEAN_PREFIX_FALSE="--undefine CONFIG_"
CLI_BOOLEAN="prefix"
EOF
cat ${tmp} | while read option ; do
    printf "${option} {True, False}"
    if grep -q "CONFIG_${option}=" linux-6.6-x86.defconfig  ; then
	echo "[True]"
    else
	echo "[False]"
    fi
done
