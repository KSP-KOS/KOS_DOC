# List

Collection of Any type in kOS

Structure
=========

### Getters
* CLEAR
* LENGTH
* COPY
* ITERATOR


### Setters
* ADD
* CONTAINS
* REMOVE - Number (index)


Example:
    
    SET FOO TO LIST().   // Creates a new list in FOO variable
    SET FOO:ADD TO 5.    // Adds a new element to the end of the list
    SET FOO:ADD TO ALTITUDE. 
    SET FOO:ADD TO ETA:APOAPSIS. 
    PRINT FOO:LENGTH.    // Prints 3
    SET FOO:REMOVE TO 1. // Removes the second element from the list
    SET BAR TO FOO:COPY. // Makes a copy of the FOO list
    FOO:CLEAR.           // Removes all elements from the FOO list.

Resources
------

Aggregate Resources of all parts

* NAME
* AMOUNT
* CAPACITY

Parts
------

This list can be long, use carefully 

* NAME
* STAGE
* UID 
* RESOURCES - List

Sensors
------

All Sensors on the craft (eg Pressure, Gravity, ect)

* TYPE
* ACTIVE - bool, can be set to activate/deactivate
* READOUT

Elements
------

All docked flights for the current vessel. 

* NAME
* ID
* PARTCOUNT
* RESOURCES - List

Printout Lists
======

Outputs data to the console. Lists files by default.
Example:

    LIST.           // Lists files on the active volume
    LIST FILES.     // Lists files on the active volume
    LIST VOLUMES.   // Lists all volumes, with their numbers and names
    LIST BODIES.    // Lists celestial bodies and their distance
    LIST TARGETS.   // Lists target-able vessels in range
    LIST RESOURCES. // List of resources by stage
    LIST PARTS.     // Lists parts in vessel
    LIST ENGINES.   // List of engines
