GeoCoordinates, i.e. "LATLNG"
=============================

Represents a set of geo-coordinates - a location on the surface of a [Body](../body/index.html).

### Structure

Suffix          | Type               | Get | Set | Description
----------------|--------------------|-----|-----|--------------------------------------
: LAT           | Number, in Degrees | yes | no  | The latitude of this position on the surface.
: LNG           | Number, in Degrees | yes | no  | The longitude of this position on the surface.
: DISTANCE      | Number, in Meters  | yes | no  | Distance from the [CPU_Vessel](../../summary_topics/CPU_vessel/index.html) to this point on the surface
: TERRAINHEIGHT | Number, in Merters | yes | no  | Distance of the terrain above "sea level" at this geographical position.  Negative numbers are below "sea level".
: HEADING       | Number, in Degrees | yes | no  | The *absolute* compass direction from the [CPU_Vessel](../../summary_topics/CPU_vessel/index.html) to this point on the surface
: BEARING       | Number, in Degrees | yes | no  | The *relative* compass direction from the [CPU_Vessel](../../summary_topics/CPU_vessel/index.html) to this point on the surface.  (i.e. if the vessel is heading at compass heading 45, and the geocoordinates location is at heading 30, then :BEARING will return -15).

#### Creation

The function LATLNG(latitude,longitude) creates a LATLNG (a GeoCoordiante) with the given
latitude and longitude.  Once created, a LATLNG can't be changed.  The :LAT and :LNG suffixes
are get-only and cannot be set.  To switch to a new location, make a new call to LATLNG().

It is also possible to obtain a GeoCoordiates from some suffixes of some other structures,
for example:

    SET spot to SHIP:GEOPOSITION.

#### Example

    SET spot TO LATLNG(10, 20).              // Initialize point at lattitude 10, longitude 20
    PRINT spot:LAT.                          // Print 10.
    PRINT spot:LNG.                          // Print 20.
    PRINT spot:DISTANCE.                     // Print distance from vessel to x (same altitude is presumed)
    PRINT LATLNG(10,20):HEADING.             // Print the heading to the point.
    PRINT spot:BEARING.                      // Print the heading to the point relative to vessel heading.
    SET spot TO SHIP:GEOPOSITION.            // Make spot into a location on the surface directly underneath the current ship
    SET spot TO LATLNG(spot:LAT,spot:LNG+5). // Make spot into a new location 5 degrees east of the old one.
    //
    PRINT "THESE TWO NUMBERS SHOULD BE THE SAME:"
    PRINT (SHIP:ALTITIUDE - SHIP:GEOPOSITION:TERRAINHEIGHT) + ", " + ALT:RADAR.
