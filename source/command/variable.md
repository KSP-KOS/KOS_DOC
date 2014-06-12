Variable
======

***

### DECLARE

Declares a global variable. Alternatively, a variable can be implicitly declared by any SET or LOCK statement.
Example:

    DECLARE X.

***

### DECLARE PARAMETER

Declares variables to be used as a parameter.
Example:

    DECLARE PARAMETER X.
    DECLARE PARAMETER X,y.
    RUN MYPROG(X).

Note: Unlike normal variables, Parameter variables are local to the program.  When program A calls program B and passes parameters to it, program B can alter their values without affecting the values of the variables in program A.

***

### SET.. TO

Sets the value of a variable. Declares a global variable if it doesn’t already exist.
Example:

    SET X TO 1.

***

### LOCK.. TO

Declares that the idenifier will refer to an expression that is always re-evaluated on the fly every time it is used.
Example:

    SET Y TO 1.
    LOCK X TO Y + 1.
    PRINT X. // prints "2"
    SET Y TO 2.
    PRINT X. // prints "3"

***

### TOGGLE

Toggles a variable between true or false. If the variable in question starts out as a number, it will be converted to a boolean and then toggled. This is useful for setting action groups, which are activated whenever their values are inverted.
Example:

    TOGGLE AG1.			// Fires action group 1.
    TOGGLE SAS.			// Toggles SAS on or off.

***

### ..ON

Sets a variable to true. This is useful for the RCS and SAS bindings.
Example:

    RCS ON 			// Turns on the RCS

***

### ..OFF

Sets a variable to false. This is useful for the RCS and SAS bindings.
Example

    RCS OFF			// Turns off the RCS

