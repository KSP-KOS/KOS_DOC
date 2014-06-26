﻿# Body

Celestial Body

Any sort of planet or moon.

To get a variable referring to a Body, you can do this:

    SET MY_VAR TO BODY("name"). // "name" is the name of the body, like "Mun" for example.

Also, all bodies have hardcoded variable names as well.  You can use the variable Mun to
mean the same thing as BODY("Mun").



Note, as of kOS 0.13, a Celestial Body is now also an [Orbitable](../orbitable/index.html), and
can also use all the terms described for Orbital objects too.

Structure
=========

* Every suffix of [Orbitable](../orbitable/index.html) exists for BODY as well as the following:
  * NAME - string
  * DESCRIPTION - string
  * MASS - Number (kilogram)
  * POSITION - [Vector](../vector/index.html) in [SHIP-RAW reference frame]](../../ref_frame/index.html).
  * ALTITUDE - Number (meters)
  * RADIUS - Number (meters)
  * MU - Number [Wikipedia](http://en.wikipedia.org/wiki/Standard_gravitational_parameter)
  * ATM - [Atmosphere](../atmosphere/index.html)
  * ANGULARVEL = [Direction](../direction/index.html) in [SHIP-RAW reference frame]](../../ref_frame/index.html).  Despite the name, this is technically not a velocity.  It only tells you the axis of rotation, not the speed of rotation around that axis.