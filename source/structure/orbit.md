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
:NAME             | String    | yes | no  | a name for this orbit.
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
:TRANSITION          | String | yes | no  | Describes the way in which this orbit will end and become a different orbit, with a value taken [from this list](#Transition_names).
:POSITION            | Vector | yes | no  | The current position of whatever the object is that is in this orbit.
:VELOCITY            | Vector | yes | no  | The current velocity of whatever the object is that is in this orbit.
:NEXTPATCH           | Orbit  | yes | no  | When this orbit has a transition to another orbit coming up, this suffix returns the next Orbit patch after this one.  For example, when escaping from a Mun orbit into a Kerbin orbit from which you will escape and hit a Solar orbit, then the current orbit's :NEXTPATCH will show the Kerbin orbit, and :NEXTPATCH:NEXTPATCH will show the solar orbit.  The number of patches into the future that you can peek depends on your conic patches setting in your Kerbal Space Program Settings.cfg file.
:HASNEXTPATCH        | Boolean| yes | no  | If :NEXTPATCH will return a valid patch, this is true.  If :NEXTPATCH will not return a valid patch because there are no transitions occurring in the future, then :HASNEXTPATCH will be false.

:NEXTPATCH and :HASNEXTPATCH both only operate on the CURRENT momentum of the object, and do NOT take into account any potential changes planned with manuever nodes.  To see the possible new path you would have if a maneuver node gets executed exactly as planned, you need to first get the orbit that follows the manuever node, by looking at the [manuever node's :ORBIT suffix](../node/index.html), and then look at IT's :NEXTPATCH and :HASNEXTPATCH.

### Deprecated:

Suffix            | Type      | Get | Set | Description
------------------|-----------|-----|-----|--------------------------------------
:PATCHES             | [LIST](../list/index.html)   | yes | no | This suffix no longer works after v0.15.  To get the same functionality, you must use the :PATCHES suffix of the [Vessel itself](../vessel/index.html)

### Transition names

* **"INITIAL"** - Refers to the pure of a new orbit, which is a value you will never see from the :TRANSITION suffix (it refers to the start of the orbit patch, and :TRANSITION only refers to the end of the patch.
* **"FINAL"** - Means that no transition to a new orbit is expected.  It this orbit is the orbit that will remain forever.
* **"ENCOUNTER"** - Means that this orbit will enter a new SOI of another orbital body that is smaller in scope and is "inside" the current one.  (example: currently in Sun orbit, will enter Duna Orbit.)
* **"ESCAPE"** - Means that this orbit will enter a new SOI of another orbital body that is larger in scope and is "outside" the current one.  (example: currently in Kerbin orbit, will enter Sun Orbit.)
* **"MANEUVER"** - Means that this orbit will end due to a manuever node that starts a new orbit?

