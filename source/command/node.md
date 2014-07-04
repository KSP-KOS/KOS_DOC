Manuever node manipulation
==========================

You can make a manuever node in a variable using the NODE() function, as
[described on the Node page](../../structure/node/index.html).  Once you
have a manuever node in a variable, you use the ADD and REMOVE commands
to attach it to your vessel's flight plan.

A kOS CPU can only manipulate the flight plan of its [CPU_vessel](../../summary_topics/CPU_vessel/index.html).

A kOS CPU cannot adjust the flight plan of a different vessel.

### ADD

To put a maneuver node into the flight plan of the current CPU_vessel (i.e. **SHIP**), just ADD it like so:

    SET myNode to NODE( TIME:SECONDS+200, 0, 50, 10 ).
    ADD myNode.

You should immediately see it appear on the map view when you do this.
The ADD command can add nodes anywhere within the flight plan.  To insert a node earlier in the
flight than an existing node, simply give it a smaller ETA time and then Add it.

### REMOVE

To remove a manuever node from the flight path of the current CPU_vessel (i.e. **SHIP**), just REMOVE it like so:

    REMOVE myNode.

### NEXTNODE.

The special identifier **NEXTNODE** is a euphamism for "whichever node is coming up soonest on my flight path".

Therefore you can remove a node even if you no longer have the manuever node variable around, by doing this:

    REMOVE NEXTNODE.

