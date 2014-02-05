#!/bin/bash

# probably only useful for me, sorry
export PATH=/usr/bin:/usr/bin/core_perl:/usr/bin/vendor_perl

# always execute in THIS dir
self=$(readlink -e "$0") || exit 1
self=$(dirname "${self}") || exit 1
cd "$self"

name=world
tmpfile=/tmp/.magnet.$EUID.$$.$(date +%s).$RANDOM

ionice -c 3 -p $$
renice -n 19 $$

openscad -o ${name}.stl ${name}.scad

slic3r \
	 --layer-height 0.25 \
	 --perimeters 1 \
	 --top-solid-layers 5 \
	 --bottom-solid-layers 3 \
	 --nozzle-diameter 0.35 \
	 --filament-diameter 1.75 \
	 --temperature 220 \
	 --print-center 200,30 \
	 --skirts 2 \
	 --fill-density 0.12 \
	 -o ${tmpfile} ${name}.stl

sed -i 's/M104 S200/M104 S220/' ${tmpfile}
sed -i 's/M109 S200/M109 S220/' ${tmpfile}

awk '/^G1 Z2.35/ {print "G1 Z60.000\nG4 P12000"}
	{print}' ${tmpfile} >| ${name}.gcode

rm -f ${tmpfile}
