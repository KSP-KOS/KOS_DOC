Lists
======

***

## FOR $1 IN $2

Lists need to be iterated over sometimes, to help with this we have FOR.

#### Arguments
* $1: Local variable that is only in scope for that iteration
* $2: The [List](../../structure/list/index.html) you would like to iterate over

Example:

    SET FOO TO LIST().   // Creates a new list in FOO variable
    SET FOO:ADD TO 5.    // Adds a new element to the end of the list
    SET FOO:ADD TO ALTITUDE. // eg 10000
    SET FOO:ADD TO ETA:APOAPSIS. // eg 30

    FOR BAR IN FOO { PRINT BAR. }. // Prints 5, then 10000, then 30
    PRINT BAR. // ERROR, BAR doesn't exist outside the for statement


***

### LIST $1 IN $2

The active [Vessel](../../structure/vessel/index.html) has some default collections, this command stores them in a variable

#### Arguments
* $1: Collection name, See "Built-in Lists" below
* $2: The variable name you would like to store the new [List](../../structure/list/index.html) in

Example:

    LIST BODIES IN FOO. //Lists all [Bodies](../../structure/body/index.html) in the system

    FOR BAR IN FOO {
        PRINT BAR:NAME. //Will print the name of every [body](../../structure/body/index.html) in the system
    }.

***

### LIST $1 FROM $2 IN $3

The every [Vessel](../../structure/vessel/index.html) has some default collections, this command stores them in a variable

#### Arguments
* $1: Collection name, See "Built-in Lists" below
* $2: [Vessel](../../structure/vessel/index.html) object or the string name of the vessel you would like to get a list from
* $3: The variable name you would like to store the new [List](../../structure/list/index.html) in

Example:

    LIST RESOURCES FROM SOMEVESSEL IN FOO. //Adds variable FOO that contains a list of RESOURCES for the named vessel

    FOR BAR IN FOO {
        PRINT BAR:NAME. //Will print the name of every [body](../../structure/body/index.html) in the system
    }.

***

# Built-in Lists

These are the names of the lists available

##### Universal Lists
* Bodies - List of [Bodies](../../structure/body/index.html)
* Targets - List of [Vessels](../../structure/vessel/index.html)

##### Vessel Lists
* Resources - List of [Resources](../../structure/resource/index.html)
* Part - List of [Parts](../../structure/part/index.html)s
* Engines - List of [Engines](../../structure/engine/index.html)
* Sensors - List of [Sensors](../../structure/sensor/index.html)
* Elements
* DockingPorts - list of [DockingPorts](../../structure/dockingport/index.html)
