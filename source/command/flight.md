Navigation
==========

### ADD

Adds a [maneuver node](/KOS/structure/node) to the flight plan.

Example:
This statement adds a node that occurs 30 seconds from now, and has a delta-V of 100 m/s radial out, 0 m/s normal, and 200 m/s prograde.

    ADD NODE(TIME + 30, 100, 0, 200).

### REMOVE

Removes [maneuver node](/KOS/structure/node) from flight plan. Cannot remove bare nodes e.g. ADD NODE().

    SET X TO NODE(0,0,0,0).
    ADD X.
    REMOVE X.

    ADD NODE(0,0,0,0).
    REMOVE.             // Does not remove node.

### STAGE

Executes the stage action on the current vessel.
Example:

    STAGE.

### WARP

Sets game warp to provided value(0-7).

    SET WARP TO 5.      // Sets warp to 1000x.
    SET WARP TO 0.      // Sets warp to 0x aka real time.

