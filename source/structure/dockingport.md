# DockingPort

Some of the Parts returned by  LIST PARTS will be of type DockingPort.

Structure
=========

#### Getters

* All the suffixes of [Part](../part/index.html) plus...
  * STATE - String - One of the following values:
    * "Ready" - Docking port is not yet attached and will attach if it touches another.
    * "Docked (docker)" - One port in the joined pair is called the docker, and has this state
    * "Docked (dockee)" - One port in the joined pair is called the dockee, and has this state
    * "Docked (same vessel)" - Sometimes KSP says this instead.  It's unclear what it means.
    * "Disabled" - Docking port will refuse to dock if it bumps another docking port.
    * "PreAttached" - Temp state during the "wobbling" while two ports are magnetically touching but not yet docked solidly.  During this state the two vessels are still tracked as separate vessels and haven't become one yet.
  * DOCKEDVESSELNAME - String - name of the vessel docked to the port.
  * TARGETABLE - boolean - True if this part can be picked with SET TARGET TO...

#### Setters
* All the suffixes of [Part](../part/index.html) plus...

