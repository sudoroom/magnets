#!/bin/bash

openscad -o rectangle.stl rectangle.scad

slic3r \
	 --layer-height 0.25 \
	 --perimeters 1 \
	 --top-solid-layers 2 \
	 --nozzle-diameter 0.35 \
	 --filament-diameter 1.75 \
	 --temperature 220 \
	 --print-center 150,150 \
	 --support-material \
	 --support-material-pattern rectilinear \
	 --support-material-spacing 80 \
	 --support-material-interface-layers 1 \
	 --skirts 3 \
	 -o rectangle.gcode rectangle.stl

sed -i 's/M104 S200/M104 S220/' rectangle.gcode
sed -i 's/M109 S200/M109 S220/' rectangle.gcode
