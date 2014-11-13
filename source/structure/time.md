Timespan
========

In several places the game uses a Timespan format.  This is a strucure that gives the time in various formats.
It also allows you to peform arithmetic on the time.

TimeSpan represents *SIMULATED* time
------------------------------------

When you are examining a TimeSpan you are looking the "in character" **simulated** time, not
the "out of character" real world time.  This is very important distinction to remember, as
the following points illustrate:

* A TimeSpan does not count the time that was passing while the game was paused.
* If you turn off your computer and don't play the game for several days, the TimeSpan does not count this time.
* If your game lags and stutters such that the simulation is taking 2 seconds of real time to calculate 1 second of game time, then the number of seconds that have passed according to a TimeSpan will be fewer than the number of seconds that have passed in the real world.

This allows you to use a TimeSpan such as is returned by the TIME special variable to make correct physics calculations.

### Special variable TIME

The special variable **TIME** is used to get the current time.

Any time you perform arithmetic on **TIME** you get a result back that is also
a Timespan.  In other words, TIME is a Timespan, but TIME + 100 is also a Timespan.

### Using TIME to detect when the physics have been updated 'one tick'

kOS programs run however fast your computer's animation rate will allow, which
can flow and change from one moment to the next depending on load.  However,
the physics of the universe get updated at a fixed rate according to your
game settings (the default, as of KSP 0.25, is 25 physics updates per second)

You can use the TIME special variable to detect whether or not a real physics 'tic'
has occurred yet, which can be important for scripts that need to take measurements
from the simulated universe.  If no physics tic has occurred, then TIME will still
be exactly the same value.

**Warning #1**: Please be aware that the kind of calendar Timespan's use will depend on your KSP settings.
The main KSP game supports both Kerbin time and Earth time and changing that setting will
affect how Timespan works in kOS.

(The difference is whether 1 day = 6 hours or 1 day = 24 hours).

**Warning #2**: Beware the pitfall of confuising the *:SECOND* (singular)
suffix with the *:SECONDS* (plural) suffix.

**Warning #3**: Beware that the times returned from [FileInfo](../fileinfo/index.html) for the
time a file was modified or created are NOT in this Timespan structure but instead are just raw
strings.  That is because they represent the time the file was affected in the real world
and NOT times taken from the KSP simulation clock.  That is a necessity because your files in
the Archive exist globally across all multiple saved games.  Different saved games won't have 
synchronized calendars with each other.

  * *:SECOND* is the number of
**remainder** seconds leftover after all whole-number minutes, hours, days, and years have been subtracted out, and it's never outside the range [0..60).  It's essentially the 'seconds hand' on a clock.
  * *:SECONDS* is the number of seconds total if you want to represent time as just a simple flat number without all the components.  It's the total count of the number of seconds since the beginning of time (Epoch).  Because it's a floating point number, it can store times less than 1 second.  Note this is a measure of how much simulated Kerbal time has passed since the game began.  People experienced at programming will be familiar with this concept.  It's the Kerbal's version of "unix time".

The epoch (time zero) in the KSP game is the time at which you first started the new campaign.  All campaign games begin with the planets in precisely the same position and the clock set to zero years, zero days, zero hours, and so on.

### Structure

Suffix      | Type      | Get | Set | Description
------------|-----------|-----|-----|--------------------------------------
:CLOCK      | string    | yes | no  | Time in (HH:MM:SS) format.
:CALENDAR   | string    | yes | no  | Day in "Year YYYY, day DDD" format.  (Kerbals don't have 'months'.)
:SECOND     | Number (0-59)  | yes | no  | Second-hand number.
:MINUTE     | Number (0-59)  | yes | no  | Minute-hand number
:HOUR       | Number (0-23)  | yes | no  | Hour-hand number
:DAY        | Number (1-365) | yes | no  | Day-hand number
:YEAR       | Number    | yes | no  | Year-hand number
:SECONDS    | Number    | yes | no  | (Total Seconds since Epoch)


    TIME                // Gets the current universal time
    TIME:CLOCK          // Universal time in H:M:S format(1:50:26)
    TIME:CALENDAR       // Year 1, day 134
    TIME:YEAR           // 1
    TIME:DAY            // 134
    TIME:HOUR           // 1
    TIME:MINUTE         // 50
    TIME:SECOND         // 26
    TIME:SECONDS        // Total Seconds since campaign began

