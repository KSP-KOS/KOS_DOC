Maneuver Node
=============

A planned velocity change along an orbit.  These are the nodes that
you can set in the KSP user interface.  Setting one through kOS
will make it appear on the in-game map view, and creating one 
manually on the in-game map view will cause it to be visible to kOS.

### Structure

Suffix      | Type      | Get | Set | Description
------------|-----------|-----|-----|--------------------------------------
:DELTAV or :BURNVECTOR | [Vector](../vector/index.html) | yes | no  | The vector giving the total burn of the node.  The vector can be used to steer with, and its magnitude is the delta V of the burn.
:ETA        | Number    | yes | yes | The number of seconds until the expected burn time.  If you SET this, it will actually move the manuever node along the path in the map view, identically to grabbing the manuever node and dragging it.
:PROGRADE   | Number    | yes | yes | The delta V in (meters/s) along just the prograde direction (the yellow and green 'knobs' of the manuever node).  A positive value is a prograde burn and a negative value is a retrograde burn.
:RADIALOUT  | Number    | yes | yes | The delta V in (meters/s) along just the radial direction (the cyan knobs' of the manuever node).  A positive value is a radial out burn and a negative value is a radial in burn.
:NORMAL     | Number    | yes | yes | The delta V in (meters/s) along just the normal direction (the purple knobs' of the manuever node).  A positive value is a normal burn and a negative value is an anti-nomrmal burn.
:ORBIT      | [Orbit](../orbit/index.html) | yes | no  | The new orbit patch that will begin starting with the burn of this node, under the assumption that the burn will occur exactly as planned.

### Creation

**NODE(** *universalTime*, *radialOut*, *normal*, *prograde* **)**

**Warning**: When *constructing* a new node using the NODE() function call, you use the universal time (you must add the ETA time to the current time to arrive at the value to pass in), but when using the suffix :ETA, you do NOT use universal time, instead just giving the number of seconds from now.

### Adding to the flight plan

Once you've created a node, it's just a hypothetical node that hasn't been attached to anything yet.

To attach a node to the flight path, you must use the commands [ADD and REMOVE](../../command/node/index.html) on it.

### Suffix Examples

    SET X TO NODE(TIME:SECONDS+60, 0, 0, 100). 
                                        // Creates a node 60 seconds from now with
                                        // prograde=100 m/s
    //
    ADD X.                              // Adds the node to the flight plan.
    PRINT X:PROGRADE.                   // Returns 100.
    PRINT X:ETA.                        // Returns the ETA to the node.
    PRINT X:DELTAV                      // Returns delta-v vector.
    REMOVE X.                           // Remove node  from the flight plan.

    SET X TO NODE(0, 0, 0, 0).          // Create a blank node.
    ADD X.                              // Add Node to flight plan.
    SET X:PROGRADE to 500.              // Set nodes prograde to 500m/s deltav.
    SET X:ETA to 30.                    // Set nodes time to 30 seconds from now.
    PRINT X:OBT:APOAPSIS.               // Returns nodes apoapsis.
    PRINT X:OBT:PERIAPSIS.              // Returns nodes periapsis.


### Special variable NEXTNODE

NEXTNODE is a built-in variable that always refers to the next upcoming node that has been added to your flight plan.

Examples:

    SET MyNode to NEXTNODE.
    PRINT NEXTNODE:PROGRADE.
    REMOVE NEXTNODE.


Currently, if you attempt to query NEXTNODE and there is no node on your flight plan, it produces a runtime error.
(This needs to be fixed in a future release so it is possible to query whether or not you have a next node).

If you need to query whether or not you have a NEXTNODE, the following has been suggested as a workaround in the meantime:
Set a node really far into the future, beyond any reasonable amount of time.  Add it to your flight plan.  Then check NEXTNODE to see if it returns THAT node, or an earlier one.  If it returns an earlier one, then that earlier one was there all along and is the real NEXTNODE.  If it returns the fake far-future node you made instead, then there were no nodes before that point.  In either case, remove the far-future node after you perform the test.




