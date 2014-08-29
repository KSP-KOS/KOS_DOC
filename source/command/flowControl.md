Flow Control
======

***

### BREAK

Breaks out of a loop.
Example:

    SET X TO 1.
    UNTIL 0 {
        SET X TO X + 1.
        IF X > 10 { BREAK. }.       // Exits the loop when X is greater than 10
    }.

***

### IF/ELSE

Checks if the expression supplied returns true. If it does, IF executes the following command block.
Can also have an optional ELSE to execute when the IF condition is not true.  ELSE can have another
IF after it, to make a chain of if/else conditions.

Example:

    SET X TO 1.
    IF X = 1 { PRINT "X equals one.". }.            // Prints "X equals one."
    IF X > 10 { PRINT "X is greater than ten.". }.  // Does nothing
    //
    // IF-ELSE structure:
    IF X > 10 { PRINT "X is large".  } ELSE { PRINT "X is small".  }.
    //
    // An if-else ladder:
    IF X = 0 {
	PRINT "zero".
    } ELSE IF X < 0 {
	PRINT "negative".
    } ELSE {
	PRINT "positive".
    }.

Although a period (.) is usally optional after the end of a set of curly braces like so:

{ }.

In the case where you are using the ELSE keyword, you must _not_ end the previous IF body with a period, as that terminates the IF command and causes the ELSE keyword to be without a matching IF.

Example:

    IF X > 10 { PRINT "Large". } ELSE { PRINT "Small". }.  // works
    IF X > 10 { PRINT "Large". }. ELSE { PRINT "Small". }.  // syntax error - ELSE without IF.

***

### LOCK

Locks an identifier to an expression. Each time the identifier is used in an expression, its
value will be re-calculated on the fly.

Example:

    SET X TO 1.
    LOCK Y TO X + 2.
    PRINT Y.       // Outputs 3
    SET X TO 4.
    PRINT Y.      // Outputs 6

Unlike variables created with the SET or DECLARE commands, LOCK variables are local to the current program.  If program A calls program B, and program B issues a LOCK command, program A will not be able to read that LOCK variable's result.

