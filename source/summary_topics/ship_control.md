# Summary of how to control a ship

This page describes an overview of how to control a ship.  For full details
on the structures and commands seen here, look elsewhere in the documentation.

There are two styles of control:
* "Cooked" - Give a goal direction to seek, and let kOS find the way to manuever toward it.
* "Raw" - Control the craft just like a manual pilot would do from a keyboard or joystick.


"Cooked" Control
================
In this style of controlling the craft, you do not steer the craft directly, but instead
select a goal direction and let kOS pick the way to steer toward that goal. This method
of controlling the craft consists primarily of the following two commands:
* LOCK THROTTLE TO _value_ .
    * Where _value_ is a floating point number betwen 0.0 and 1.0.  A value of 0.0 means the
    throttle is idle, and a value of 1.0 means the throttle is at maximum.  A value of 0.5 
    means the throttle is at the halfway point, and so on.
* LOCK STEERING TO _value_ .
    * Where _value_ is one of the following:
        * a [Direction]{/KOS_DOC/structure/direction}. There are two ways to express a direction:
            * A Rotation expressed as R(_pitch_,_yaw_,_roll_).  Note that pitch, yaw, and roll are
            not based on the horizon, but based on an internal coordinate system used by KSP that
            is hard to use.  Thankfully you can force the rotation into a sensible frame of
            reference by adding a rotation to a known direction first.  For example:
                * LOCK STEERING TO Up + R(20,0,0).
            To select a direction that is 20 degrees off from straight up, or
                * LOCK STEERING TO North + R(0,90,0).
            To select a direction that is due east, aimed at the horizon.
            'UP' and 'NORTH' are the only two predefined rotations.
            * A heading expressed as HEADING(_compass_,_pitch_).
                * LOCK STEERING TO HEADING( 180, 30 ).
                    *for example will aim 30 degrees above the horizon, due south.
        * a [Vector]{/KOS_DOC/structure/vector}.
            * Any vector can also be used to lock steering.  Examples:
                * LOCK STEERING TO V(100,50,10).
                    * Note that the internal coordinate system for X,Y,and Z is quite complex to explain.
                * LOCK STEERING TO (-1) * SHIP:VELOCITY:SURFACE.
                    * Aim in the opposite of the surface velocity direction.
                * LOCK STEERING TO VCRS( SHIP:VELOCITY:ORBIT, BODY:POSITION).
                    * Aim at a vector which is the cross product of velocity and direction down to the
                    SOI planet - in other words, aim at the "Normal" direction to the orbit.

Like all LOCK expressions, the steering and throttle continually update 'magically' on their own when
using this style of control.  If you lock your steering to velocity, then as your velocity changes, your
steering will change to match it.  Unlike with other LOCK expressions, the steering and throttle are special
in that the lock expression gets executed automatically all the time in the background, while other LOCK
expressions only get executed when you try to read the value of the variable.  (The reason is that the
kOS computer is constantly querying the lock expression multiple times per second as it adjusts the
steering and throttle in the background.)

#### UNLOCKING controls:

If you LOCK the THROTTLE or STEERING, be aware that this prevents the user from manually controlling
them.  Until they unlock, the manual controls are prevented from working.  You can free up the
controls by issuing these two commands:
* UNLOCK STEERING.
* UNLOCK THROTTLE.

When the program ends, these automatically unlock as well, which means that to control a craft you
must make sure the program doesn't end.  The moment it ends it lets go of the controls.

#### Advantages/Disadvantages:

The advantge of "Cooked" control is that it is simpler to write scripts for, but the disadvantage
is that you have no control over the details of the motion.  You can't dictate how fast or slow
the craft rotates, or which axis it tries to rotate around first, and if your craft is wobbly,
you can't dampen the wobbliness.


Raw Control
===========
The other way to control a vessel is to control its motion more directly like you would if you
were controlling it from the keyboard.  When controlling the ship in a raw way, you must decide
how to move the controls in detail.

Unlike with the Cooked control technique, Raw control works with the SET command.

To control a ship you use the following suffixes to SHIP:CONTROL.

For example:
  SET SHIP:CONTROL:YAW to 0.2.
Will start pushing the ship to rotate a bit faster to the right, like pushing the 'D' key gently.

All the following values are set between -1.0 and +1.0.  Zero means the control is
neutral.  You can set to values smaller in magnitude than -1 and 1 for gentler control:

* YAW - rotate left/right, like pressing "A" and "D" on the keyboard.
* PITCH - rotate up/down, like pressing "W" and "S" on the keyboard.
* ROLL - tilt left/right, like pressing "Q" and "E" on the keyboard.
* FORE - translate backward/forward, like pressing "N" and "H" on the keyboard.  Needs RCS ON to be effective.
* STARBOARD - translate left/right, like pressing "J" and "L" on the keybaord.  Needs RCS ON to be effective.
* TOP - translate up/down, like pressing "I" and "K" on the keybaord.  Needs RCS ON to be effective.
* MAINTHROTTLE - -1 to 1, same as THROTTLE.

The following can be read to see the ship's current situation:
* ROTATION - Vector
* TRANSLATION - Vector

#### UNLOCKING controls:
Once any of the SET SHIP:CONTROL commands have been used to control the ship, then the manual control by the
player is locked out.  To give control back to the player you must execute:
* SET SHIP:CONTROL:NEUTRALIZE to TRUE.

#### Advantages/Disadvantages:
The control over RCS translation requires the use of Raw control.  Also, with raw control you can choose how
gentle to be with the controls and it can be possible to control wobbly craft better with raw control than
with cooked control.

OTHER CONTROLS
==============
* SET PART:CONTROLFROM TO _true/false_ - If you have a handle on a part, from LIST PARTS, you can select that part to
set the orientation of the craft, just like using the "control from here" in the rightclick menu in the game.
* RCS _on/off_ - Turns the RCS on or off, like using "R" at the keyboard.
* SAS _on/off_ - Turns the SAS on or off, like using "T" at the keybaord.
* LIGHTS _on/off_ - Turns the lights on/off, like using the"U" key at the keyboard.
* BRAKES _on/off_ - Turns the brakes on/off, like clicking the brakes button  (NOT like using the "B" key, because they stay on.)
* SET TARGET TO _name_ - where NAME is the name of a target vessel or planet.  Sets the current target.

Note that the above options also can refer to a different vessel besides the current ship, for example, TARGET:THROTTLE
to read the target's throttle.  But not all "set" or "lock" options will work with a different vessel other than the
current one, because there's no authority to control a craft the current program isn't attached to.
