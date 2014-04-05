# Vessel

All vessels share a structure

Shared Structure
================

* CONTROL - [Control](/KOS_DOC/structure/control) for raw flying a ship.
* DIRECTION - [Direction](/KOS_DOC/structure/direction) To Active Ship
* DISTANCE - Meters To Active Ship
* BEARING - To Active Ship
* HEADING - To Active Ship
* PROGRADE - [Direction](/KOS_DOC/structure/direction)
* RETROGRADE - [Direction](/KOS_DOC/structure/direction)
* MAXTHRUST - Max thrust of all active engines
* VELOCITY - Structure 
    * ORBIT - [Vector](/KOS_DOC/structure/vector)
    * SURFACE - [Vector](/KOS_DOC/structure/vector)
* GEOPOSITION - [GeoCordinates](/KOS_DOC/structure/geocordinates)
* LATITUDE - Number (degrees)
* LONGITUDE - Number (degrees)
* FACING - [Direction](/KOS_DOC/structure/direction)
* UP - [Direction](/KOS_DOC/structure/direction)
* NORTH - [Direction](/KOS_DOC/structure/direction)
* BODY - [Body](Body)
* ANGULARMOMENTUM - [Direction](/KOS_DOC/structure/direction)
* ANGULARVEL - [Direction](/KOS_DOC/structure/direction)
* MASS - Number (kilogram)
* VERTICALSPEED - Number (meters/s)
* SURFACESPEED - Number (meters/s)
* AIRSPEED - Number (meters/s)
* VESSELNAME - string
* ALTITUDE - Number (meters)
* APOAPSIS - Number (meters)
* PERIAPSIS - Number (meters)
* SENSORS - Structure
    * ACC - [Vector](/KOS_DOC/structure/vector)
    * PRES - Number (Atmosphere)
    * TEMP - Number (Celsius)
    * GRAV - [Vector](/KOS_DOC/structure/vector)
* TERMVELOCITY - Number (meters/s)
* OBT - Structure - [Orbit](/KOS_DOC/structure/orbit)

#### VESSEL (vesselname)

Represents a targetable vessel

    SET X TO VESSEL("kerbRoller2").     // Initialize a reference to a vessel.
    PRINT X:DISTANCE.                   // Print distance from current vessel to target.
    PRINT X:HEADING.                    // Print the heading to the vessel.
    PRINT X:BEARING.                    // Print the heading to the target vessel relative to vessel heading.
    
#### SHIP
    
Represents currently selected ship
    
    PRINT SHIP.                            // returns VESSEL("kerbRoller2")
    PRINT SHIP:DISTANCE.                   // Print distance from current vessel to target.
    PRINT SHIP:HEADING.                    // Print the heading to the vessel.
    PRINT SHIP:BEARING.                    // Print the heading to the target vessel relative to vessel heading.
    
#### TARGET

Represents targeted vessel or celestial body

    SET TARGET TO "kerbRoller2".        // target kerbRoller2
    PRINT TARGET:DISTANCE.              // Print distance from current vessel to target.
    PRINT TARGET:HEADING.               // Print the heading to the target vessel.
    PRINT TARGET:BEARING.               // Print the bearing to the target vessel relative to vessel heading.
