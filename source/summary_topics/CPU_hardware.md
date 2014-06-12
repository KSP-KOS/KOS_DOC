# The kOS CPU hardware

### The execution of the kOS CPU hardware

While it's possible to write some software without knowing anything about the
underlying computer hardware, and there are good design principles that state
one should never make assumptions about the computer hardware when writing
software, there are still some basic things about how computers work in
general that a good programmer needs to be aware of to write good code.  Along
those lines, the KSP player writing a Kerboscript program needs to know a
few basic things about how the simulated kOS CPU operates in order to be able
to write more advanced scripts.  This page contains that type of information.

### Physics Ticks and Frozen Intervals

Kerbal Space Program simulates the universe by running the universe in small
incremental time intervals that for the purpose of this document, we will call
"**physics ticks**".  The exact length of time for a physics tick varies as the
program runs.  One physics tick might take 0.09 seconds while the next one
might take 0.085 seconds.  (The default setting for max allowed time for a
physics tick is 1/10th of a second, just to give a ballpark figure.)

The entire simulated universe is utterly frozen during the duration of a physics
tick.  For example, if one physics tick occurs at timestamp 10.51 seconds, and
the next physics tick occurs 0.08 seconds later at timestamp 10.59 seconds, then 
during the entire intervening time, at timestamp 10.52 seconds, 10.53 seconds,
and so on, nothing moves.  The clock is frozen at 10.51 seconds, and the fuel
isn't being consumed, and the vessel is at the same position.  On the next
physics tick at 10.59 seconds, then all the numbers are updated.

The full details of the physics ticks system are more complex than that, but
that quick description is enough to describe what you need to know about how
kOS's CPU works.

### What does a kOS CPU do each **physics tick**?

On each physics tick, each kOS CPU that's within physics range (i.e. 2.5 km),
wakes up and performs the following steps, in this order:

