# Atmosphere

A Structure closely tied to [Body](../body/index.html)
A variable of type *Atmosphere* usually is obtained by the :ATM suffix of a Body.

Structure
=========

ALL The following values are read-only.  You can't change the value
of a body's atmosphere.

SUFFIX            | Type   | Description
------------------|--------|------------
:BODY             | string | The Body that this atmosphere is around - as a STRING NAME, not a Body object.
:EXISTS           | bool   | True if this atmosphere is "real" and not just a dummy placeholder.
:OXYGEN           | bool   | True if the air has oxygen and could therefore be used by a jet engine's intake.
:SCALE            | double | A math constant plugged into a formula to find atmosphere density (see below).
:SEALEVELPRESSURE | double | Nuber of Atm's at planet's sea level 1.0 Atm's = same as Kerbin.
:HEIGHT           | float  | The altitude at which the atmosphere is "officially" advertised as ending.  (actual ending value differs, see below).

Atmospheric math
================

The atmospheric effects of a planet's air need to be calculated using some formulas:

First off, be aware that atmosphere can be measured three different ways:

* **Atm's** : a multiple of the pressure at Kerbin sea level.  An atmosphere of 0.5 is half as much air pressure as at Kerbin's sea level.  This is the measure used by :SEALEVELPRESSURE
* **pressure** : A measure of the force the air pushes on a surface with.  In SI units, it's Newtons per Square Meter.  *This value is almost never used directly in any calculation.  Instead you just calculate everything in terms of multiples of Atm's.*
* **density** : A measure of how much mass of air there is in a volume of space.  In SI units, it's Kilograms per Cubic Meter.

The following only applies to the STOCK KSP atmosphere.
-------------------------------------------------------

> _If you have installed a mod such as [FAR](http://forum.kerbalspaceprogram.com/threads/20451-0-25-Ferram-Aerospace-Research-v0-14-3-2-10-21-14), that changes the atmosphere, then much of what is said below will not apply._

The level of atmosphere can be calculated for any altitude as follows:

* Number of **Atm's** = (Atm's at sea level) * ( e ^ ( - sea_level_alt / scale ) )

The **TRUE** maximum height of the atmosphere is NOT the value returned by :HEIGHT, but rather it's the altitude at which the number of Atm's returned by the above formula is 0.000001.  :HEIGHT is just the value as advertised by the game to the user.  On some worlds it can be quite a ways off.

And once you have that number, then density can be calculated from it with this conversion factor:

* air density = Number of Atm's  * 1.2230948554874.

Further information about the math formulas that Kerbal Space Program uses to calculate the atmosphere [can be found here](http://wiki.kerbalspaceprogram.com/wiki/Atmosphere).


Examples:
=========

    IF SHIP:ORBIT:BODY:ATM:EXISTS {
        SET thisAtmo TO SHIP:ORBIT:BODY:ATM.
        PRINT "The planet you are orbiting has an atmosphere.".
        PRINT "It's scale is " + thisAtmo:SCALE.
        PRINT "It's height is " + thisAtmo:HEIGHT.
        SET atmos TO thisAtmo:SEALEVELPRESSURE + ( CONSTANT():E ^ ( - SHIP:ALTITUDE / thisAtmo:SCALE ) ).
        PRINT "At this altitude the atmosphere is " + atmos + " Atm's.".
    } ELSE {
        PRINT "The planet you are orbiting has no atmosphere.".
    }.
