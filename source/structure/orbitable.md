Orbitable
=========

All objects that can move in orbit around other objects
share some similar structure.  To help keep things as
consistent as possible, that similar structure is defined
here.  Everything you see here works for BOTH 
[Vessels](../vessel/index.html) and
[Bodies](../body/index.html)

These terms are all read-only.

*SOI Body* : Every where you see the term *SOI Body* in the descriptions below, it refers
to the body at the center of the orbit of this object - the body in who's sphere of
influence this object is located.  It is important to make the distinction that if this
object is itself a Body, the SOI body is the body being orbited, not the body doing the
orbiting.  (i.e. When talking about the Mun, the SOI body means "Kerbin". When talking
about Kerbin, the SOI body means "Sun").

### Structure

Suffix          | Type | Get | Set | Description
----------------|------|-----|-----|---------------------
:NAME | string | yes | no | Name of this vessel or body.
:BODY | [Body](../body/index.html) | yes | no | The object that this object is orbiting.  i.e. Mun:BODY returns Kerbin.
:OBT | [Orbit](../orbit/index.html) | yes | no | The current single orbit "patch" that this object is on (not the future orbits it might be expected to achieve after manuever nodes or encounter transitions, but what the current orbit would be if nothing changed and no encounteres perturbed the orbit.
:APOAPSIS | number | yes | no | apoapsis (deprecated alias for OBT:APOAPSIS.  Please use OBT:APOAPSIS instead.)
:PERIAPSIS | number | yes | no | periapsis (deprecated alias for OBT:PERIAPSIS.  Please use OBT:PERIAPSIS instead.)
:BODY | [Body](../body/index.html) | yes | no | [Body](../body/index.html) The body that this Object is orbiting around.
:UP | [Direction](../direction/index.html) | yes | no | pointing straight up away from the SOI body.
:NORTH | [Direction](../direction/index.html) | yes | no | pointing straight north on the SOI body, parallel to the surface of the SOI body.
:PROGRADE | [Direction](../direction/index.html) | yes | no | pointing in the direction of this object's **orbital-frame** velocity
:SRFPROGRADE | [Direction](../direction/index.html) | yes | no | pointing in the direction of this object's **surface-frame** velocity.  Note that if this Orbitable is itself a body, remember that this is relative to the surface of the SOI body, not this body.
:RETROGRADE | [Direction](../direction/index.html) | yes | no | pointing in the opposite of the direction of this object's **orbital-frame** velocity
:SRFRETROGRADE | [Direction](../direction/index.html) | yes | no | pointing in the opposite of the direction of this object's **surface-frame** velocity.  Note that this is relative to the surface of the SOI body.
:OBT | [Orbit](../orbit/index.html) | yes | no | the orbit shape of this object.
:POSITION | [Vector](../vector/index.html) | yes | no | The position of this object in the [SHIP-RAW reference frame](../../ref_frame/index.html)
:VELOCITY | [OrbitableVelocity](../orbitablevelocity/index.html) | yes | no | The **orbital** velocity of this object in the [SHIP-RAW reference frame](../../ref_frame/index.html)
:DISTANCE | number | yes | no | The scalar distance between this object and the center of SHIP.
:DIRECTION | [Direction](../direction/index.html) | yes | no | pointing in the direction of this object from SHIP.
:LATITUDE | number | yes | no | The latitude in degrees of the spot on the surface of the SOI body directly under this object.
:LONGITUDE | number | yes | no | The longitude in degrees of the spot on the surface of the SOI body directly under this object.  Longitude returned will always be normalized to be in the range [-180,180].
:ALTITUDE | number | yes | no | The altitude in meters above the *sea level* surface of the SOI body (not the center of the SOI body.  To get the true radius of the orbit for proper math calculations remember to add altitude to the SOI body's radius.)
:GEOPOSITION | [GeoCoordinates](../geocoordinates/index.html) | yes | no | A combined structure of the latitude and longitude numbers.
:PATCHES | [List](../list/index.html) | yes | no  | The list of all the orbit patches that this object will transition to, not taking into account maneuver nodes.  The zero-th patch of the list is the current orbit.
