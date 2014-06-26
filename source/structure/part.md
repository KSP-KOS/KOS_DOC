# PART

The generic properties every PART has.

Structure
=========

#### Getters

* NAME - String - name of part.
* STAGE - Number - the stage this part is part of.
* UID - Number - All parts have a unique ID number.  Test if two parts are the same part by seeing if this is the same between them.
* RESOURCES - [List](../list/index.html) of the [ResourceValues](../resource/index.html) in this part.
* MODULES - [List](../list/index.html) of the module types enabled for this part.
* TARGETABLE - Boolean true if this part can be selected by KSP as a target.
* SHIP - The [Vessel](../vessel/index.html) containing this part.
* FACING - The [Direction](../direction/index.html) that this part is facing.

#### Seters

* CONTROLFROM - set to TRUE to cause the game to do the same thing as when you rightclick a part on a vessel and select "control from here" on the menu.  It rotates the control orientation so that fore/aft/left/right/up/down now match the orientation of this part.  NOTE that this will not work for every type of part.  It only works for those parts that KSP itself allows this for (control cores and docking ports).

