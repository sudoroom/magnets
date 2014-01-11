#!/bin/bash

# probably only useful for me, sorry
export PATH=/usr/bin:/usr/bin/core_perl:/usr/bin/vendor_perl

# always execute in THIS dir
self=$(readlink -e "$0") || exit 1
self=$(dirname "${self}") || exit 1
cd "$self"

name=heart
tmpfile=/tmp/.magnet.$EUID.$$.$(date +%s).$RANDOM

openscad -o ${name}.stl ${name}.scad

slic3r \
	 --layer-height 0.25 \
	 --perimeters 1 \
	 --solid-layers 3 \
	 --nozzle-diameter 0.35 \
	 --filament-diameter 1.75 \
	 --temperature 220 \
	 --print-center 180,50 \
	 --skirts 3 \
	 --fill-density 0.4 \
	 -o ${tmpfile} ${name}.stl

sed -i 's/M104 S200/M104 S220/' ${tmpfile}
sed -i 's/M109 S200/M109 S220/' ${tmpfile}

awk '/^G1 Z2.60/ {print "G1 Z6\nM226"}
	{print}' ${tmpfile} >| ${name}.gcode

rm -f ${tmpfile}
