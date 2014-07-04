VesselSensors
=============

When you ask a Vessel to tell you its :SENSORS suffix, it returns an object of this type.

This is a snapshot of the following sensor data taken at the moment the sensor reading
was taken (at the moment you said SomeVessel:SENSORS).

**NOTE:** These values are only enabled **if you have the proper type of sensor** onboard the vessel.
If you don't have a thermoneter, for example, then the :TEMP suffix will always read zero.

If you store this in a variable and wait, the numbers are frozen in time and won't change as the vessel's condition changes.

### Structure

Suffix      | Type      | Get | Set | Description
------------|-----------|-----|-----|--------------------------------------
:ACC        | [Vector](../vector/index.html) | yes | no  | Accelleration the vessel is undergoing.  A combination of both the gravitational pull and the engine thrust.
:PRES       | Number    | yes | no  | The current pressure of this ship.
:TEMP       | Number    | yes | no  | The current temperature.
:GRAV       | Number    | yes | no  | The number of "G's" of gravity pull here.
:LIGHT      | Number    | yes | no  | The total amount of sun exposure that exists here - only readable if there are solar panels on the vessel.


**BUG:** This information is currenlty being read from the Active Vessel even when the Active Vessel is not the [CPU Vessel](../../summary_topics/CPU_vessel/index.html).  This comment will be removed when that bug is fixed.

