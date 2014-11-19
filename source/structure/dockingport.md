DockingPort
===========

Some of the Parts returned by [LIST PARTS](../../command/list/index.html#vessel-lists) will be of type DockingPort.

#### Structure

Suffix            | Type      | Get | Set | Method arguments | Description
------------------|-----------|-----|-----|------------------|---------------------------------------------
All the suffixes of [Part](../part/index.html) | varies | .. | .. | .. | A DockingPort is a kind of Part, and therefore can use all the suffixes of Part.  Shown below are only the suffixes that are unique to DockingPort
:AQUIRERANGE      | Number    | yes | no  | no args | gets the range at which the port will "notice" another port and pull on it.
:AQUIREFORCE      | Number    | yes | no  | no args | gets the force with which the port pulls on another port.
:AQUIRETORQUE     | Number    | yes | no  | no args | gets the rotational force with which the port pulls on another port.
:REENGAGEDDISTANCE| Number    | yes | no  | no args | how far the port has to get away after undocking in order to re-enable docking.
:DOCKEDSHIPNAME   | Number    | yes | no  | no args | name of vessel on the other side of the docking port.
:PORTFACING       | [Direction](../direction/index.html) | yes | no  | no args | Gets the facing of this docking port which may differ from the facing of the part itself if the docking port is aimed out the side of the part, as in the case of the inline shielded docking port.
:STATE            | string    | yes | no  | no args | One of the string values listed below after the table.
:UNDOCK           | n/a       | n/a | no  | no args | CALL this as a method to cause the docking port to detach.
:TARGETABLE       | boolean | yes | no | no args | True if this part can be picked with SET TARGET TO

The values to the :STATE suffix can be any of the following:

* "Ready" - Docking port is not yet attached and will attach if it touches another. 
* "Docked (docker)" - One port in the joined pair is called the docker, and has this state 
* "Docked (dockee)" - One port in the joined pair is called the dockee, and has this state 
* "Docked (same vessel)" - Sometimes KSP says this instead.  It's unclear what it means. 
* "Disabled" - Docking port will refuse to dock if it bumps another docking port. 
* "PreAttached" - Temp state during the "wobbling" while two ports are magnetically touching but not yet docked solidly.  During this state the two vessels are still tracked as separate vessels and haven't become one yet.</ul>
