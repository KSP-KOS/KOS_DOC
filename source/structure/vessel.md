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

* Every suffix of [Orbitable](../orbitable/index.html) is callable from VESSEL, as well as...
  * CONTROL - [Control](../control/index.html) for raw flying a ship.
  * BEARING - To [CPU Vessel](../../summary_topics/CPU_Vessel/index.html)
  * HEADING - To [CPU Vessel](../../summary_topics/CPU_Vessel/index.html)
  * MAXTHRUST - Max thrust of all active engines
  * FACING - [Direction](../direction/index.html)
  * ANGULARMOMENTUM = [Direction](../direction/index.html) in [SHIP-RAW reference frame]](../../ref_frame/index.html).  Despite the name, this is technically not momentum information.
  * ANGULARVEL = [Direction](../direction/index.html) in [SHIP-RAW reference frame]](../../ref_frame/index.html).  Despite the name, this is technically not a velocity.  It only tells you the axis of rotation, not the speed of rotation around that axis.
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
  * LOADED - Boolean - true if the vessel is fully loaded into the complete KSP physics engine (false if it's "on rails").
