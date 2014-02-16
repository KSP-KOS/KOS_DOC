### DECLARE

Declares a variable at the current context level. Alternatively, a variable can be implicitly declared by a SET or LOCK statement.
Example:

    DECLARE X.

### DECLARE PARAMETER

Declares variables to be used as a parameter.
Example:

    DECLARE PARAMETER X.
    DECLARE PARAMETER X,y.
    RUN MYPROG(X).

### SET.. TO

Sets the value of a variable. Declares the variable if it doesn’t already exist.
Example:

    SET X TO 1.

### TOGGLE

Toggles a variable between true or false. If the variable in question starts out as a number, it will be converted to a boolean and then toggled. This is useful for setting action groups, which are activated whenever their values are inverted.
Example:

    TOGGLE AG1.			// Fires action group 1.
    TOGGLE SAS.			// Toggles SAS on or off.

### ..ON

Sets a variable to true. This is useful for the RCS and SAS bindings.
Example:

    RCS ON 			// Turns on the RCS

### ..OFF

Sets a variable to false. This is useful for the RCS and SAS bindings.
Example

    RCS OFF			// Turns off the RCS

