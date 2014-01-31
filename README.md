# Sudo Magnets

These are experiments in 3D-printing fridge magnets for our hackerspace. [Check it out](https://github.com/sudoroom/magnets/blob/master/world/world.stl "'Hack The Planet' magnet!")!

## Why?

Fridge magnets are useful objects, great conversation pieces, and good advertising since people look at them every day!

## How do you print magnets??

The model has a hole for [one of these](http://www.amazon.com/gp/product/B0012ATDD2/ "Is there a non-Amazon link for this?"). The printer pauses while you insert it by hand. It also moves the bed, which hopefully will make a loud distinctive noise to alert you.

## How do I make one?

Almost everything is in the `compile.sh` scripts:
* openscad command to compile an STL
* slic3r command with the exact options we use
* awk command to insert the gcode pause

Right now the scripts also do non-portable stuff like edit my PATH and fix the tempurature for our particular plastic. Sorry, I'll fix it eventually.

## What about text and images?

The world map is from Wikipedia. I prepared images and text in the Inkscape GUI. Someday I'd like to script this with Python and have entirely deterministic magnets.
