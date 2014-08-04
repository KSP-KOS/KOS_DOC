Iterator
========

(An iterator is obtained from the :ITERATOR suffix of a [LIST](../list/index.html). )

Once a LIST has given you an ITERATOR, you can use it to access elements inside the LIST.

An ITERATOR is a [generic computer programming concept](http://en.wikipedia.org/wiki/Iterator).
In the general case it's a
variable type that allows you to get the value at a position in some collection,
as well as increment to the next item in the collection in order to operate on all objects
in the collection one at a time.  In kOS it operates on LISTS.

The suffixes of ITERATOR are as follows.  They are *all* gettable values and
not settable values, although getting them can have side effects that make
things happen, as explained below in the table.

Suffix      | Type      | Get | Set | Description
------------|-----------|-----|-----|--------------------------------------
:INDEX      | Number    | yes | no  | Returns the numerical index of how far you are into the list, starting the counting at 0 for the first item in the list. (The last item in the list is numbered N-1, where N is the number of items in the list).  __If you have just used :RESET or have just created the ITERATOR, then the value of :INDEX is -1.__  It only becomes 0 after the first call to :NEXT.
:VALUE      | varies    | yes | no  | Returns the thing stored at the current position in the list.
:NEXT       | Boolean   | yes | no  | This suffix does two things at once: **(1)** It advances the iterator to the next item in the list.  __Please note that you must call :NEXT once before the iterator is usable.__  The Iterator begins at the point one step PRIOR to the beginning of the list.  **(2)** It returns a boolean True if the Next operation worked or False if it failed because it's past the end.
:ATEND      | Boolean   | yes | no  | This suffix just tests for whether or not the iterator is past the end of the list.  It returns True if it's past the end, or False if it's not.
:RESET      | Boolean   | yes | no  | Whenever you "get" the RESET suffix of an iterator, it rewinds the iterator to the start of the list.  This is a case where you are using the 'side effect' of accessing the suffix.  What you assign the RESET to is irrelevant. i.e. SET Dummy TO MyIter:RESET will reset the MyIter iterator variable.  The value returned by RESET is a boolean that is always True for List types but might become false for other types if any other types are ever implemented.  (A return value of False means you are dealing with a type of collection that cannot be rewinded.)

#### Example:

A loop using an ITERATOR on a LIST might look like this:

    SET MyList To LIST().
    SET MyList:ADD to "Hello".
    SET MyList:ADD to "Aloha".
    SET MyList:ADD to "Bonjour".
    SET MyCurrent TO MyList:ITERATOR.
    SET dummy TO MyCurrent:RESET.
    UNTIL NOT MyCurrent:NEXT {
        PRINT "Item at position " + MyIter:INDEX + " is [" + MyIter:VALUE + "].".
    }.

Which would result in this output:

    Item at position 0 is [Hello].
    Item at position 1 is [Aloha].
    Item at position 2 is [Bonjour].

