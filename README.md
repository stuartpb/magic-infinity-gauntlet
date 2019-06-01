# Magic Band 2 Icon Infinity Gauntlet

These are some source files I'm using to build an Infinity Gauntlet with a Magic Band icon in it.

## icon-holder.scad

This is an artifact script that uses the "holder.stl" file from https://www.thingiverse.com/thing:2282434/files (not included in this repo) to generate icon-holder.stl, which is centered around [0,0,0] and doesn't have anything beyond the parts required to hold the icon (allowing it to be embedded into the Gauntlet).

As the output of this operation is included in the repo, you shouldn't have to run this script.

## magic-palm.scad

This uses the "Palm.stl" file from https://www.thingiverse.com/thing:3205209/files (not included in this repo) and the icon-holder.stl from the previous script to produce a variation on the 

Transforms are specified here for this iteration of the Infinity Gauntlet, but the same technique may be used with other models as well: just change the transformations appropriately to the center of the slot you want to put the icon from your Magic Band into.
