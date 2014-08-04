### RGBA COLORS (COLOURS)

Any place you need to specify a color in the game (at the moment this is
just with [VECDRAW](../vecdraw/index.html).)  You do so with a
rgba color structure defined as follows:

Method 1: Use one of these pre-arranged named colors:

* RED
* GREEN
* BLUE
* YELLOW
* CYAN
* MAGENTA (can be spelled "PURPLE" instead)
* WHITE
* BLACK

Method 2: Use the RGB() function to build your own color.

RGB( r,g,b ).

* r = a floating point number from 0.0 to 1.0 for the red component.
* g = a floating point number from 0.0 to 1.0 for the green component.
* b = a floating point number from 0.0 to 1.0 for the blue component.

Method 3: Use the RGBA() function to build your own color with an alpha channel (transparency).

RGBA( r,g,b,a ).

* r = a floating point number from 0.0 to 1.0 for the red component.
* g = a floating point number from 0.0 to 1.0 for the green component.
* b = a floating point number from 0.0 to 1.0 for the blue component.
* a = a floating point number from 0.0 to 1.0 for the alpha component. (1.0 means opaque, 0.0 means invisibly transparent).

Examples:

    SET myarrow TO VECDRAW.
    SET myarrow:VEC to V(10,10,10).
    SET myarrow:COLOR to YELLOW.
    SET mycolor TO YELLOW.
    SET myarrow:COLOR to mycolor.
    SET myarrow:COLOR to RGB(1.0,1.0,0.0).
    SET myarrow:COLOUR to RGB(1.0,1.0,0.0). // COLOUR spelling works too.
    SET myarrow:COLOR to RGBA(1.0,1.0,0.0,0.5). // half transparent yellow.
