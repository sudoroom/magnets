#!/bin/bash

# probably only useful for me, sorry
export PATH=/usr/bin:/usr/bin/core_perl:/usr/bin/vendor_perl

# always execute in THIS dir
self=$(readlink -e "$0") || exit 1
self=$(dirname "${self}") || exit 1
cd "$self"

name=sphere

ionice -c 3 -p $$
renice -n 19 $$

openscad -o ${name}.stl ${name}.scad

slic3r \
	 --load ../conf/fine_ABS_no-support_pt35nzl_pt14layer-6s.ini \
	 --perimeters 2 \
	 --skirts 4 \
	 -o ${name}.gcode ${name}.stl
