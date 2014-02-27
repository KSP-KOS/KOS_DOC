# Orbit

The path the vessel/body will take with no intervention

Structure
=========

* APOAPSIS - Number (meters)
* PERIAPSIS - Number (meters)
* BODY - [Body](/KOS_DOC/structure/body)
* PERIOD - Number (seconds) [Wiki](http://en.wikipedia.org/wiki/Orbital_period)
* INCLINATION - Number (degree) [Wiki](http://en.wikipedia.org/wiki/Orbital_inclination)
* ECCENTRICITY - Number [Wiki](http://en.wikipedia.org/wiki/Orbital_eccentricity)
* SEMIMAJORAXIS - Number (meters) [Wiki](http://en.wikipedia.org/wiki/Semi-major_axis)
* SEMIMINORAXIS - Number (meters)
* PATCHES - list of [Orbit](/KOS_DOC/structure/orbit)
* TRANSITION - Enum
    * INITIAL
    * FINAL
    * ENCOUNTER
    * ESCAPE
    * MANEUVER