* Run the conditional checks of all TRIGGERS (see below)
* For any TRIGGERS who's conditional checks are true, execute the entire body of the trigger.
* If there's a pending WAIT statement, check if it's done.  If so wake up.
* If awake, then execute the next [CONFIG:IPU](../../structure/config/index.html#IPU) number of instructions of the main program.

Note that the number of instructions being executed (CONFIG:IPU) are NOT lines of code
or kerboscript statements, but rather the smaller instruction opcodes that they are
compiled into behind the scenes.  A single kerboscript statement might become anywhere
from one to ten or so instructions when compiled.

<a name="TRIGGERS"></a>

### TRIGGERS

There are multiple things within kerboscript that run "in the background"
always updating, while the main script continues on.  The way these work
is a bit like a real computer's multithreading, but not *quite*.  Collectively
all of these things are called "triggers".

Triggers are all of the following:

* LOCKS which are attached to flight controls (THROTTLE, STEERING, etc), but not other LOCKS.
* ON condition { some commands }.
* WHEN condition THEN { some commands }.

The way these work is that once per **physics tick**, all the LOCK expressions which
directly affect flight control are re-executed, and then each conditional trigger's
condition is checked, and if true, then the entire body of the trigger is executed 
all the way to the bottom *before any more instrucions of the main body are
executed*.  This means that execution of a trigger never gets interleaved
with the main code.  Once a trigger happens, the entire trigger occurs all
in one go before the rest of the main body continues.

<b>DO NOT LOOP A LONG TIME IN A TRIGGER BODY!!</b>

Because the entire body of a trigger will execute all the way to the bottom
on *every* **physics tick**, *before* any other code continues, it is vital that
you not write code in a trigger body that takes a long time to execute.
The body of a trigger must be kept quick.  An infinite loop in a trigger
body could literally freeze all of KSP, because the kOS mod will never 
finish executing its update.

If you want a trigger body that is meant to loop, the only acceptable way
to do it is to design it to execute just once, but then use the PRESERVE
keyword to keep the trigger around for the next update.  Thus your trigger
becomes a sort of "loop" that executes one iteration per **physics tick**.

It is also important to consider the way triggers execute for performance
reasons too.  Every time you write an expression for a trigger, you are
creating a bit of code that gets executed fully to the end before your main
body will continue, once each **physics tick**.  A complex expression in a
trigger condition, which in turn calls other complex LOCK expressions, which
call other complex LOCK expressions, and so on, may cause kOS to bog itself
down during each update.

Because of how triggers work, you cannot put a WAIT statement inside a trigger.
If you try, it will have no effect.

<a name="WAIT"></a>

### WAIT

Any WAIT statement causes the kerboscript program to immediately stop executing
the main program where it is, even if far fewer than [CONFIG:IPU](../../structure/config/index.html#IPU)
instructions have been executed in this **physics tick**.  It will not continue the execution
until at least the next **physics tick**, when it will check to see if the WAIT
condition is satisfied and it's time to wake up and continue.

Therefore ANY WAIT of any kind will guarantee that your program will allow at least
one **physics tick** to have happened before continuing.  If you attempt to:

    WAIT 0.001.

But the duration of the next physics tick is actually 0.09 seconds, then you will
actually end up waiting at least 0.09 seconds.  It is impossible to wait a unit
of time smaller than one physics tick.

Using a very small unit of time in a WAIT statement is an effective way to force
the CPU to allow a physics tick to occur before continuing to the next line of code.

Similarly, if you just say:

    WAIT UNTIL TRUE.

Then even though the condition is immediately true, it will still wait one physics
tick to discover this fact and continue.


<a name="FROZEN"></a>

### THE FROZEN UNIVERSE

Each physics tick, the kOS mod wakes up and runs through all the currently loaded
CPU parts that are in "physics range" (i.e. 2.5 km), and executes a batch of
instructions from your script code that's on them.  It is important to note
that during the running of this batch of instructions, because it all occurs
on the same **physics tick**, none of the values that you might query from
the KSP system will change.  The clock time returned from the TIME variable
will keep the same value throughout.  The amount of fuel left will remain fixed
throughout.  The position and velocity of the vessel will remaing fixed throughout.
It's not until the next physics tick occurs that those values will change to new
numbers.  It's typical that several lines of your kerboscript code will run
during a single frozen physics tick.

This is a vital difference between how a kOS CPU behaves versus how a real
world computer behaves.  In a real world computer, you would know for
certain that time will pass, even if it's just a tiny amount of time,
between the execution of one statement and the next.

So why does this matter?
------------------------

The reason this matters is because of code that tries to do things like this:

    // Imagine something like this inside a script
    // designed to hover in place:
    //
    PRINT "Waiting until altitude is holding stable within 0.1 meters.".

    SET PREV_ALT TO -99999. // bogus start value
    UNTIL ABS( PREV_ALT - SHIP:ALTITUDE ) < 0.1 { 

      SET PREV_ALT TO SHIP:ALTITUDE.

      //
      // Assume there's fancy PID controller commands here, omitted for this example.
      //
    }.

This bit of code, if you assume you've written a nice bit of code where the comment is,
looks like it would make sense at first.  It looks like it should work. It records the
previous altitude at the start of the loop body, and if the altitude hasn't changed by
much by the start of the next loop, it assumes the altitude has become stable and it stops.

BUT, due to the frozen nature of the measurements during a **physics tick**, it's entirely
possible, and quite likely, that the loop would exit prematurely because no simulation time
has passed between the two altitude measurements.  The previous altitude and the current
altitude are the same.  Not because the vessel has no vertical motion, but because the
loop is executing fast enough to finish more than one iteration within the same **physics tick**.
The two altitude measurements are the same because no time has passed in the simulated universe.

### THE FIX To the frozen Universe Problem: WAIT 0.001

If you are exeucuting a loop like the one above in which it is absolutely vital that
the next iteration of the loop must occur in a *different* **physics tick** than
the previous one, so that it can take *new* measurements that are different, the 
solution is simply to put in a very tiny WAIT statement in the body of the loop, like so:

    // Imagine something like this inside a script
    // designed to hover in place:
    //
    PRINT "Waiting until altitude is holding stable within 0.1 meters.".

    SET PREV_ALT TO -99999. // bogus start value
    UNTIL ABS( PREV_ALT - SHIP:ALTITUDE ) < 0.1 { 

      SET PREV_ALT TO SHIP:ALTITUDE.

      //
      // Assume there's fancy PID controller commands here, omitted for this example.
      //

      WAIT 0.001. // delay until next physics tick.
    }.

ALL WAITs, no matter how small, cause the CPU to go to sleep until the next physics tick, as
described above on this page.


