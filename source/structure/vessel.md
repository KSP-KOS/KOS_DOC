## === Shared Structure ===

* DIRECTION - [Direction](../direction) To Active Ship
* DISTANCE - Meters To Active Ship
* BEARING - To Active Ship
* HEADING - To Active Ship
* PROGRADE - [Direction](../direction)
* RETROGRADE - [Direction](../direction)
* MAXTHRUST - Max thrust of all active engines
* VELOCITY - Structure 
    * ORBIT - [Vector](../vector)
    * SURFACE - [Vector](../vector)
* GEOPOSITION - Structure
    * LAT - Number (degrees)
    * LNG - Number (degrees)
    * DISTANCE - Number (meters)
    * HEADING - Number (degrees)
    * BEARING - Number (degrees)
* LATITUDE - Number (degrees)
* LONGITUDE - Number (degrees)
* FACING - [Direction](../direction)
* UP - [Direction](../direction)
* NORTH - [Direction](../direction)
* BODY - [Body](Body)
* ANGULARMOMENTUM - [Direction](../direction)
* ANGULARVEL - [Direction](../direction)
* MASS - Number (kilogram)
* VERTICALSPEED - Number (meters/s)
* SURFACESPEED - Number (meters/s)
* AIRSPEED - Number (meters/s)
* VESSELNAME - string
* ALTITUDE - Number (meters)
* APOAPSIS - Number (meters)
* PERIAPSIS - Number (meters)
* SENSORS - Structure
    * ACC - [Vector](../vector)
    * PRES - Number (Atmosphere)
    * TEMP - Number (Celsius)
    * GRAV - [Vector](../vector)
* TERMVELOCITY - Number (meters/s)
* OBT - Structure - [Orbit](Orbit)

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