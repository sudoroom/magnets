#!/bin/bash

slic3r \
	 --nozzle-diameter 0.35 \
	 --layer-height 0.25 \
	 --filament-diameter 1.75 \
	 --temperature 220 \
	 --print-center 150,150 \
	 --support-material \
	 -o heart.gcode heart.stl
