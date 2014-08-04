VECRDAW  
========

A structure that allows you to make a drawing of a vector on the screen in map view or in
flight view.

Suffix      | Type      | Get | Set | Description
------------|-----------|-----|-----|--------------------------------------
:START      | Vector | yes | yes | Optional, defaults to V(0,0,0) - position of the tail of the vector to draw in SHIP-RAW coords.  V(0,0,0) means the ship Center of Mass.
:VEC        | Vector | yes | yes | Mandatory - The vector to draw, SHIP-RAW Coords.
:COLOR (or COLOUR works too) | [Color](../rgba/index.html) | yes | yes | Optional, defaults to white. This is the color to draw the vector.  (There is a hardcoded fade effect where the tail is a bit more transparent than the head.)
:LABEL      | String | yes | yes | Optional, defaults to "" - Text to show on-screen at the midpoint of the vector.
:SCALE      | Number | yes | yes | Optional, defauls to 1 - scalar to multiply by both the START and the VEC
:SHOW       | Boolean | yes | yes | Set to true to make the arrow appear, false to hide it. Defaults to false until you're ready to set it to true.

### Two ways to make a VECDRAW:

Build the suffix fields one at a time using the **VECDRAW** empty construction function:

* VECDRAW() creates an empty vecdraw with nothing populated yet. You have to follow it up with calls to the suffixes as shown here:

Example using VECDRAW():

    SET anArrow TO VECDRAW().
    SET anArrow:VEC TO V(a,b,c).
    SET anArrow:SHOW TO true.
    // At this point you have done the minimal necessary to make the arrow appear
    // and it shows up on the scren immediately.

    // Further options can also be set:
    SET anArrow:START TO V(0,0,0).
    SET anArrow:COLOR TO RGB(1,0,0).
    SET anArrow:LABEL TO "See the arrow?".
    SET anArrow:SCALE TO 5.0.

Build the vecdraw all at once with the VECDRAWARGS() construction function:

* VECDRAWARGS() Lets you specify all of the following in a list of arguments at once:

  * Vecdrawars( START, VEC, COLOR, LABEL, SCALE, SHOW ).

Example using VECDRAWAGS():

    SET anArrow TO VECDRAWARGS( v(0,0,0), v(a,b,c), rgb(1,0,0), "See the arrow?", 5.0, true ).

The above two examples make the same thing.



The arrow should be visible on both the map view and the in-flight view,
but on the map view it will have to be a long arrow to be visible.

VECDRAW's do not auto-update for changes in the vector like a LOCK
would, but if you repeatedly SET the :VEC suffix in a loop, it will
adjust the arrow picture to match as you do so.

Example:

    set xAxis to vecdrawargs( V(0,0,0), V(1,0,0), RGB(1.0,0.5,0.5), "X axis", 5, true ).
    set yAxis to vecdrawargs( V(0,0,0), V(0,1,0), RGB(0.5,1.0,0.5), "Y axis", 5, true ).
    set zAxis to vecdrawargs( V(0,0,0), V(0,0,1), RGB(0.5,0.5,1.0), "Z axis", 5, true ).

To make a vecdraw dissappear, you can either set its :SHOW to false or just UNSET the variable, or re-assign it.

An example using vecdraw can be seen in the [documentation for POSITIONAT](../../command/prediction.md)
