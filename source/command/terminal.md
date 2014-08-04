Terminal and game environment
=============================

***

### CLEARSCREEN

Clears the screen and places the cursor at the top left.
Example:

    CLEARSCREEN.

***

### PRINT

Prints the selected text to the screen. Can print strings, or the result of an expression.
Example:

    PRINT “Hello”.
    PRINT 4+1.
    PRINT “4 times 8 is: “ + (4*8).

***

### PRINT.. AT (COLUMN,LINE)

Prints the selected text to the screen at specified location. Can print strings, or the result of an expression.
Example:

    PRINT “Hello” at (0,10).
    PRINT 4+1 at (0,10).
    PRINT “4 times 8 is: “ + (4*8) at (0,10).

***

### MAPVIEW

A variable that controls or queries whether or not the game is in map view:

Querying:

    IF MAPVIEW {
        PRINT "You are looking at the map.".
    } ELSE {
        PRINT "You are looking at the flight view.".
    }.

Setting:

    SET MAPVIEW TO TRUE.  // Switches the game to the map view.
    SET MAPVIEW TO FALSE. // Switches the game to the flight view.

***

### REBOOT

Reboots the kOS module.

***

### SHUTDOWN

Causes kOS module to shutdown.

