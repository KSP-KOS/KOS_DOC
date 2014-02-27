# Maneuver Node

A planned velocity change along an orbit

Structure
=========

#### Getters

* DELTAV or BURNVECTOR - [Vector](/KOS_DOC/structure/vector)
* ETA - Number (seconds)
* PROGRADE - Number (meters/s)
* RADIALOUT - Number (meters/s)
* NORMAL - Number (meters/s)
* ORBIT- [Orbit](/KOS_DOC/structure/orbit)

#### Setters

* ETA - Number (seconds)
* PROGRADE - Number (meters/s)
* RADIALOUT - Number (meters/s)
* NORMAL - Number (meters/s)


#### Creation

NODE (universalTime, radialOut, normal, prograde)

#### Example

    SET X TO NODE(TIME+60, 0, 0, 100).  // Creates a node 60 seconds from now with
                                        // prograde=100 m/s
    ADD X.                              // Adds the node to the flight plan.
    PRINT X:PROGRADE.                   // Returns 100.
    PRINT X:ETA.                        // Returns the ETA to the node.
    PRINT X:DELTAV                      // Returns delta-v vector.
    REMOVE X.                           // Remove node  from the flight plan.

    SET X TO NODE(0, 0, 0, 0).          // Create a blank node.
    ADD X.                              // Add Node to flight plan.
    SET X:PROGRADE to 500.              // Set nodes prograde to 500m/s deltav.
    SET X:ETA to 30.              // Set nodes time to 30 seconds from now.
    PRINT X:OBT:APOAPSIS.                   // Returns nodes apoapsis.
    PRINT X:OBT:PERIAPSIS.                  // Returns nodes periapsis.


