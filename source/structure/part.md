PART
====

The generic properties every PART has.

You can obtain a list of values of type Part using the [LIST PARTS](../../command/list/index.html#vessel-lists) command.

Structure
=========

Suffix      | Type     | Get | Set | Method&nbsp;Arguments | Description
------------|----------|-----|-----|-----------------------|---------------
:NAME       | String   | yes | no  | zero args             | name of part.
:STAGE      | Number   | yes | no  | zero args             | the stage this part is part of.
:UID        | Number   | yes | no  | zero args             | All parts have a unique ID number.  Test if two parts are the same part by seeing if this is the same between them.
:RESOURCES  | [List](../list/index.html) | yes | no  | zero args | list of the [ResourceValues](../resource/index.html) in this part.
:MODULES    | [List](../list/index.html) of strings | yes | no  | zero args | list of the names of [PartModules](../partmodule/index.html) enabled for this part.
:GETMODULE  | [PartModule](../partmodule/index.html) | yes | no | one arg:<br/>moduleName [string] | Get one of the [PartModules](../partmodule.html) attached to this part, given the name of the module.  (See :MODULES for a list of all the mames available).
:TARGETABLE | Boolean  | yes | no  | zero args | true if this part can be selected by KSP as a target.
:SHIP       | [Vessel](../vessel/index.html)       | yes | no  | zero args | the vessel that contains this part.
:FACING     | [Direction](../direction/index.html) | yes | no  | zero args | the direction that this part is facing.
:CONTROLFROM| Boolean  | no  | yes | zero args | Set to TRUE to cause the game to do the same thing as when you rightclick a part on a vessel and select "control from here" on the menu.  It rotates the control orientation so that fore/aft/left/right/up/down now match the orientation of this part.  NOTE that this will not work for every type of part.  It only works for those parts that KSP itself allows this for (control cores and docking ports).

Example:

    // This example assumes you have a target vessel picked, and that the
    // target vessel is loaded into full-physics range and not "on rails".
    // vessels that are "on rails" do not have their full list of parts
    // entirely populated at the moment:
    //
    LIST PARTS FROM TARGET IN tParts.
    PRINT "The target vessel has a partcount of " + tParts:LENGTH.
    SET totTargetable to 0.
    FOR part in tParts {
        IF part:TARGETABLE {
            SET totTargetable TO totTargetable + 1.
        }.
    }.
    PRINT "...and " + totTargetable + " of them are targetable parts.".

