### Control Styles and Best Practices with kOS

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


