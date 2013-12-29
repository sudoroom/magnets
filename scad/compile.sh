#!/bin/bash

openscad -o sudo.stl sudo.scad

slic3r \
	 --layer-height 0.25 \
	 --perimeters 2 \
	 --top-solid-layers 2 \
	 --nozzle-diameter 0.35 \
	 --filament-diameter 1.75 \
	 --temperature 220 \
	 --print-center 160,50 \
	 --skirts 3 \
	 -o sudo.gcode sudo.stl

sed -i 's/M104 S200/M104 S220/' sudo.gcode
sed -i 's/M109 S200/M109 S220/' sudo.gcode
