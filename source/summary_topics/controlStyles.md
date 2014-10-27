## Intermediate kOS Tutorial

There are many ways one can write a control program for any given scenario. The goal of this section is bring a novice kOS programmer from the end of the [QUICK START Tutorial](summary_topics/gettingstarted/index.html) up to writing and tuning their very own PID controller. It is my hope that the reader will develop a sense of elegance and capability when writing his or her own kOS programs.

### The Major Styles of Control Programs

The style of a program is usually determined by the flow-control statements used. I.e., the WHEN/THEN, ON, WAIT, UNTIL, IF and FOR constructs. I will label the major styles of control programs that can be written in kOS as:

1. Sequential
2. Loops with Condition Checking
3. Loops with Triggers

Of course, one style does not fit all scenarios and I'd advised the programmer to use a combination of these.

__1. Sequential Programs__

These are programs that rely almost exclusively on WAIT UNTIL statements to go from one phase to the next.

    LOCK STEERING TO UP.
    LOCK THROTTLE TO 1.
    STAGE.
    WAIT UNTIL SHIP:ALTITUDE > 10000.
    LOCK STEERING TO HEADING(90,45).
    WAIT UNTIL STAGE:LIQUIDFUEL < 0.1.
    STAGE.
    WAIT UNTIL SHIP:ALTITUDE > 20000.
    LOCK THROTTLE TO 0.

This example will take a two stage rocket up to 20km. The immediate thing to notice here is that I must have known that the first stage would cutoff between 10km and 20km. This is fine for this specific rocket but not too general and end in disaster if the first stage cutoff at say 5km. Certainly, one can write a program using this technique to take a specific rocket, put it into orbit and even perform a lot of fancy maneuvers, but adapting the code to different rockets gets complicated quickly.

__2. Loops with Condition Checking__

This is a far more common pattern with kOS and for good reason. Here, we introduce IF/ELSE logic into UNTIL blocks or FOR loops:

    LOCK STEERING TO UP.
    LOCK THROTTLE TO 1.
    STAGE.
    UNTIL SHIP ALTITUDE > 20000 {
        IF SHIP:ALTITUDE > 10000 {
            LOCK STEERING TO HEADING(90,45).
        }
        IF STAGE:LIQUIDFUEL < 0.1 {
            STAGE.
        }
    }
    LOCK THROTTLE TO 0.

This does the same thing as the previous example, but now it is checking for the staging condition from the launch pad all the way to 20km. More than that, it will stage as many times as needed.

One can imagine that these types of UNTIL loops can become very complex with many layers of IF/ELSE blocks. Once this happens it is usually good to reduce the frequency of the loop by adding a WAIT statement at the end of the loop. This wait could be anywhere from 0.001 (every physics tick), to 3600 (every hour) or even longer for inter-planetary transfers if desired.

__3. Loops with Triggers__

In the above example, once the rocket reaches 10km, the steering is constantly being re-locked to HEADING(90,45). This works, but we only need to lock it once. The solution is to set up a trigger using a WHEN/THEN block:

    LOCK STEERING TO UP.
    LOCK THROTTLE TO 1.
    STAGE.
    WHEN SHIP:ALTITUDE > 10000 THEN {
        LOCK STEERING TO HEADING(90,45).
    }
    UNTIL SHIP ALTITUDE > 20000 {
        IF STAGE:LIQUIDFUEL < 0.1 {
            STAGE.
        }
    }
    LOCK THROTTLE TO 0.

Now, when the rocket reaches 10km, the steering is set once and the trigger is removed from the active list of triggers. We could also promote the staging condition to a trigger using WHEN/THEN, keeping the trigger after every stage using the PRESERVE keyword:

    LOCK STEERING TO UP.
    LOCK THROTTLE TO 1.
    STAGE.
    WHEN SHIP:ALTITUDE > 10000 THEN {
        LOCK STEERING TO HEADING(90,45).
    }
    WHEN STAGE:LIQUIDFUEL < 0.1 THEN {
        STAGE.
        PRESERVE.
    }
    WAIT UNTIL SHIP ALTITUDE > 20000.
    LOCK THROTTLE TO 0.

In this case, we chose to convert the UNTIL loop a WAIT UNTIL statement since the program is small and we are confident that all the logic of the triggers can be handled in a reasonable amount of time - there will be more on this topic later.

__Bringing It All Together__

Typically, you will find that all of these constructs are useful at the same time and your code will naturally contain some sequential parts in combination with long-term and short-term triggers which can modify states in complex loops of varying frequency. If you didn't follow that bit of gobbledygook, don't worry. In the next sections I will talk about a few guidelines I can recommend when setting up any program.

### General Guidelines for kOS Scripts

Here we will discuss two general guidelines to follow when writing your first kOS scripts. These are not meant to be absolute and there will certainly be cases when you need to break one or both of them. Mostly, these are to help beginners develop a sense of how to start coding an auto-pilot for a specific maneuver.

__1. Minimize Time Spent in WHEN/THEN Blocks__

