#!/bin/bash

# probably only useful for me, sorry
export PATH=/usr/bin:/usr/bin/core_perl:/usr/bin/vendor_perl

# always execute in THIS dir
self=$(readlink -e "$0") || exit 1
self=$(dirname "${self}") || exit 1
cd "$self"

name=sudo
tmpfile=/tmp/.magnet.$EUID.$$.$(date +%s).$RANDOM

openscad -o ${name}.stl ${name}.scad

slic3r \
	 --layer-height 0.25 \
	 --perimeters 1 \
	 --solid-layers 4 \
	 --nozzle-diameter 0.35 \
	 --filament-diameter 1.75 \
	 --temperature 220 \
	 --print-center 150,100 \
	 --skirts 2 \
	 --fill-density 0.14 \
	 -o ${tmpfile} ${name}.stl

sed -i 's/M104 S200/M104 S220/' ${tmpfile}
sed -i 's/M109 S200/M109 S220/' ${tmpfile}

awk '/^G1 Z2.35/ {print "G1 Z60.000\nG4 P12000"}
	{print}' ${tmpfile} >| ${name}.gcode

rm -f ${tmpfile}
