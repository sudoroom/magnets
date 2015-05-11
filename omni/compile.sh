#!/bin/bash

# probably only useful for me, sorry
export PATH=/usr/bin:/usr/bin/core_perl:/usr/bin/vendor_perl

# always execute in THIS dir
self=$(readlink -e "$0") || exit 1
self=$(dirname "${self}") || exit 1
cd "$self"

name=omni
tmpfile=/tmp/.magnet.$EUID.$$.$(date +%s).$RANDOM

ionice -c 3 -p $$
renice -n 19 $$

openscad -o ${name}.stl ${name}.scad

slic3r \
	 --load ../conf/fast_ABS_no-support_pt35nzl_pt27layer-11s.ini \
	 --skirts 3 \
	 -o ${tmpfile} ${name}.stl

sed -i 's/M104 S220/M104 S230/' ${tmpfile}
sed -i 's/M140 S80/M140 S90/' ${tmpfile}

awk '/^G1 Z2.408/ {print "G1 Y200 Z30.000\nG4 P12000"}
	{print}' ${tmpfile} >| ${name}.gcode

rm -f ${tmpfile}