# GeoCoordinates

Represents a set of geo-coordinates.

Structure
=========

#### Getters

* LAT - Degrees
* LNG - Degrees
* DISTANCE - Number (meters from calling vessel)
* HEADING
* BEARING

#### Creation

LATLNG (latitude, longitude)

#### Example

    SET X TO LATLNG(10, 20).            // Initialize point at lattitude 10, longitude 20
    PRINT X:LAT.                        // Print 10.
    PRINT X:LNG.                        // Print 20.
    PRINT X:DISTANCE.                   // Print distance from vessel to x (same altitude is presumed)
    PRINT LATLNG(10,20):HEADING.        // Print the heading to the point.
    PRINT X:BEARING.                    // Print the heading to the point relative to vessel heading.

