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

### IF

Checks if the expression supplied returns true. If it does, IF executes the following command block.
Example:

    SET X TO 1.
    IF X = 1 { PRINT "X equals one.". }.            // Prints "X equals one."
    IF X > 10 { PRINT "X is greater than ten.". }.  // Does nothing

***

### LOCK

Locks a variable to an expression. On each cycle, the target variable will be freshly updated with the latest value from expression.
Example:

    SET X TO 1.
    LOCK Y TO X + 2.
    PRINT Y.       // Outputs 3
    SET X TO 4.
    PRINT Y.      // Outputs 6

***

### ON

Awaits a change in a boolean variable, then runs the selected command. This command is best used to listen for action group activations.
Example:

    ON AG3 PRINT “Action Group 3 Activated!”.
    ON SAS PRINT “SAS system has been toggled”.

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

***

### WAIT

Halts execution for a specified amount of time, or until a specific set of criteria are met. Note that running a WAIT UNTIL statement can hang the machine forever if the criteria are never met.
Examples:

    WAIT 6.2.                     // Wait 6.2 seconds.
    WAIT UNTIL X > 40.            // Wait until X becomes greater than 40.
    WAIT UNTIL APOAPSIS > 150000. // You can see where this is going.

***

### WHEN.. THEN

Executes a command when a certain criteria are met. Unlike WAIT, WHEN does not halt execution.
Example:

    WHEN BCount < 99 THEN PRINT BCount + “ bottles of beer on the wall”.

***
### (Boolean operators)
All conditional statements, like IF, can make use of boolean operators.
Order of operations is as follows:

    = < > <= >= <>
    AND
    OR
    NOT
    
Boolean is a type that can be stored in a variable and used that way as well.
The constants True and False (case insensitive) may be used as values for boolean variables.

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
    //
    // More complex example:
    SET done to false.
    UNTIL done {
      PRINT "Still not done according to the complex check.".
      SET done to (x < 0 or y > 7) and (3*z > 7).
    }.
