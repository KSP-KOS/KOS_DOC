DockingPort
===========

Some of the Parts returned by [LIST PARTS](../../command/list/index.html#vessel-lists) will be of type DockingPort.

#### Structure

Suffix      | Type      | Get | Set | Description
------------|-----------|-----|-----|--------------------------------------
All the suffixes of [Part](../part/index.html) | varies | .. | .. | A DockingPort is a kind of Part, and therefore can use all the suffixes of Part.  Shown below are only the suffixes that are unique to DockingPort
:STATE      | string    | yes | no  |  One of the string values listed below after the table.
:DOCKEDVESSELNAME | string | yes | no | name of the vessel docked to the port.
:TARGETABLE | boolean | yes | no | True if this part can be picked with SET TARGET TO

The values to the :STATE suffix can be any of the following:

* "Ready" - Docking port is not yet attached and will attach if it touches another. 
* "Docked (docker)" - One port in the joined pair is called the docker, and has this state 
* "Docked (dockee)" - One port in the joined pair is called the dockee, and has this state 
* "Docked (same vessel)" - Sometimes KSP says this instead.  It's unclear what it means. 
* "Disabled" - Docking port will refuse to dock if it bumps another docking port. 
* "PreAttached" - Temp state during the "wobbling" while two ports are magnetically touching but not yet docked solidly.  During this state the two vessels are still tracked as separate vessels and haven't become one yet.</ul>
