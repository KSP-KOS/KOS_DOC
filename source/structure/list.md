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

FOR
======

Lists need to be iterated over sometimes, to help with this we have FOR.

    SET FOO TO LIST().   // Creates a new list in FOO variable
    SET FOO:ADD TO 5.    // Adds a new element to the end of the list
    SET FOO:ADD TO ALTITUDE. // eg 10000
    SET FOO:ADD TO ETA:APOAPSIS. // eg 30 

    FOR BAR IN FOO { PRINT BAR. }. // Prints 5, then 10000, then 30
    PRINT BAR. // ERROR, BAR doesn't exist outside the for statement

Built-in Lists
======

Builds a list of various resources and saves them to a variable.

* Bodies - List of [Bodies](/KOS/structure/body)
* Targets - List of [Vessels](/KOS/structure/vessel)
* Resources
* Parts
* Engines - List of [Engines](/KOS/structure/engines)
* Sensors 
* Elements

    EXAMPLE USAGE:
    LIST ENGINES IN FOO // Creats a list of the currently active engines and puts it in the FOO variable

    FOR BAR IN FOO {
        PRINT BAR:THRUST.
    }.


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
