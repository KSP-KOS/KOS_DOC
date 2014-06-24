# DockingPort

Some of the Parts returned by  LIST PARTS will be of type DockingPort.

Structure
=========

#### Getters

* All the suffixes of [Part](../part/index.html) plus...
  * STATE - String - "DOCKED", etc - TODO: put the list of possible strings here.
  * FACING - [Direction](../direction/index.html) the way the port is oriented.
  * DOCKEDVESSELNAME - String - name of the vessel docked to the port.
  * TARGETABLE - boolean - True if this part can be picked with SET TARGET TO...

#### Setters
* All the suffixes of [Part](../part/index.html) plus...

