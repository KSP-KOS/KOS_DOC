# Vessel

All vessels share a structure.

To get a variable referring to any vessel you can do this:

### getting a vessel variable:

    SET MY_VESS TO VESSEL("Some Ship Name"). // Get a vessel by it's name.  The name is Case Sensitive.
    SET MY_VESS TO SHIP.  // Save the current vessel in a variable, in case the current vessel changes.
    SET MY_VESS TO TARGET.  // Save the target vessel in a variable, in case the target vessel changes.

Shared Structure
================

Be aware that as of kOS 0.13, a vessel is now a type of [Orbitable](../orbitable/index.html)
Much of what a Vessel can do can now by done by any orbitable object.  The documentation for those abilities has been moved to the orbitable page.

Suffixes of Vessel:

* Every suffix of [Orbitable](../orbitable/index.html)
* CONTROL - [Control](../control/index.html) for raw flying a ship.
* BEARING - To Active Ship
* HEADING - To Active Ship
* MAXTHRUST - Max thrust of all active engines
* FACING - [Direction](../direction/index.html)
* ANGULARMOMENTUM - [Direction](../direction/index.html)
* ANGULARVEL - [Direction](../direction/index.html)
* MASS - Number (kilogram)
* VERTICALSPEED - Number (meters/s)
* SURFACESPEED - Number (meters/s)
* AIRSPEED - Number (meters/s)
* VESSELNAME - string
* SENSORS - Structure
    * ACC - [Vector](../vector/index.html)
    * PRES - Number (Atmosphere)
    * TEMP - Number (Celsius)
    * GRAV - [Vector](../vector/index.html)
* TERMVELOCITY - Number (meters/s) based on the vessel's current altitude above sea level, and its drag properties.

