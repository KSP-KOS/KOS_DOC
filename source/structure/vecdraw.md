### VECRDAW  

A structure that allows you to make a drawing of a vector on the screen in map view or in
flight view.

### All suffixes can be Gotten and Set:
* START - Vector - position of the tail of the vector to draw in SHIP-RAW coords.  V(0,0,0) means the ship Center of Mass.
* VEC - Vector - The vector to draw, SHIP-RAW Coords.
* COLOR (or COLOUR works too) - [RGBA](../rgba/index.html) - The color to draw the vector.  (There is a hardcoded fade effect where the tail is a bit more transparent than the head.)
* LABEL - String - Text to show on-screen at the midpoint of the vector.
* SCALE - Number - scalar to multiply by both the START and the VEC
* SHOW - Boolean - Set to true to make the arrow appear, false to hide it. Defaults to false until you're ready to set it to true.

### Two ways to make a VECDRAW:

Build the suffix fields one at a time:

    SET anArrow TO VECDRAW().
    SET anArrow:START TO V(0,0,0).
    SET anArrow:VEC TO V(a,b,c).
    SET anArrow:COLOR TO RGB(1,0,0).
    SET anArrow:LABEL TO "See the arrow?".
    SET anArrow:SCALE TO 5.0.
    SET anArrow:SHOW TO true.

Build the vecdraw all at once with the VECDRAWARGS() function:

    SET anArrow TO VECDRAW( v(0,0,0), v(a,b,c), rgb(1,0,0), "See the arrow?", 5.0, true ).

The above two examples make the same thing.

The arrow should be visible on both the map view and the in-flight view,
but on the map view it will have to be a long arrow to be visible.

VECDRAW's do not auto-update for changes in the vector like a LOCK
would, but if you repeatedly SET the :VEC suffix in a loop, it will
adjust the arrow picture to match as you do so.

Example:

    set xAxis to vecdraw( V(0,0,0), V(1,0,0), RGB(1.0,0.5,0.5), "X axis", 5, true ).
    set yAxis to vecdraw( V(0,0,0), V(0,1,0), RGB(0.5,1.0,0.5), "Y axis", 5, true ).
    set zAxis to vecdraw( V(0,0,0), V(0,0,1), RGB(0.5,0.5,1.0), "Z axis", 5, true ).

To make a vecdraw dissappear, you can either set its :SHOW to false or just UNSET the variable, or re-assign it.

An example using vecdraw can be seen in the [documentation for POSITIONAT](../../command/prediction.md)