Remember that WAIT statements are ignored when inside WHEN/THEN blocks. It is OK to loop over small lists (engines for example), but don't let it get out of hand. The WHEN/THEN construct was designed to accommodate quick bits of code. Consider this bit of (non-working) code which tries to adjust the throttle based on the ship's acceleration (be sure to equip the vessel with an accelerometer!):

    SET acc_setpoint TO 2.
    WHEN SHIP:ALTITIUDE > 10000 THEN {
        UNTIL SHIP:ALTITIUDE > 20000 {
            SET acc TO SHIP:SENSORS:ACC:MAG.
            SET thrott TO 0.05 * (acc_setpoint - acc).
            LOCK THROTTLE to thrott.
        }
    }

Admittedly, this is a contrived example, plus it won't work. Everything in a WHEN/THEN block must complete in the current physics tick, but we have a loop until the ship reaches 20km. We can rework this by doing the following:

    SET thrott TO 1.
    SET dthrott TO 0.
    LOCK THROTTLE to thrott.
    WHEN SHIP:ALTITIUDE > 10000 THEN {
        SET acc_setpoint TO 2.
        LOCK acc TO SHIP:SENSORS:ACC:MAG.
        LOCK dthrott TO 0.05 * (acc_setpoint - acc).
    }
    UNTIL SHIP:ALTITIUDE > 20000 {
        SET thrott TO thrott + dthrott.
        WAIT 0.001.
    }

This code *could* be streamlined further, but now it should more-or-less work. What we have done is set up a proportional feedback loop, from 10km to 20km, to keep the acceleration of the ship at 2 by adjusting the throttle. The real take-away from this example is to keep WHEN/THEN blocks separate from UNTIL loops. Specifically, never put an UNTIL loop inside a WHEN/THEN block and it should be extremely rare to put a WHEN/THEN statement inside an UNTIL loop.

__2. Minimize Trigger Conditions__

When I first started writing kOS scripts, I tried to make full use of WHEN/THEN triggers with mult-level LOCK variables. There is a lot of power in this, but I found it was very easy to hit kOS's hard limit in the number of operations allowed for trigger checking. For example, many times, I had two or more WHEN statements that were dependent on the same LOCK variable. This caused the LOCK variable to be calculated multiple times in a single update. If the LOCK was deep enough, the calculation would become too expensive to do twice and kOS would stop and complain.

With that in mind, let's expand on the example above. This time we'll add some code to get us off the ground and up to 30km. We want full throttle initially, but after a couple km, we should throttle back so we don't keep our poor Kerbals locked at maximum acceleration!

    SAS ON.
    SET thrott TO 1.
    LOCK THROTTLE to thrott.
    STAGE.
    WAIT UNTIL SHIP:ALTITIUDE > 2000.
    SET acc_setpoint TO 4.
    LOCK acc TO SHIP:SENSORS:ACC:MAG.
    LOCK dthrott TO 0.05 * (acc_setpoint - acc).
    WHEN SHIP:ALTITIUDE > 10000 THEN {
        SET acc_setpoint TO 3.
    }
    WHEN SHIP:ALTITIUDE > 20000 THEN {
        SET acc_setpoint TO 2.
    }
    UNTIL SHIP:ALTITIUDE > 30000 {
        SET thrott TO thrott + dthrott.
        WAIT 0.001.
    }

So we have maximum throttle up to 2km, adjusted throttle to get an acceleration of 4g until 10km at which point we set the acceleration set-point to 3g, then 2g at 20km. I am not suggesting that this is something you should do in normal operation, but it provides an example of what can be done. I will mention, the value of 0.05 is the "proportional gain" and can be adjusted to minimize oscillatory behavior in the throttle, but don't worry too much about that for now - we'll address that in the following tutorial where we create a full-fledged PID-controller.

There is one rather small correction to the above that I would like to make, namely:

    SAS ON.
    SET thrott TO 1.
    LOCK THROTTLE to thrott.
    STAGE.
    WAIT UNTIL SHIP:ALTITIUDE > 2000.
    SET acc_setpoint TO 4.
    LOCK acc TO SHIP:SENSORS:ACC:MAG.
    LOCK dthrott TO 0.05 * (acc_setpoint - acc).
    WHEN SHIP:ALTITIUDE > 10000 THEN {
        SET acc_setpoint TO 3.
        WHEN SHIP:ALTITIUDE > 20000 THEN {
            SET acc_setpoint TO 2.
        }
    }
    UNTIL SHIP:ALTITIUDE > 30000 {
        SET thrott TO thrott + dthrott.
        WAIT 0.001.
    }

Now this is quite elegant. I have reduced the number of triggers that have to be checked by one. The trigger at 10km sets up the next trigger for me. This can save a lot of processing time for triggers that will happen sequentially. As a general rule, you should nest WHEN/THEN statements whenever possible. Certainly, both examples above will work, but when you start to write really meaningful and complicated triggers, this nested construct can save you from that dreaded kOS trigger limit.
