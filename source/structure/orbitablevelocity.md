# OrbitableVelocity

When any [Orbitable](../direction/index.html) object returns its :VELOCITY suffix, it
returns it as a structure containing a pair of both its orbit-frame velocity and its surface-frame velocity at the same instant of time.

To obtain its velocity as a vector you must pick whether you want the oribtal or surface velocities by
giving a further suffix:

* ORBIT : Type Vector : Returns the orbital velocity.
* SURFACE : Type Vector : Returns the surface-frame velocity.  Note that this is the surface velocity relative to the surface of the SOI body, not the orbiting object itself.  (i.e. Mun:VELOCITY:SURFACE returns the Mun's velocity relative to the surface of its SOI body, Kerbin).

Examples:

    SHIP:VELOCITY:ORBIT
    MUN:VELOCITY:SURFACE

Note: At first glance it may seem that MUN:VELOCITY:SURFACE is wrong because it creates a
vector in the opposite direction from MUN:VELOCITY:ORBIT.  But this is actually correct.
Kerbin's surface rotates once every 6 hours, and the Mun takes a lot longer than 6
hours to orbit Kerbin.  Therefore relative to Kerbin's surface, the mun is going backward.


