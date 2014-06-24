kOS Mod Overview
================

kOS is a scriptable autopilot Mod for Kerbal Space Program. It allows you write small programs that automate specific tasks.

Installation
------------

Like other mods, simply merge the contents of the zip file into your Kerbal Space Program folder.


KerboScript
===========

KerboScript is a programming language that is derived from the language of planet Kerbin, which _sounds_ like gibberish to non-native speakers but for some reason is _written_ exactly like English. As a result, KerboScript is very English-like in its syntax. For example, it uses periods as statement terminators.

The language is designed to be easily accessible to novice programmers, therefore it is case-insensitive, and types are cast automatically whenever possible.

A typical command in KerboScript might look like this:

    PRINT “Hello World”.


QUICK START: Hello World.
=========================

For the first introduction to how the mod works without taking the time to read all the instructions first, try the steps below.  (Please do come back to read the rest of the instructions after that, though.)

* ![image of SCS part](images/scs_part) Add the Compotronix SCS part to your vessel; it’s under the “Control” category in the Vehicle Assembly Building or Space Plane Hanger.  It looks like the picture here.

* Create a directory under your KSP base directory located here: KSP_BASE/Plugins/PluginData/Archive/, Where KSP_BASE is wherever you've installed Kerbal Space Program.

* Create a text file called "test.txt" in that directory, using whatever text editor you like, and make it have the following contents:

### "test.txt"

    CLEARSCREEN.
    PRINT "THROTTLING TO MAX.".
    LOCK THROTTLE TO 1.
    WAIT 2.
    PRINT "HITTING FIRST STAGE.".
    STAGE.
    WAIT UNTIL ALTITUDE > 2000.
    PRINT "TURNING OFF AUTOPILOT.  BACK TO MANUAL CONTROL.".

* Put your rocket on the launchpad, and right-click the Comptronix SCS part you added in step 1 above.  From the popup menu, select "Open Terminal".

* Make sure your staging list for your rocket is designed so that when you hit the first stage, you both unlock the tower clamps and activate the first stage engine in the same instant.  (The simple example program you typed in above assumes this is the case).

* Type the following commands into the terminal, hitting enter after each line.

###

    SWITCH TO 0.
    RUN TEST.

You should see your rocket throttle up to max and then activate stage 1, then revert to manual control after an altitude of 2000m.  Not a very useful autopilot yet, but it demonstrates that the mod is working and shows you a small piece of how it works.



CASE INSENSITIVE
----------------
Everything in Kerboscript is case-insensitive, including your own variable names and filenames.
The only exception is when you perform a string comparison, ("Hello"="HELLO" will return false.)

Most of the examples here will show the syntax in all-uppercase to help make it stand out from
the explanatory text.


Expressions
-----------

KerboScript uses an expression evaluation system that allows you to perform math operations on variables. Some variables are defined by you. Others are defined by the system.

There are three basic types:

### Numbers

You can use mathematical operations on numbers, like this:

    SET X TO 4 + 2.5.
    PRINT X.             // Outputs 6.5

The system follows the order of operations, but currently the implementation is imperfect. For example, multiplication will always be performed before division, regardless of the order they come in. This will be fixed in a future release.

### Strings

Strings are pieces of text that are generally meant to be printed to the screen. For example:

    PRINT “Hello World!”.

To concatenate strings, you can use the + operator. This works with mixtures of numbers and strings as well.

    PRINT “4 plus 3 is: “ + (4+3).

### Structures

Structures are variables that contain more than one piece of information.  For example, a Vector has an X, a Y, and a Z component.  Structures can be used with SET.. TO just like any other variable.  To access the sub-elements of a structure, you use the colon operator (":").  Here are some examples:

    PRINT "The Mun's periapsis altitude is: " + MUN:PERIAPSIS.
    PRINT "The ship's surface velocity is: " + SHIP:VELOCITY:SURFACE.

Many structures also let you set a specific component of them, for example:

    SET VEC TO V(10,10,10).  // A vector with x,y,z components all set to 10.
    SET VEC:X to VEC:X * 4.  // multiply just the X part of VEC by 4.
    PRINT VEC.  // Results in V(40,10,10).

A full list of structure types is listed further down this page.


Command Reference
=================

This is not a complete list.  The examples here are just to give a taste of what exists.  For the full list of commands please click on each of the section headings.

* [Full list of reserved variable names](bindings/index.html)
    
* [Math](command/math/index.html)
    * Basic Functions
    * Trigonometric Functions

* [Flight](command/flight/index.html)
    * LOCK STEERING
    * LOCK THROTTLE
    * ADD
    * REMOVE
    * STAGE
    * HEADING
    * WARP

* [Prediction](command/prediction/index.html)
    * POSITIONAT
    * VELOCITYAT
    * ORBITAT

* [File IO](command/file/index.html)
    * COPY
    * DELETE
    * EDIT
    * LOG.. TO
    * RENAME
    * REMOVE
    * RUN
    * SWITCH.. TO

* [Flow Control](command/flowControl/index.html)
    * BREAK
    * IF
    * LOCK
    * ON
    * UNLOCK
    * UNTIL
    * WAIT
    * WHEN.. THEN

* [Terminal](command/terminal/index.html)
    * CLEARSCREEN
    * PRINT
    * PRINT.. AT
    * REBOOT
    * SHUTDOWN

Structure Reference
===================

Structures are variables that can contain more than one piece of information.  Structures can be used with SET.. TO just like any other variable.
Their subelements can be accessed by using : along with the name of the subelement.

* [Atmosphere](structure/atmosphere/index.html)
* [Body](structure/body/index.html)
* [Direction](structure/direction/index.html)
* [DockingPort](structure/dockingport/index.html)
* [Engine](structure/engine/index.html)
* [GeoCordinates](structure/geocordinates/index.html)
* [List](structure/list/index.html)
* [Node](structure/node/index.html)
* [Orbit](structure/orbit/index.html)
* [Orbitable](structure/orbitable/index.html)
* [OrbitableVelocity](structure/orbitablevelocity/index.html)
* [Part](structure/part/index.html)
* [Resource](structure/resource/index.html)
* [Sensor](structure/sensor/index.html)
* [Time](structure/time/index.html)
* [Vecdraw](structure/vecdraw/index.html)
* [Vector](structure/vector/index.html)
* [Vessel](structure/vessel/index.html)

Summary Topics
==============

Useful topics and reference information:

* [Volumes](summary_topics/volumes/index.html)
* [CommRange](summary_topics/commrange/index.html)
* [Ship Steering](summary_topics/ship_control/index.html)

BUILT-IN SPECIAL VARIABLE NAMES
===============================

Some variable names have special meaning and will not work as identifiers.
Understanding this list is crucial to using kOS effectively, as these special variables are the usual way to query flight state information.


[The full list of reserved variable names is on its own page](bindings/index.html)

