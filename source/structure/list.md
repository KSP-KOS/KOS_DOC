List
====

Collection of Any type in kOS.  Many places throughout the system return
variables of the LIST type, and you can create your own LIST variables as
well.

One of the places you are likely to find that kOS gives you a List is
when you use the [List command](../../command/list/index.html) to list
some query into one of your variables.

Once you have a list from some source, this is how you can manipulate it:

### Structure

Suffix      | Type    | Get | Set | Method&nbsp;Arguments | Description
------------|---------|-----|-----|------------------|-------------------------------------
:ADD        | n/a     | n/a | n/a | 1 arg:<br/>insertItem [any type]  | Appends the new value given to the end of the list.
:INSERT     | n/a     | n/a | n/a | 2 args:<br/>index [number],<br/>item to insert [any type]  | Inserts a new value at the position given, pushing all the other values in the list (if any) one spot to the right.
:REMOVE     | n/a     | n/a | n/a | 1 arg:<br/>index [number]   | Remove the item from the list at the numeric index given, with counting starting atthe first item being item zero
:CLEAR      | n/a     | n/a | no  | zero args        | Use this for its side-effect.  Whenever myList:CLEAR exists in an expression, myList will be zeroed out, regardless of what you do with the value of the expression.  i.e. SET DUMMY TO MYLIST:CLEAR. .
:LENGTH     | number  | yes | no  | zero args        | Returns the number of elements in the list.
:[ITERATOR](../iterator/index.html) | Iterator | yes | no  | zero args   | An alternate means of iterating over a list (see the link).
:COPY       | List    | yes | no  | zero args        | Returns a new list that contains the same thing as the old list.
:CONTAINS   | boolean | no  | no  | 1 arg:<br/>compareTo [any type]  | Returns true if the list contains an item equal to the one passed as an argument
:SUBLIST    | List    | yes | no  | 2 args:<br/>index [number],<br/>length [number] | Returns a new list that contains a subset of this list starting at the given index number, and running for the given length of items.
:EMPTY      | boolean | yes | no  | zero args        | Returns true if the list has zero items in it.
:DUMP       | string  | yes | no  | zero args        | Returns a string containing a verbose dump of the list's contents.

### Access to individual elements

All list indexes start counting at zero.  (The list elements are numbered from 0 to N-1 rather than from 1 to N.)

