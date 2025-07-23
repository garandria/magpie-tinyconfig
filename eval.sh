#!/bin/bash

cd linux-6.6
size=$(du -b vmlinux | cut -f1)

echo "MAGPIE_FITNESS: ${size}"
