### Direction

Directions exist primarily to enable automated steering. You can initialize a direction using a vector or a rotation.

Directions represent a rotation starting from an initial point in KSP's coordinate system where the initial state was looking down the +Z axis, with the camera "up" being the +Y axis.

So for example, a Direction ponting along the X axis might be represented as R(0,90,0) - meaning the initial Z-axis direction was rotated 90 degrees around the Y axis.

If you are going to manipulate Directions a lot, it's important to note that the order in which the rotations occur is:

* First rotate around Z axis.
* Then rotate around X axis.
* Then rotate around Y axis.

What this means is that if you try to ROLL and YAW in the same tuple, like so:  R(0,45,45), you'll end up rolling FIRST, and THEN Yawing, which might not be what you expected.  There is little that can be done to change this, as it's the native way things are represented in the underlying Unity engine.

Also, if you are going to manipulate directions a lot, it's important to note how KSP's [native coord system works](../../ref_frame/index.html).

#### The difference between a Direction and a Vector:

A Vector and a Direction can be represented with the exact same amount of information:
a tuple of 3 floating point numbers.  So you might wonder why it is that a Vector
can hold information about the magnitude of the line segment, while a Direction cannot,
given that both have the same amount of information.  The answer is that a Direction does
contain one thing a Vector does not.  A Direction knows which way is "up", while a Vector
does not.  If you tell kOS to LOCK STEERING to a Vector, it will be able to point the nose
of the vessel in the correct direction, but won't know which way you want the roof of the
craft rotated to.  This works fine for axial symmetrical rockets but can be a problem for
airplanes.


#### Structure

Suffix  | Type              | Get | Set | Description
--------|-------------------|-----|-----|--------------------------------------
:PITCH  | Number (degrees)  | yes | no  | Rotation around X axis
:YAW    | Number (degrees)  | yes | no  | Rotation around Y axis
:ROLL   | Number (degrees)  | yes | no  | Rotation around Z axis
:VECTOR | [Vector](../vector/index.html) | yes | no  | An XYZ unit vector pointing in the same direction as this Direction.

The suffixes of a Direction cannot be altered, so to get a new Direction you must construct a new one.

#### Creating a Direction

A Direction can be created out of a Euler Rotation Tuple, indicated with the R() function, as shown below:

    SET myDir TO R( a, b, c ). // Where a, b, and c are pitch, yaw, and roll values in degrees.

A Direction can be created out of a Quaternion Tuple, indicated with the Q() function, as shown below:

    SET myDir TO Q( x, y, z, d ). // Where x, y, and z are a vector to roatate around, and d is how many degrees to rotate.

A Direction can be created out of a HEADING function.  The first parameter
is the compass heading, and the second parameter is the pitch above the horizon.

    SET myDIr TO HEADING (degreesFromNorth, pitchAboveHorizon)


A Direection can be made from many suffix terms of other structures, as shown below:

    SET myDir TO SHIP:FACING.
    SET myDir TO TARGET:FACING.
    SET myDir TO SHIP:UP.

Whenever a Direction is printed, it always comes out showing its Euler Rotation, regardless of how it was created.


#### Example

    SET X TO SHIP:PROGRADE + R(90,0,0). // Initializes a direction to prograde plus a relative pitch of 90
    LOCK STEERING TO X.                 // Steer the vessel in the direction suggested by direction X.

    SET Y TO HEADING(45, 10).           // Create a rotation facing northeast, 10 degrees above horizon
    LOCK STEERING TO Y.                 // Steer the vessel in the direction suggested by direction X.

    SET Direction TO R(0,90,0).        // Set by a rotation in degrees

You can use math operations on Directions as well. The next example uses a rotation of “UP” which is a system variable describing a vector directly away from the celestial body you are under the influence of.

    SET Direction TO SHIP:UP + R(0,-45,0).  // Set direction 45 degress west of “UP”.

