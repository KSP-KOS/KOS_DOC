Orbit
=====

Variables of type Orbit hold descriptive information about the elliptical shape
of a predicted orbit.  Whenever there are multiple patches of orbit ellipses strung
together, for example, when an encounter with a body is expected to alter the path,
or when a maneuver node is planned, then each individual patch of the path is
represented by one Orbit object.

Each [Orbitable](../orbitable/index.html) item such as a vessel or celestial body
has an :ORBIT suffix that can be used to obtain its current Orbit.

Whenever you get the :ORBIT of a vessel, be aware that its just the current :ORBIT
patch that doesn't take into account any planetary encounters (slingshots) or
maneuver nodes that may occur.  For example, your vessel might never reach
SHIP:ORBIT:APOAPSIS if you're going to intersect the Mun and be flung by it into a new
orbit.

*WARNING* Some of the parameters listed here come directly from KSP's API and there
is a bit of inconsistency with whether it uses radians or degrees for angles.  As
much as possible we have tried to present everythign in kOS as degrees for consistency,
but some of these may have slipped through.  If you see any of these being reported
in radians, please make a bug report.

### Structure

Suffix            | Type      | Get | Set | Description
------------------|-----------|-----|-----|--------------------------------------
:APOAPSIS         | Number (meters)  | yes | no | The max altitude expected to be reached.
:PERIAPSIS        | Number (meters)  | yes | no | The min altitude expected to be reached.
:BODY             | [Body](../body/index.html)  | yes | no | The celestial body this orbit is orbiting.
:PERIOD           | Number (seconds) | yes | no  | [Wiki link](http://en.wikipedia.org/wiki/Orbital_period)
:INCLINATION      | Number (degree) | yes | no  | [Wiki link](http://en.wikipedia.org/wiki/Orbital_inclination)
:ECCENTRICITY     | Number | yes | no  | [Wiki link](http://en.wikipedia.org/wiki/Orbital_eccentricity)
:SEMIMAJORAXIS    | Number (meters) | yes | no  | [Wiki link](http://en.wikipedia.org/wiki/Semi-major_axis)
:SEMIMINORAXIS    | Number (meters) | yes | no  | [Wiki link](http://en.wikipedia.org/wiki/Semi-minor_axis)
:LAN or :LONGITUDEOFASCENDINGNODE | Number (degrees) | yes | no  | Longitude of the ascending node.  It's unclear what the basis line the game uses for this is, though.  The real-world basis is the constellation Ares, which of course doesn't exist in the Kerbal universe.
:ARGUMENTOFPERIAPSIS | Number | yes | no  | [Wiki link](http://en.wikipedia.org/wiki/Argument_of_periapsis)
:TRUEANOMALY         | Number | yes | no  | [Wiki link](http://en.wikipedia.org/wiki/True_anomaly)
:MEANANOMALYATEPOCH  | Number | yes | no  | [Wiki link](http://en.wikipedia.org/wiki/Mean_anomaly)
:PATCHES             | [LIST](../list/index.html)   | yes | no | The list of future [Orbit](../orbit/index.html)s that would follow this one, due to SOI transitions (but not due to manuever nodes).  To get the list of patches after a manuever node, get that maneuver node's :ORBIT suffix first, then get its :PATCHES suffix.  (i.e. MyNode:ORBIT:PATCHES.)

This is left off the above table because it's not clear that it works:

:TRANSITION - Enum
    * INITIAL
    * FINAL
    * ENCOUNTER
    * ESCAPE
    * MANEUVER

This enum type is not currently exposed to the kOS user so it probably won't work.


