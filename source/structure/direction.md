# Direction

Directions exist primarily to enable automated steering. You can initialize a direction using a vector or a rotation.

Structure
=========

* PITCH - Number (degrees)
* YAW - Number (degrees)
* ROLL - Number (degrees)
* VECTOR - [Vector](../vector)

#### Creation

R (pitch, yaw, roll)
HEADING (degreesFromNorth, pitchAboveHorizon)

#### Example

    SET X TO PROGRADE + R(90,0,0).      // Initializes a direction to prograde plus a relative pitch of 90
    LOCK STEERING TO X.                 // Steer the vessel in the direction suggested by direction X.

    SET Y TO HEADING(45, 10).           // Create a rotation facing northeast, 10 degrees above horizon
    LOCK STEERING TO Y.                 // Steer the vessel in the direction suggested by direction X.

    SET Direction TO R(0,90,0).        // Set by a rotation in degrees

You can use math operations on Directions as well. The next example uses a rotation of “UP” which is a system variable describing a vector directly away from the celestial body you are under the influence of.

    SET Direction TO UP + R(0,-45,0).  // Set direction 45 degress west of “UP”.

