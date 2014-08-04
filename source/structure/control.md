#### SHIP:CONTROL or VESSEL:CONTROL has the following components:

Represents the flight controls of a [Vessel](../vessel/index.html).

If you wish to have your kOS script manipulate a vessel's flight controls
directly in a raw way, rather than relying on kOS to handle the flying for
you, then this is the type of structure you will need to use to do it.

This is offered as an alternative to using the combination of LOCK STEERING
and LOCK THROTTLE commands.

To obtain the CONTROL variable for a vessel, use its :CONTROL suffix:

    SET controlStick to SHIP:CONTROL.
    SET controlStick:PITCH to 0.2.

For a full explanation on how to use RAW control to fly a ship,
see the [page about flight control](../../summary_topics/ship_control/index.html).

Unlike with so-called "Cooked" steering, "raw" steering uses the SET command, not the LOCK command.
Using LOCK with these controls won't work.


Suffix          | type   | GET | SET | Description           | Equivalent WASDQE, NHIJKL manual keyboard controls
----------------|--------|-----|-----|-----------------------|------------------------------------------
:YAW            | number | yes | yes | Affects Rotation      | -1.0 = "D". 1.0 = "A"
:PITCH          | number | yes | yes | Affects Rotation      | -1.0 = "W". 1.0 = "S"
:ROLL           | number | yes | yes | Affects Rotation      | -1.0 = "Q". 1.0 = "E"
:ROTATION       | [Vector](../vector/index.html) |yes|yes| Controls all the above 3 things in one vector together. |
:FORE           | number | yes | yes | Affects Translation   | -1.0 = "N". 1.0 = "H"
:STARBOARD      | number | yes | yes | Affects Translation   | -1.0 = "L". 1.0 = "J"
:TOP            | number | yes | yes | Affects Translation   | -1.0 = "I". 1.0 = "K"
:TRANSLATION    | [Vector](../vector/index.html) |yes|yes| Controls all the above 3 things in one vector together. |
:NEUTRAL        | boolean| yes | no  | Reports if control was let go | are any manual controls pressed?
:NEUTRALIZE     | boolean| no  | yes | Causes manual control to let go | When set to true, kOS lets go of the controls and allows the player to manually control them again.
:MAINTHROTTLE   | number | yes | yes | Affects the throttle | Set between 0.0 and 1.0 much like the cooked flying "LOCK THROTTLE" command.
:WHEELTHROTTLE  | number | yes | yes | Affects the throttle just for wheels | set between 0.0 and 1.0.  will not be used when off the ground.
:WHEELSTEER     | number | yes | yes | Affects the steering on ground | set to the range -1..+1 to turn left or right like using the "A" and "D" keys while driving.

Be aware that kOS can't control a control at the same time that
a player controls it.  If kOS is taking control of the yoke, then the player can't manually control it.
Remember to run

    SET SHIP:CONTROL:NEUTRALIZE TO TRUE.

after the script is done using the controls, or the player will be locked out of control.
