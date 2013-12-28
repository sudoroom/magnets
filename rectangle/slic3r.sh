#!/bin/bash

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
	 --support-material-spacing 40 \
	 --support-material-interface-layers 0 \
	 -o rectangle.gcode rectangle.stl
