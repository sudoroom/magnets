#!/bin/bash

slic3r \
	 --nozzle-diameter 0.35 \
	 --layer-height 0.25 \
	 --top-solid-layers 6 \
	 --filament-diameter 1.75 \
	 --temperature 220 \
	 --print-center 150,150 \
	 --support-material \
	 --support-material-pattern rectilinear \
	 --support-material-spacing 2.5 \
	 -o heart.gcode heart.stl