NOTE THAT if a lock expression is used with a flight control such as THROTTLE or STEERING, then it will
get continually evaluated in the background [each update tick](../../summary_topics/CPU_hardware/index.html#TRIGGERS).

***

### UNLOCK

Releases a lock on a variable. See LOCK.
Examples:

    UNLOCK X.                // Releases a lock on variable X.
    UNLOCK ALL.              // Releases ALL locks.

***

### UNTIL

Performs a loop until a certain condition is met.
Example:

    SET X to 1.
    UNTIL X > 10 {          // Prints the numbers 1-10.
        PRINT X.
        SET X to X + 1.
    }.

Note that if you are creating a loop in which you are watching a physical value that you expect to
change each iteration, it's vital that you insert a small WAIT at the bottom of the loop like so:

    SET PREV_TIME to TIME:SECONDS.
    SET PREV_VEL to SHIP:VELOCITY.
    SET ACCEL to V(9999,9999,9999).
    PRINT "Waiting for accellerations to stop.".
    UNTIL ACCEL:MAG < 0.5 {
        SET ACCEL TO (SHIP:VELOCITY - PREV_VEL) / (TIME:SECONDS - PREV_TIME).
        SET PREV_TIME to TIME:SECONDS.
        SET PREV_VEL to SHIP:VELOCITY.

        WAIT 0.001.  // This line is Vitally Important.
    }.

The full explanation why is [in the CPU hardware description page](../../summary_topics/CPU_hardware/index.html#FROZEN).

***

### FOR

Loops over a list collection, letting you access one element at a time.

Syntax: FOR _variable1_ IN _variable2_ { code here }.

Where:

* _variable1_ is a variable to hold each element one at a time.
* _varaible2_ is a LIST variable to iterate over.

Example:

    PRINT "Counting flamed out engines:".
    SET numOUT to 0.
    LIST ENGINES IN MyList.
    FOR eng IN MyList {
        IF ENG:FLAMEOUT {
            set numOUT to numOUT + 1.
        }.
    }.
    PRINT "There are " + numOut + "Flamed out engines.".

***

### WAIT

Halts execution for a specified amount of time, or until a specific set of criteria are met. Note that running a WAIT UNTIL statement can hang the machine forever if the criteria are never met.
Examples:

    WAIT 6.2.                     // Wait 6.2 seconds.
    WAIT UNTIL X > 40.            // Wait until X becomes greater than 40.
    WAIT UNTIL APOAPSIS > 150000. // You can see where this is going.

Note that any WAIT statement, no matter what the actual expression is, will always result in
a wait time that lasts at least [one physics tick](../../summary_topics/CPU_hardware/index.html#WAIT).

***
<a name="WHEN"></a>

### WHEN.. THEN

Executes a command when a certain criteria are met. Unlike WAIT, WHEN does not
halt execution. It starts a check in the background that will keep actively
looking for the trigger condition while the rest of the code continures. When
it triggers, the body after the THEN will execute exactly once, after which
the trigger is removed.  (Unless the [PRESERVE command](#PRESERVE) is used, in
which case the trigger is not removed).

The body of a THEN or an ON statement interrupts the normal flow of a kOS
program. When the event that triggers the body happens, the main kOS program
is paused until the body of the THEN completes.

> **NOTE: DO NOT make the body of a WHEN..THEN take a long time to execute.  If you attempt to run code that lasts too long in the body of your WHEN..THEN statement, [it will cause an error](../../summary_topics/CPU_hardware/index.html#TRIGGERS).** Avoid looping during WHEN/THEN if you can.

IMPORTANT BREAKING CHANGE
|------|
| CHANGE WITH 0.12 In previous versions of kOS, the body of a WHEN/THEN would execute simultaneously in the background with the rest of the main program. This behavior has changed as of version 0.12 of kOS, as described above, and scripts that used to rely on this behavior will not work with version 0.12 of kOS. |

Example:

    //
    WHEN BCount < 99 THEN PRINT BCount + “ bottles of beer on the wall”.
    //
    // Watch in the background for when the altitude is high enough.
    // Once it is, then turn on the solar panels and action group 1:
    WHEN altitude > 70000 THEN {
	PRINT "ACTIVATING PANELS AND AG 1.".
	PANELS ON.
	AG1 ON.
    }.

A WHEN..THEN trigger is removed when the program that created it exits, even if it has not occurred yet.

The [PRESERVE keyword](#PRESERVE) can be used inside the THEN clause of a WHEN statement.

If you are going to make extensive use of WHEN..THEN triggers, it's important to understand
more details of how they [work in the kOS CPU](../../summary_topics/CPU_hardware/index.html#TRIGGERS).

***
<a name="ON"></a>

### ON

The ON command is almost identical to the WHEN/THEN command. ON sets up a trigger in the background that will run the selected command exactly once when the boolean variable changes state from true to false or from false to true. This command is best used to listen for action group activations.

Just like with the WHEN/THEN command, the [PRESERVE command](#PRESERVE) can be used inside the
code block to cause the trigger to remain active and not go away.

How does it differ from WHEN/THEN? : WHEN/THEN triggers whenever the conditional expression becomes true. ON triggers whenever the boolean variable changes state EITHER from false to true OR from true to false.

The body of an ON statement can be a list of commands inside curly braces, just like for WHEN/THEN. Also just like with WHEN/THEN, the body of the ON interrupts all of KSP while it runs, so it should be designed to be a short and finish quickly without getting stuck in a long loop.

Example:

    ON AG3 {
       PRINT “Action Group 3 Activated!”.
    }.
    ON SAS PRINT “SAS system has been toggled”.
    ON AG1 {
        PRINT "Action Group 1 activated.".
        PRESERVE.
    }.

> **NOTE: DO NOT make the body of an ON statement take a long time to execute.  If you attempt to run code that lasts too long in the body of your ON statement, [it will cause an error](../../summary_topics/CPU_hardware/index.html#TRIGGERS).**

Avoid looping during ON code blocks if you can.

If you are going to make extensive use of ON triggers, it's important to understand
more details of how they [work in the kOS CPU](../../summary_topics/CPU_hardware/index.html#TRIGGERS).

***
<a name="PRESERVE"></a>

### PRESERVE

PRESERVE is a command keyword that is only valid inside of [WHEN..THEN](#WHEN) and [ON](#ON) code blocks.

When a [WHEN..THEN](#WHEN) or [ON](#ON) condition is triggered, the default behavior is to
execute the code block body exactly once and only once, and then the trigger condition is
removed and the trigger will never occur again.

To alter this, execute the 'PRESERVE' command anywhere within the body of the code being executed
and it tells the kOS computer to keep the trigger condition active.  When it finishes executing the
code block of the trigger, if PRESERVE has happened anywhere within that run of the block of code,
it will not remove the trigger.  Instead it will allow it to re-trigger,
possibly as soon as the very next tick.  If the PRESERVE keyword is executed again and again each
time the trigger occurs, the trigger could remain active indefinitely.

Example:

    SET NUMSTAGES TO 5.
    SET STAGE_COOLDOWN_START TO 0.
    //
    // Set up a continuous background check to keep looking for if there's
    // no fuel in the current stage, and if there is, then activate the next
    // stage, but no more often than once every half second.
    // Once more than NUMSTAGES have happened, allow the check to stop executing.
    // Keep the check alive until that happens.
    //
    WHEN (TIME:SECONDS > STAGE_COOLDOWN_START + 0.5) AND STAGE:LIQUIDFUEL = 0 {
        SET STAGE_COOLDOWN_START TO TIME:SECONDS.
        STAGE.
        SET NUMSTAGES TO NUMSTAGES - 1.
        IF NUMSTAGES > 0 {
            PRESERVE.
        }.
    }.
    // 
    // Continue to the rest of the code
        

***

### (Boolean operators) All conditional statements, like IF, can make use of boolean operators. Order of operations is as follows:

* = < > <= >= <>
* AND
* OR
* NOT

Boolean is a type that can be stored in a variable and used that way as well. The constants True and False (case insensitive) may be used as values for boolean variables.

If a number is used as if it was a Boolean variable, it will be interpreted in the standard way (zero means false, anything else means true).

Example:

    IF X = 1 AND Y > 4 { PRINT "Both conditions are true". }.
    IF X = 1 OR Y > 4 { PRINT "At least one condition is true". }.
    IF NOT (X = 1 or Y > 4) { PRINT "Neither condition is true". }.
    IF X <> 1 { PRINT "X is not 1". }.
    SET MYCHECK TO NOT (X = 1 or Y > 4).
    IF MYCHECK { PRINT "mycheck is true." }.
    LOCK CONTINUOUSCHECK TO X < 0.
    WHEN CONTINUOUSCHECK THEN { PRINT "X has just become negative.". }.
    IF True { PRINT "This statement happens unconditionally." }.
    IF False { PRINT "This statement never happens." }.
    IF 1 { PRINT "This statement happens unconditionally." }.
    IF 0 { PRINT "This statement never happens." }.
    IF count { PRINT "count isn't zero.". }.

