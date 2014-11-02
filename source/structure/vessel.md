Vessel
======

All vessels share a structure.

To get a variable referring to any vessel you can do this:

### getting a vessel variable:

    SET MY_VESS TO VESSEL("Some Ship Name"). // Get a vessel by it's name.  The name is Case Sensitive.
    SET MY_VESS TO SHIP.  // Save the current vessel in a variable, in case the current vessel changes.
    SET MY_VESS TO TARGET.  // Save the target vessel in a variable, in case the target vessel changes.

### Shared Structure

Be aware that as of kOS 0.13, a vessel is now a type of [Orbitable](../orbitable/index.html)
Much of what a Vessel can do can now by done by any orbitable object.  The documentation for those abilities has been moved to the orbitable page.

Suffixes of Vessel:

Suffix           | Type      | Get | Set | Description
-----------------|-----------|-----|-----|--------------------------------------
Every suffix of [Orbitable](../orbitable/index.html) | varies | .. | .. | Vessel is a type of [Orbitable](../orbitable/index.html) and therefore every suffix of Orbitable is also a suffix of VESSEL too.  Read the Orbitable page to see that list of suffixes.  This table below only contains the suffixes that are unique to Vessel
:CONTROL         | [Control](../control/index.html) | yes | no | The structure represending the raw flight controls for the vessel.
:BEARING         | Number    | yes | no  |  *relative* compass heading (degrees) to this vessel from the [CPU Vessel](../../summary_topics/CPU_Vessel/index.html), taking into account the CPU Vessel's own heading.
:HEADING         | Number    | yes | no  |  *absolule* compass heading (degrees) to this vessel from the [CPU Vessel](../../summary_topics/CPU_Vessel/index.html)
:MAXTHRUST       | Number    | yes | no  |  Sum of all the Max thrust of all the currently active engines  In Kilonewtons.
:FACING          | [Direction](../direction/index.html) | yes | no  | The way the vessel is pointed.
:MASS            |  Number (metric tons) | yes | no  | The mass of the ship
:VERTICALSPEED   |  Number (meters/s)    | yes | no  | How fast the ship is moving. in the "up" direction relative to the  SOI Body's sea level surface.
:SURFACESPEED    | Number (meters/s)     | yes | no  | How fast the ship is moving in the plane horizontal to the SOI body's sea level surface.
:AIRSPEED        | Number (meters/s)     | yes | no  | How fast the ship is moving relative to the air.  KSP models atmosphere as simply a solid block of air "glued" to the planet surface (the weather on Kerbin is boring and there's no wind).  Therefore airspeed is generally the same thing as as the magnitude of the surface velocity.
:TERMVELOCITY    | Number (meters/s)     | yes | no  | terminal velocity of the vessel in freefall through atmosphere, based on the vessel's current altitude above sea level, and its drag properties.  Warning, can cause values of Infinity if used in a vacuum, and kOS sometimes does not let you store Infinity in a variable.
:VESSELNAME      | string  | yes | no  | The name of the vessel as it appears in the tracking station.
:ANGULARMOMENTUM | [Direction](../direction/index.html) | yes | no  | Given in [SHIP-RAW reference frame]](../../ref_frame/index.html).  Despite the name, this is technically not momentum information because it has no magnitude.
:ANGULARVEL      | [Direction](../direction/index.html) | yes | no  | Given in [SHIP-RAW reference frame]](../../ref_frame/index.html).  Despite the name, this is technically not a velocity.  It only tells you the axis of rotation, not the speed of rotation around that axis.
:SENSORS |  [VesselSensors](../vesselsensors/index.html) | yes | no | Structure holding summary information of sensor data for the vessel
:LOADED       | Boolean | get | set | true if the vessel is fully loaded into the complete KSP physics engine (false if it's "on rails").
:PATCHES             | [LIST](../list/index.html)   | yes | no | The list of orbit patches that describe this vessel's current travel path based on momentum alone with no thrusting changes.  If the current path has no transitions to other bodies, then this will be a list of only one orbit.  If the current path intersects other bodies, then this will be a list describing the transitions into and out of the intersecting body's sphere of influence.  SHIP:PATCHES[0] is always exactly the same as SHIP:OBT, SHIP:PATCHES[1] is the same as SHIP:OBT:NEXTPATCH, SHIP:PATCHES[2] is the same as SHIP:OBT:NEXTPATCH:NEXTPATCH, and so on.  Note that you will only see as far into the future as your KSP settings allow.  (See the setting CONIC_PATCH_LIMIT in your settings.cfg file)


