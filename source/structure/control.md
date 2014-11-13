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


### Direct Flight Controls

These "Raw" controls allow you the direct control of flight parameters while the current program is running.

#### Rotation

Suffix              | type   | GET | SET | Description                          | Equivalent WASDQE, NHIJKL manual keyboard controls
--------------------|--------|-----|-----|--------------------------------------|------------------------------------------
:YAW                | number | yes | yes | Affects Rotation                     | -1.0 = "D". 1.0 = "A"
:PITCH              | number | yes | yes | Affects Rotation                     | -1.0 = "W". 1.0 = "S"
:ROLL               | number | yes | yes | Affects Rotation                     | -1.0 = "Q". 1.0 = "E"
:YAWTRIM            | number | yes | yes | Affects Rotation Trim                | 
:PITCHTRIM          | number | yes | yes | Affects Rotation Trim                | 
:ROLLTRIM           | number | yes | yes | Affects Rotation Trim                | 
:ROTATION           | [Vector](../vector/index.html) |yes|yes | Controls all the above 3 things in one vector together. |
:FORE               | number | yes | yes | Affects Translation                  | -1.0 = "N". 1.0 = "H"
:STARBOARD          | number | yes | yes | Affects Translation                  | -1.0 = "L". 1.0 = "J"
:TOP                | number | yes | yes | Affects Translation                  | -1.0 = "I". 1.0 = "K"
:TRANSLATION        | [Vector](../vector/index.html) |yes|yes | Controls all the above 3 things in one vector together. |
:MAINTHROTTLE       | number | yes | yes | Affects the throttle                 | Set between 0.0 and 1.0.  much like the cooked flying "LOCK THROTTLE" command.
:WHEELSTEER         | number | yes | yes | Affects the steering on ground       | set to the range -1..+1 to turn left or right like using the "A" and "D" keys while driving.
:WHEELSTEERTRIM     | number | yes | yes | Affects the steering trim on ground  | 
:WHEELTHROTTLE      | number | yes | yes | Affects the throttle on ground       | set between 0.0 and 1.0.  will not be used when off the ground.
:WHEELTHROTTLETRIM  | number | yes | yes | Affects the throttle trim on ground  | 
:NEUTRAL            | boolean| yes | no  | Reports if kOS has any set controls  | 
:NEUTRALIZE         | boolean| no  | yes | Causes manual control to let go      | When set to true, kOS lets go of the controls and allows the player to manually control them again.

### Pilot commands

These suffixes allow you to read the input given to the system by the user. 

Suffix                   | type   | GET | SET | Description                     | Equivalent WASDQE, NHIJKL manual keyboard controls
-------------------------|--------|-----|-----|---------------------------------|------------------------------------------
:PILOTYAW                | number | yes | no  | Pilot's Rotation                | -1.0 = "D". 1.0 = "A"
:PILOTPITCH              | number | yes | no  | Pilot's Rotation                | -1.0 = "W". 1.0 = "S"
:PILOTROLL               | number | yes | no  | Pilot's Rotation                | -1.0 = "Q". 1.0 = "E"
:PILOTYAWTRIM            | number | yes | no  | Pilot's Rotation Trim           | 
:PILOTPITCHTRIM          | number | yes | no  | Pilot's Rotation Trim           | 
:PILOTROLLTRIM           | number | yes | no  | Pilot's Rotation Trim           | 
:PILOTROTATION           | [Vector](../vector/index.html) |yes|no | Controls all the above 3 things in one vector together. |
:PILOTFORE               | number | yes | no  | Pilot's Translation             | -1.0 = "N". 1.0 = "H"
:PILOTSTARBOARD          | number | yes | no  | Pilot's Translation             | -1.0 = "L". 1.0 = "J"
:PILOTTOP                | number | yes | no  | Pilot's Translation             | -1.0 = "I". 1.0 = "K"
:PILOTTRANSLATION        | [Vector](../vector/index.html) |yes|no | Controls all the above 3 things in one vector together. |
:PILOTMAINTHROTTLE       | number | yes | yes | Throttle when kOS is inactive   | Range between 0.0 and 1.0  
:PILOTWHEELTHROTTLE      | number | yes | no  | Pilot's Wheel Throttle          | Range between 0.0 and 1.0  
:PILOTWHEELTHROTTLETRIM  | number | yes | no  | Pilot's Wheel Throttle Trim     | Range between 0.0 and 1.0  
:PILOTWHEELSTEER         | number | yes | no  | Pilot's Wheel Steering          | set to the range -1..+1 to turn left or right like using the "A" and "D" keys while driving.
:PILOTWHEELSTEERTRIM     | number | yes | no  | Pilot's Wheel Steering Trim     | set to the range -1..+1 to turn left or right like using the "A" and "D" keys while driving.
:PILOTNEUTRAL            | number | yes | no  | Is the pilot active?            | -1.0 = "I". 1.0 = "K"

Be aware that kOS can't control a control at the same time that
a player controls it.  If kOS is taking control of the yoke, then the player can't manually control it.
Remember to run

    SET SHIP:CONTROL:NEUTRALIZE TO TRUE.

after the script is done using the controls, or the player will be locked out of control.
