PART
====

The generic properties every PART has.

You can obtain a list of values of type Part using the [LIST PARTS](../../command/list/index.html#vessel-lists) command.

Structure
=========

Suffix      | Type     | Get | Set | Method&nbsp;Arguments | Description
------------|----------|-----|-----|-----------------------|---------------
:CONTROLFROM| Boolean  | no  | yes | zero args | Set to TRUE to cause the game to do the same thing as when you rightclick a part on a vessel and select "control from here" on the menu.  It rotates the control orientation so that fore/aft/left/right/up/down now match the orientation of this part.  NOTE that this will not work for every type of part.  It only works for those parts that KSP itself allows this for (control cores and docking ports).
:NAME       | String   | yes | no  | zero args             | Name of part as it is used behind the scenes in the game's API code.
:TITLE      | String   | yes | no  | zero args             | The title of the part as it appears on-screen in the gui.
:TAG        | String   | yes | no  | zero args             | The name tag value that may exist on this part if you have given the part a name via the [nametag system](../../summary_topics/nametag/index.html)
:STAGE      | Number   | yes | no  | zero args             | the stage this part is part of.
:UID        | Number   | yes | no  | zero args             | All parts have a unique ID number.  Test if two parts are the same part by seeing if this is the same between them.
:ROTATION   | [Direction](../direction/index.html) | yes | no  | zero args | The rotation of this part's X-axis, which points out of its side and is probably not what you want.  You probably want the :FACING suffix instead.
:POSITION   | [Vector](../vector/index.html) | yes | no  | zero args | The location of this part in the universe.  It is expressed in the same frame of reference as all the other positions in kOS, and thus can be used to help do things like navigate toward the position of a docking port.
:FACING     | [Direction](../direction/index.html) | yes | no  | zero args | the direction that this part is facing.
:RESOURCES  | [List](../list/index.html) | yes | no  | zero args | list of the [ResourceValues](../resource/index.html) in this part.
:TARGETABLE | Boolean  | yes | no  | zero args | true if this part can be selected by KSP as a target.
:SHIP       | [Vessel](../vessel/index.html)       | yes | no  | zero args | the vessel that contains this part.
:GETMODULE  | [PartModule](../partmodule/index.html) | yes | no | one arg:<br/>moduleName [string] | Get one of the [PartModules](../partmodule.html) attached to this part, given the name of the module.  (See :MODULES for a list of all the mames available).
:MODULES or :ALLMODULES | [List](../list/index.html) of strings | yes | no  | zero args | list of the names of [PartModules](../partmodule/index.html) enabled for this part.
:PARENT     | [Part](#Part) | yes | no | zero args         | When walking the [tree of parts](../../summary_topics/vesselpartquery/index.html), this is the part that this part is attached to on the way "up" toward the root part.
:HASPARENT  | Boolean  | yes | no  | zero args             | When walking the [tree of parts](../../summary_topics/vesselpartquery/index.html), this is true as long as there is a parent part to this part, and is false if this part has no parent (which can only happen on the root part).
:CHILDREN   | [List](../list/index.html) of [Parts](#Part) | yes | no  | zero args | When walking the [tree of parts](../../summary_topics/vesselpartquery/index.html), this is all the parts that are attached as children of this part.  It returns a list of zero length when this part is a "leaf" of the parts tree.

These are the meanings of the part naming fields:

**Part:TAG**: A part's *tag* is whatever custom name you have given it using the
[nametag system described here](../../summary_topics/nametag/index.html).  This is probably the
best naming convention to use because it lets you make up whatever name you like
for the part and use it to pick the parts you want to deal with in your script.

**Part:TITLE**: A part's *title* is the name it has inside the GUI interface on
the screen that you see as the user.

**Part:NAME**: A part's *name* is the name it is given behind the scenes in KSP.
It never appears in the normal GUI for the user to see, but it is used in places
like Part.cfg files, the saved game persistence file, the ModuleManager mod,
and so on.

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

