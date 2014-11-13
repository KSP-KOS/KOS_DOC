PartModule
=====

Almost everything done with at rightclick menus and action group action can
be accessed via the partmodule objects that are attached to parts of a ship.

The exact arrangement of PartModules to Parts to Ships, and how to make
use of a PartModule is a complex enough topic to warrant its own separate
subject, described on the [Ship parts and Modules](../../summary_topics/shippartsandmodules/index.html)
page.  If you have not read that page, it is recommended that you do
so before using PartModules.  The page you are reading now is meant as
just a reference summary, not a tutorial.

Once you have a PartModule, you can use it to invoke the behaviors that
are connected to its right-click menu and to its action groups.


### Structure


Suffix       | Type                                    | Get | Set | Method&nbsp;Arguments | Description
-------------|-----------------------------------------|-----|-----|-----------------------|----------------------------------
:NAME        | String                                  | yes | no  | zero args  | Get the name of the module.  Note that it's the same as the name given in the MODULE section of the Part.cfg file for the part.
:PART        | [Part](../part/index.html)              | yes | no  | zero args  | Get the [Part](../part/index.html) that this PartModule is attached to.
:ALLFIELDS   | [List](../list/index.html) of Strings   | yes | no  | zero args  | Get a list of all the names of KSPFields on this PartModule that the kos script is CURRENTLY allowed to get or set with :GETFIELD or :SETFIELD.  Note the Security access comments below.  This list can become obsolete as the game continues running depending on what the PartModule chooses to do.
:ALLEVENTS   | [List](../list/index.html) of Strings   | yes | no  | zero args  | Get a list of all the names of KSPEvents on this PartModule that the kos script is CURRENTLY allowed to trigger with :DOEVENT.  Note the Security access comments below.  This list can become obsolete as the game continues running depending on what the PartModule chooses to do.
:ALLACTIONS  | [List](../list/index.html) of Strings   | yes | no  | zero args  | Get a list of all the names of KSPActions on this PartModule that the kos script is CURRENTLY allowed to trigger with :DOACTION.  Note the Security access comments below.
:GETFIELD    | varies     | yes | no  | one arg:<br/>fieldName [string] | Get the value of one of the fields that this PartModule has placed onto the rightclick menu for the part.  Note the Security comments below.
:SETFIELD    | n/a        | no  | via method  | two args:<br/>fieldName [string],<br/>newValue [varies] | Set the value of one of the fields that this PartModule has placed onto the rightclick menu for the part.  Note the Security comments below.
:DOEVENT     | n/a        | no  | via method  | one args:<br/>eventName [string] | Trigger an "event button" that is on the rightclick part menu at the moment.  Note the Security comments below.
:DOACTION    | n/a        | no  | via method  | two args:<br/>actionName [string],<br/>newBoolValue [boolean] | Activate one of this PartModule's action-group-able actions, bypassing the action group system entirely by just activating it for this one part directly.  The boolean value decides whether you are toggling the action ON or toggling it OFF.  Note the Security comments below.
:HASFIELD    | Boolean    | yes | no  | one arg:<br/>fieldName [string]  | Return true if the given field name is currently available for use with :GETFIELD or :SETFIELD on this PartModule, false otherwise.
:HASEVENT    | Boolean    | yes | no  | one arg:<br/>eventName [string]  | Return true if the given event name is currently available for use with :DOEVENT on this PartModule, false otherwise.
:HASACTION   | Boolean    | yes | no  | one arg:<br/>actionName [string] | Return true if the given action name is currently available for use with :DOACTION on this PartModule, false otherwise.

**NOTES:**

In all the above cases where there is a name being passed in to
:GETFIELD, :SETFIELD, :DOEVENT, or :DOACTION, the name is meant to be
the name that is seen by you, the user, in the GUI screen, and NOT
necessarily the actual name of the variable that the programmer of
that PartModule chose to call the value behind the scenes.  This is so
that you can view the GUI rightclick menu to see what to call things in
your script.

Security and Respecting other Mod Authors
-----------------------------------------

There are often a lot more fields and events and actions that a partmodule
can do than are usable via kOS.  In designing kOS, the kOS developers have
deliberately chosen NOT to expose any "hidden" fields of a partmodule
that are not normally shown to the user, without the express permission
of a mod's author to do so.

The access rules that kOS uses are as follows:

### For KSPFields:

* Is this a value that the user can normally see on the right-click context
menu for a part?  If so, then let kOS scripts GET the value.

* Is this a value that the user can normally manipulate via "tweakable"
adjustments on the right-click context menu for a part, AND, is that
tweakable a CURRENTLY enabled one?  If so, then let KOS scripts SET the
value, BUT they must set it to one of the values that the GUI would normally
allow, according to the following rules.
  * If the KSPField is boolean:
    * The value must be true, false, or 0 or 1.
  * If the KSPField is an integer:
    * The value must be a whole number.
  * If the KSPField is a floating point sliding number:
    * The GUI for this field will be definhed as a slider with a min value, a max value, with a fixed increment interval where the detents are.  When setting such a value, you will be constrained to the limits of this slider.
      * For example: If a slider is defined to have a minimum value of 2.0, a maximum value of 5.0, and a minimum allowed delta increment of 0.1:
        * If you try to set it to 0, it will instead become 2, the minimum allowed value.
        * If you try to set it to 9, it will instead become 5, the maximum allowed value.
        * If you try to set it to 3.14159, it will instead become 3.1, because that's rounding to the nearest increment step the slider supports.
  * If the KSPField is a string:
    * There is currently no way to set these because kOS uses the existence of a gui tweakable as "proof" that it's okay to modify the field, and in the stock game there are no gui tweakables for string fields.  This may change in the future if mods that extend the tweakables system are taken into account.

### For KSPEvents:

* Is this an event that has a GUI button assocated with it that is currently
visible on the rightclick menu?  If the answer is yes, then it will also
be triggerable by kOSScripts, otherwise it won't. 

### For KSPActions:

* Is this an action that the KSP user would have been allowed to set as
part of an action group during building in the VAB or SPH?  If so, then
allow a kOS script to use it, EVEN IF it has never actually been added to
an action group for this vessel.

**If a KSPField, KSPEvent, or KSPAction has been disallowed, often in kOS
it won't even appear to be a field of the PartModule at all.**  This is
necessary because for some modules, the number of fields you can use are far
outnumberd by the number of fields that exist but are normally hidden from
view.  It would become unworkable if all of the unusable ones were exposed
to kOS scripts to see as fields.

**Which KSPFields, KSPEvents, and KSPActions exist on a PartModule can
change during runtime!** A PartModule is allowed to change the look
and feel of its rightclick menu fields on the fly as the game runs.
Therefore a field that didn't exist the last time you looked might now
exist, and might not exist again next time.  The list of what fields
exist is context dependant.  For example, a docking port may have an
event button on it called "Undock Node", that only exists when that port
is connected to another port.  If it's not connected, the button may
be gone.  Similarly, a PartModule might toggle something by using
a pair of two events that swap in and out depending on the current
state.  For example, many of the stock lights in the game have a
"Turn on" button that after it's been clicked, gets replaced with a
"Turn off" button until it's clicked again.  A boolean toggle
with a KSPFIeld would be simpler, but until "tweakables" existed in
the main game, that wasn't an option so a lot of older Partmodules
still do things the old way with two KSPEvents that swap in and out.

