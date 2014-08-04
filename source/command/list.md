List Command
============

A [List is a type of Structure](../../structure/list/index.html) that stores a list of variables in it.

The LIST command either prints or crates a [List variable](../../structure/list/index.html) containing items queried from the game.


***

## FOR Loop

Lists need to be iterated over sometimes, to help with this we have
the [FOR loop, explained on the flow control page](../../command/flowControl/index.html#for).

***

### LIST Command

The LIST Command comes in 4 forms:


* (1) **LIST**
  * When no parameters are given, the LIST command is exactly equivalent to the command LIST FILES.  (**List** *ListKeyword* where *ListKeyword* is FILES.)
* (2) **LIST** *ListKeyword*.
  * This variant prints items to the termianl sceen.  Depending on the *ListKeyword* used (see below), different values are printed.
* (3) **LIST** *ListKeyword* **IN** *YourVariable*.
  * This variant takes the items that would otherwise have been printed to the terminal screen, and instead makes a [LIST](../../structure/list/index.html) of them in *YourVariable*, that you can then iterate over with a FOR loop if you like.
* (4) **LIST** *ListKeyword* **FROM** *SomeVessel* **IN** *YourVariable*.
  * This variant is just like variant (3), except that it gives a list of the items that exist on some other vessel that might not necessarily be the current CPU_vessel.

Examples of each of these variants can be seen at the bottom of the page.

### What keywords are listable?

The *ListKeyword* in the above command variants can be any of the following:

#### Universal Lists

These generate lists that are not dependant on which vessel:

* *Bodies* - List of [Bodies](../../structure/body/index.html)
* *Targets* - List of possible target [Vessels](../../structure/vessel/index.html)

#### Vessel Lists

These generate lists of items on the vessel:

* *Resources* - List of [Resources](../../structure/resource/index.html)
* *Parts* - List of [Parts](../../structure/part/index.html)
* *Engines* - List of [Engines](../../structure/engine/index.html)
* *Sensors* - List of [Sensors](../../structure/sensor/index.html)
* *Elements* - ??
* *DockingPorts* - list of [DockingPorts](../../structure/dockingport/index.html)

#### File System Lists

These generate lists about the files in the system:

* *Files* - List the files on the current Volume. (note below)
* *Volumes* - List all the Volumes that exist.

Note: LIST FILES is the default if you give the LIST command no parameters.


Examples:

    LIST.  // Prints the list of files on current volume.
    LIST FILES.  // Does the same exact thing, but more explicitly.

    LIST BODIES. // Prints the list of all Celestail bodies in the system.

    LIST BODIES IN bodList.  // Puts the list of bodies into a variable.
    // Iterate over everything in the list:
    SET totMass to 0.
    FOR bod in bodList {
        SET totMass to totMass + bod:MASS.
    }.
    PRINT "The mass of the whole solar system is " + totMass.

    LIST RESOURCES FROM TARGET IN foo. //Adds variable FOO that contains a list of RESOURCES for my currently target vessel
    FOR res IN foo {
        PRINT res:NAME. //Will print the name of every [Resource](../../structure/resource/index.html) in the vessel.
    }.



