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

----

QUICK START: Hello World.
=========================

If you prefer the tutorial style of explanation, please see the
[QUICK START Tutorial](summary_topics/gettingstarted/index.html), which walks you through the 
beginnings of making a beginner's ship launcher script.

----


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
    * STAGE
    * HEADING
    * WARP

* [Prediction](command/prediction/index.html)
    * POSITIONAT
    * VELOCITYAT
    * ORBITAT
    * ADD (manuever node)
    * REMOVE (maneuver node)

* [File IO](command/file/index.html)
    * COPY
    * DELETE
    * EDIT
    * LOG.. TO
    * RENAME
    * REMOVE
    * RUN
    * SWITCH.. TO

* [Listing Data](command/list/index.html)
    * LIST PARTS IN VAR
    * LIST FILES
    * LIST PARTS FROM VESSEL IN VAR
    * LIST ENGINES
    * etc

* [Flow Control](command/flowControl/index.html)
    * BREAK
    * IF
    * FOR
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

Structures are variable *types* that contain more than one piece of information.
All structures contain sub-values that can be accessed with a colon (':') operator.
Multiple structures can be chained together with more than one colon (':') operator.

    SET myCraft TO SHIP.
    SET myMass TO myCraft:MASS.
    SET myVel TO myCraft:VELOCITY:ORBIT.

These terms are referred to as "suffixes".  For example "*Velocity* is a suffix of *Vessel*".

It is possible to set some suffixes as well, for example:

    SET n TO Node( TIME:SECONDS + 60, 0, 10, 10).
    SET n:ETA to 500. // set it farther into the future than originally planned.

The full list of available suffixes for each type is in the following list:

* [Atmosphere](structure/atmosphere/index.html) - info about the atmosphere of a planet or moon
* [Color](structure/rgba/index.html) - info about a color as used in user interface elements
* [Config](structure/config/index.html) - info about configurable options from the mod's config file
* [Control](structure/control/index.html) - a vessel's raw flight controls
* [Direction](structure/direction/index.html) - a tuple of values describing a ray in space preserving camera-up info
* [GeoCordinates](structure/geocordinates/index.html) - a set of values describing a location on a Body's surface
* [List](structure/list/index.html) - a generic collection of any types of values, that you can iterate through
* [Node](structure/node/index.html) - a maneuver node
* [Orbit](structure/orbit/index.html) - describing the shape of an orbit ellipse
* [Orbitable](structure/orbitable/index.html) - any thing that can move around another thing (ship or moon or planet)
  * [Body](structure/body/index.html) - a specific type of Orbitable: info about a planet or moon
  * [Vessel](structure/vessel/index.html) - a specific type of Orbitable: info about a vessel
* [OrbitableVelocity](structure/orbitablevelocity/index.html) - a pair of velocities representing the orbital and surface elocity of an Orbitable thing
* [Part](structure/part/index.html) - one of the pieces assembled together that a vessel is made from
  * [DockingPort](structure/dockingport/index.html) - a specific type of Part
  * [Engine](structure/engine/index.html) - a specific type of Part
  * [Sensor](structure/sensor/index.html) - a specific type of Part
* [Resource](structure/resource/index.html) - one of the named quantities that a Part can hold, i.e. fuel, battery charge
* [Time](structure/time/index.html) - a single moment in time, with multiple ways to represent it
* [Vecdraw](structure/vecdraw/index.html) - a drawing of an arrow onscreen that corresponds to a vector in space
* [Vector](structure/vector/index.html) - a tuple of x,y,z values representing a piece of spatial data.

Summary Topics
==============

Useful topics and reference information:

* [Getting Started](summary_topics/gettingstarted/index.html)
* [Volumes](summary_topics/volumes/index.html)
* [CommRange](summary_topics/commrange/index.html)
* [Ship Steering](summary_topics/ship_control/index.html)
* [CPU vessel](summary_topics/CPU_vessel/index.html)

BUILT-IN SPECIAL VARIABLE NAMES
===============================

Some variable names have special meaning and will not work as identifiers.
Understanding this list is crucial to using kOS effectively, as these special variables are the usual way to query flight state information.


[The full list of reserved variable names is on its own page](bindings/index.html)

