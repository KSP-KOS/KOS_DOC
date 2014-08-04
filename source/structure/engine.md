Engine
======

Some of the Parts returned by [LIST PARTS](../../command/list/index.html#vessel-lists) will be of type Engine.

It is also possible to get jsut the Engine parts by executing LIST ENGINES, for example:

    LIST ENGINES IN myVariable.
    FOR eng IN myVariable {
        print "An engine exists with ISP = " + eng:ISP.
    }.

### Structure

Suffix      | Type      | Get | Set | Description
------------|-----------|-----|-----|--------------------------------------
All the suffixes of [Part](../part/index.html) plus... | varies | .. | .. | Engine is a type of Part, and therefore can use all the suffixes of Part.  Shown below are only the suffixes that are unique to Engine variables:
:MAXTHRUST  | Number (kilonewtons)  | yes | no | How much thrust would this engine give if the throttle was max and conditions were ideal.
:THRUST     | Number (kilonewtons)  | yes | no | How much thrust is this engine giving at this very moment.
:FUELFLOW   | Number (Liters/s? maybe) | yes | no | Rate at which fuel is being burned.  Not sure what the units are.
:ISP        | Number  | yes | no | Specific impulse [Wiki](http://en.wikipedia.org/wiki/Specific_impulse)
:FLAMEOUT   | boolean | yes | no | Is this engine failed because it is starved of a resource (liquidfuel, oxidizer, oxygen)?
:IGNITION   | boolean | yes | no | Has this engine been ignited?  If both :IGNITION and :FLAMEOUT are true, that means the engine could start up again immediately if more resources were made available to it.
:ALLOWRESTART | boolean | yes | no | Is this an engine that can be started again?  Usually True, but false for solid boosters.
:ALLOWSHUTDOWN| boolean | yes | no | Is this an engine that can be shut off once started?  Usually True, but false for solid boosters.
:THROTTLELOCK| boolean | yes | no | Is this an engine that is stuck at a fixed throttle?  (i.e. solid boosters)
:THRUSTLIMIT | Number | yes | no | If this an engine with a thrust limiter (tweakable) enabled, what percentage is it limited to?

