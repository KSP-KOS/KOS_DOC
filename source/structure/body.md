# Body

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

Suffix       | Type     | Description
-------------|----------|-------------------------
*Every suffix of [Orbitable](../orbitable/index.html)* | varies | **All the suffixes of Orbitable also exist for BODY.**  The rest of this list is only the the suffixes that are specific to Body
:NAME        | string | name of the body, i.e. "Mun"
:DESCRIPTION | string | Longer description of the body, often just a duplicate of the name
:MASS        | Number | The mass of the body in kilograms
:POSITION    | [Vector](../vector/index.html) in [SHIP-RAW reference frame]](../../ref_frame/index.html) | The location of the body's center of mass, relative to the SHIP's current position.
:ALTITUDE    | Number (meters) | The altitude of this body above the sea level surface of its parent body.  (i.e. the altitude of Mun above Kerbin).
:RADIUS      | Number (meters) | The radius from the body's center to its sea level.
:MU          | Number [Wikipedia](http://en.wikipedia.org/wiki/Standard_gravitational_parameter) | The Gravitational Parameter of the body.
:ATM         | [Atmosphere](../atmosphere/index.html) | A variable that describes the atmosphere of this body.
:ANGULARVEL  | [Direction](../direction/index.html) in [SHIP-RAW reference frame]](../../ref_frame/index.html). | Despite the name, this is technically not a velocity.  It only tells you the axis of rotation, not the speed of rotation around that axis.