* **list#x** *DEPRECATED* operator: access the element at postion x.  Works for get or set.  X must be a hardcoded number or a variable name.  This is here for backward compatibility.  The syntax in the next bullet point is preferred over this.
* **list[** *expression* **]** operator: another syntax to acceess the element at position 'expression'.  Works for get or set.  Any arbitrary complex expression may be used with this syntax, not just a number or variable name.  This syntax is preferred over the older "#" syntax, which is kept only for backward compatibility.
* **FOR VAR IN LIST { ... }.**  : [a type of loop](../../command/flowControl/index.html#for) in which var iterates over all the items of list from item 0 to item LENGTH-1.
* **[ITERATOR](../iterator/index.html)** : An alternate means of iterating over a list (see the link).

Example:
    
    SET FOO TO LIST().       // Creates a new empty list in FOO variable
    FOO:ADD(5).              // Adds a new element to the end of the list
    FOO:ADD( ALTITUDE ).     // Adds current altitude number to the end of the list
    FOO:ADD(ETA:APOAPSIS).   // Adds current seconds to apoapsis to the end of the list
    //
    // As a reminder, at this point your list, if you did all the above
    // steps in order, would look like this now:
    //
    //  FOO[0] = 5.
    //  FOO[1] = 99999. // or whatever your altitude was when you added it.
    //  FOO[2] = 99. // or whatever your ETA:APOAPSIS was when you added it.
    //
    PRINT FOO:LENGTH.        // Prints 3
    PRINT FOO:LENGTH().      // Also prints 3.  LENGTH is a method that, because it takes zero arguments, can omit the parentheses.
    PRINT FOO#0.             // Prints 5, using deprecated old '#' syntax.
    PRINT FOO[0].            // Prints 5, using newer preferred '[]' syntax.
    PRINT FOO[1].            // Prints altitude number.
    PRINT FOO[2].            // Prints eta:apoapsis number.
    SET x TO 2. PRINT FOO#x. // Prints the same thing as FOO[2], using deprecated old '#' syntax.
    SET x TO 2. PRINT FOO[x].// Prints the same thing as FOO[2].
    SET y to 3. PRINT FOO[ y/3 + 1 ].
                             // Prints the same thing as FOO#2, using a mathematical expression as the index.
    SET FOO#0 to 4.          // Replace the 5 at position 0 with a 4.
    FOO:INSERT(0,"skipper 1"). // Inserts the string "skipper 1" to the start of the list, pushing the rest of the contents right.
    FOO:INSERT(2,"skipper 2"). // Inserts the string "skipper 2" at position 2 of the list, pushing the rest of the contents right.
    //
    // As a reminder, at this point your list, if you did all the above
    // steps in order, would look like this now:
    //
    //  FOO[0] = "skipper 1".
    //  FOO[1] = 5.
    //  FOO[2] = "skipper 2".
    //  FOO[3] = 99999. // or whatever your altitude was when you added it.
    //  FOO[4] = 99. // or whatever your ETA:APOAPSIS was when you added it.
    //
    FOO:REMOVE( 1).              // Removes the element at index 1 from the list, moving everything else back one.
    FOO:REMOVE(FOO:LENGTH - 1).  // Removes whatever element happens to be at the end of the list, at position length-1.
    //
    // As a reminder, at this point your list, if you did all the above
    // steps in order, would look like this now:
    //
    //  FOO[0] = "skipper 1".
    //  FOO[1] = "skipper 2".
    //  FOO[2] = 99999. // or whatever your altitude was when you added it.
    //
    SET BAR TO FOO:COPY.     // Makes a copy of the FOO list
    FOO:CLEAR.               // Removes all elements from the FOO list.
    FOO:CLEAR().             // Also removes all elements from the FOO list.  The parentheses are optional because the method takes zero arguments.
    FOR var in BAR {         // --.
      print var.             //   |-- Print all the contents of FOO.
    }.                       // --'

### Multidimensional Arrays

A 2-D Array is a List who's elements are themselves also Lists.  A 3-D Array is a List of Lists of Lists.  Any number of dimensions is posible.

* "list#x#y" or "list[x][y]": access the element at position x,y of the 2-D array (list of lists).  The use of the '#' syntax is deprecated and exists for backward compatibility only.  The newer '[]' square-bracket syntax is preferred.
* The elements of the array need not be uniform (any mix of strings, numbers, structures is allowed).
* The dimensions of the array need not be uniform (row 1 might have 3 columns while row 2 has 5 columns).

Example:

    SET FOO TO LIST().    // Empty list.
    FOO:ADD( LIST() ).    // Element 0 is now itself a list.
    FOO[0]:ADD( "A" ).    // Element 0,0 is now "A".
    FOO[0]:ADD( "B" ).    // Element 0,1 is now "B".
    FOO:ADD(LIST()).      // Element 1 is now itself a list.
    FOO[1]:ADD(10).       // Element 1,0 is now 10.
    FOO[1]:ADD(20).       // Element 1,1 is now 20.
    FOO:ADD(LIST()).      // Element 2 is now itself a list.
    FOO[ FOO:LENGTH -1 ]:ADD(3.14159).
                          // Element 2,0 is now 3.1519, using a more complex
                          //     expression to dynamically obtain the current
                          //     maximum index of '2'.
    FOO[ FOO:LENGTH -1 ]:ADD(7).
                          // Element 2,1 is now 7, using a more complex
                          //     expression to dynamically obtain the current
                          //     maximum index of '2'.
    //
    // FOO is now a 2x3 matrix looking like this:
    //    A         B
    //    10        20
    //    3.14159   7
    // or like this, depending on how you want to visualize it as a row-first or column-first table:
    //    A    10     3.14159
    //    B    20     7
    //
    PRINT FOO#2#0.             // Prints 3.14159, using deprecated syntax.
    PRINT FOO[0][0].           // Prints A.
    PRINT FOO[0][1].           // Prints B.
    PRINT FOO[1][0].           // Prints 10.
    PRINT FOO[1][1].           // Prints 20.
    PRINT FOO[2][0].           // Prints 3.14159.
    PRINT FOO[2][1].           // Prints 7.

