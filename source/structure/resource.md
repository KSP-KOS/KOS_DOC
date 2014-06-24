### A single resource value a thing holds (i.e. fuel, electric charge, etc)

This is the type returned as the elements of the list in LIST RESOURCES IN MyList.

#### Getters:

* NAME - string - the name of the resource, i.e. "LIQUIDFUEL", "ELECTRICCHARGE", "MONOPROP".
* AMOUNT - Number - the value of how much resource is left.
* CAPACITY - Number - What AMOUNT would be if the resource was filled to the top.


Example:

    PRINT "THESE ARE ALL THE RESOURCES ON THE SHIP:".
    LIST RESOURCES IN RESLIST.
    FOR RES IN RESLIST {
      PRINT "Resource " + RES:NAME + ": value = " + AMOUNT +
            " which is " + ROUND(100*RES:AMOUNT/RES:CAPACITY) + "% full.".
    }.
