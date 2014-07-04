List
====

Collection of Any type in kOS.  Many places throughout the system return
variables of the LIST type, and you can crate your own LIST variables as
well.

One of the places you are likely to find that kOS gives you a List is
when you use the [List command](../../command/list/index.html) to list
some query into one of your variables.

Once you have a list from some source, this is how you can manipulate it:

### Structure

Suffix      | Type      | Get | Set | Description
------------|-----------|-----|-----|--------------------------------------
:CLEAR      | irrelevant| yes | no  | Use this for its side-effect.  Whenever myList:CLEAR exists in an expression, myList will be zeroed out, regardless of what you do with the value of the expression.  i.e. SET DUMMY TO MYLIST:CLEAR. .
:LENGTH     | number    | yes | no  | Returns the number of elements in the list.
:COPY       | List      | yes | no  | Returns a new list that contains the same thing as the old list.
:[ITERATOR](../iterator/index.html) | Iterator | yes | no  | An alternate means of iterating over a list (see the link).
:ADD        | varies    | no  | yes | Appends a new value to the end of the list, and then assigns it to whatever you are setting this suffix to.
:CONTAINS   | boolean   | no  | yes | (**This is currently unusable**).  This returns true or false depending on whether or not the item you are SETTING it to is already in the list.  But there's no way to read the result of a SET command, so this is useless at the moment.
:REMOVE     | Number    | no  | yes | Removes the item from the list that is located at the index number given.

### Access to individual elements

All list indexes start counting at zero.  (The list elements are numbered from 0 to N-1 rather than from 1 to N.)

* **list#x** operator: access the element at postion x.  Works for get or set.  X must be a hardcoded number or a variable name.
* **list[** *expression* **]** operator: another syntax to acceess the element at position 'expression'.  Works for get or set.  Any arbitrary complex expression may be used with this syntax, not just a number or variable name.
* **FOR VAR IN LIST { ... }.**  : [a type of loop](../../command/flowControl/index.html#for) in which var iterates over all the items of list from item 0 to item LENGTH-1.
* **[ITERATOR](../iterator/index.html)** : An alternate means of iterating over a list (see the link).

Example:
    
    SET FOO TO LIST().       // Creates a new list in FOO variable
    SET FOO:ADD TO 5.        // Adds a new element to the end of the list
    SET FOO:ADD TO ALTITUDE. 
    SET FOO:ADD TO ETA:APOAPSIS. 
    PRINT FOO:LENGTH.        // Prints 3
    PRINT FOO#0.             // Prints 5.
    PRINT FOO[0].            // Prints 5.
    PRINT FOO#1.             // Prints altitude number.
    PRINT FOO#2.             // Prints eta:apoapsis number.
    SET x TO 2. PRINT FOO#x. // Prints the same thing as FOO#2.
    SET x TO 2. PRINT FOO[x].// Prints the same thing as FOO#2.
    SET y to 3. PRINT FOO[ y/3 + 1 ].
                             // Prints the same thing as FOO#2, using an expression as the index.
    SET FOO#0 to 4.          // Replace the 5 at position 0 with a 4.
    SET FOO:REMOVE TO 1.     // Removes the second element from the list
    SET BAR TO FOO:COPY.     // Makes a copy of the FOO list
    FOO:CLEAR.               // Removes all elements from the FOO list.
    FOR var in BAR {         // --.
      print var.             //   |-- Print all the contents of FOO.
    }.                       // --'

### Multidimensional Arrays

A 2-D Array is a List who's elements are themselves also Lists.  A 3-D Array is a List of Lists of Lists.  Any number of dimensions is posible.

* "list#x#y" or "list[x][y]": access the element at position x,y of the 2-D array (list of lists).
* The elements of the array need not be uniform (any mix of strings, numbers, structures is allowed).
* The dimensions of the array need not be uniform (row 1 might have 3 columns while row 2 has 5 columns).

Example:

    SET FOO TO LIST().         // Empty list.
    SET FOO:ADD TO LIST().     // Element 0 is now itself a list.
    SET FOO[0]:ADD TO "A".     // Element 0,0 is now "A".
    SET FOO[0]:ADD TO "B".     // Element 0,1 is now "B".
    SET FOO:ADD TO LIST().     // Element 1 is now itself a list.
    SET FOO[1]:ADD TO 10.      // Element 1,0 is now 10.
    SET FOO[1]:ADD TO 20.      // Element 1,1 is now 20.
    SET FOO:ADD TO LIST().     // Element 2 is now itself a list.
    SET FOO[ FOO:LENGTH -1 ]:ADD TO 3.14159.
                               // Element 2,0 is now 3.1519, using a more complex
                               //     expression to dynamically obtain the current
                               //     maximum index of '2'.
    SET FOO[ FOO:LENGTH -1 ]:ADD TO 7.
                               // Element 2,1 is now 7, using a more complex
                               //     expression to dynamically obtain the current
                               //     maximum index of '2'.
    // FOO is now a 2x3 matrix looking like this:
        A         B
        10        20
        3.14159   7
    // or like this, depending on how you want to visualize it:
        A    10     3.14159
        B    20     7
    PRINT FOO[2][1].           // Prints 7.
    PRINT FOO#2#0.             // Prints 3.14159

