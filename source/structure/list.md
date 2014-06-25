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

### Access to individual elements
All list indexes start counting at zero.  (The list elements are numbered from 0 to N-1 rather than from 1 to N.)

* list#x operator: access the element at postion x.  Works for get or set.  X must be a hardcoded number or a variable name.
* list[expression] operator: another syntax to acceess the element at position 'expression'.  Works for get or set.  Any arbitrary complex expression may be used with this syntax, not just a number or variable name.
* FOR VAR IN LIST { ... }.  : a loop in which var iterates over all the items of list from item 0 to item LENGTH-1.


Example:
    
    SET FOO TO LIST().       // Creates a new list in FOO variable
    SET FOO:ADD TO 5.        // Adds a new element to the end of the list
    SET FOO:ADD TO ALTITUDE. 
    SET FOO:ADD TO ETA:APOAPSIS. 
    PRINT FOO:LENGTH.        // Prints 3
    PRINT FOO#0.             // Prints 5.
    PRINT FOO[0].            // Prints 5.
    PRINT FOO#1.             // Prints altitude number.
    PRINT FOO#2.             // Prints eta:apoapsis number.
    SET x TO 2. PRINT FOO#x. // Prints the same thing as FOO#2.
    SET x TO 2. PRINT FOO[x].// Prints the same thing as FOO#2.
    SET y to 3. PRINT FOO[ y/3 + 1 ].
                             // Prints the same thing as FOO#2, using an expression as the index.
    SET FOO#0 to 4.          // Replace the 5 at position 0 with a 4.
    SET FOO:REMOVE TO 1.     // Removes the second element from the list
    SET BAR TO FOO:COPY.     // Makes a copy of the FOO list
    FOO:CLEAR.               // Removes all elements from the FOO list.
    FOR var in FOO {         // --.
      print var.             //   |-- Print all the contents of FOO.
    }.                       // --'

### Multidimensional Arrays
A 2-D Array is a List who's elements are themselves also Lists.  A 3-D Array is a List of Lists of Lists.  Any number of dimensions is posible.

* "list#x#y" or "list[x][y]": access the element at position x,y of the 2-D array (list of lists).
* The elements of the array need not be uniform (any mix of strings, numbers, structures is allowed).
* The dimensions of the array need not be uniform (row 1 might have 3 columns while row 2 has 5 columns).

Example:

    SET FOO TO LIST().         // Empty list.
    SET FOO:ADD TO LIST().     // Element 0 is now itself a list.
    SET FOO[0]:ADD TO "A".     // Element 0,0 is now "A".
    SET FOO[0]:ADD TO "B".     // Element 0,1 is now "B".
    SET FOO:ADD TO LIST().     // Element 1 is now itself a list.
    SET FOO[1]:ADD TO 10.      // Element 1,0 is now 10.
    SET FOO[1]:ADD TO 20.      // Element 1,1 is now 20.
    SET FOO:ADD TO LIST().     // Element 2 is now itself a list.
    SET FOO[ FOO:LENGTH -1 ]:ADD TO 3.14159.
                               // Element 2,0 is now 3.1519, using a more complex
                               //     expression to dynamically obtain the current
                               //     maximum index of '2'.
    SET FOO[ FOO:LENGTH -1 ]:ADD TO 7.
                               // Element 2,1 is now 7, using a more complex
                               //     expression to dynamically obtain the current
                               //     maximum index of '2'.
    // FOO is now a 2x3 matrix looking like this:
        A         B
        10        20
        3.14159   7
    // or like this, depending on how you want to visualize it:
        A    10     3.14159
        B    20     7
    PRINT FOO[2][1].           // Prints 7.
    PRINT FOO#2#0.             // Prints 3.14159

Some Resources return LIST type
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
