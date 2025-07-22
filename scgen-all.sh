#!/bin/bash

cat linux-subsystems | while read line ; do
    ./scgen.sh ${line} > scenario-$(echo ${line} | sed 's/\//-/g').params
done
