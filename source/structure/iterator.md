Iterator
========

(An iterator is obtained from the :ITERATOR suffix of a [LIST](../list/index.html). )

Once a LIST has given you an ITERATOR, you can use it to access elements inside the LIST.

An ITERATOR is a [generic computer programming concept](http://en.wikipedia.org/wiki/Iterator).
In the general case it's a
variable type that allows you to get the value at a position in some collection,
as well as increment to the next item in the collection in order to operate on all objects
in the collection one at a time.  In kOS it operates on LISTS.

The suffixes of ITERATOR are as follows.

Suffix      | Type      | Get | Set | Method&nbsp;Arguments |Description
------------|-----------|-----|-----|------------------|-----------------------------
:RESET      | n/a       | no  | no  | zero args        | Call this to rewind the iterator to just before the beginning of the list.  After a call to RESET(), the iterator must be moved with NEXT() before it gets to the first value in the list.
:NEXT       | Boolean   | yes | no  | zero args        | Call this to move the iterator to the next item in the list.  Returns true if there is such an item, or false if no such item exists (because it's already at the end of the list).
:ATEND      | Boolean   | yes | no  | zero args        | Returns true if the iterator is at the end of the list and therefore cannot be "NEXTed", false otherwise.
:INDEX      | Number    | yes | no  | zero args        | Returns the numerical index of how far you are into the list, starting the counting at 0 for the first item in the list. (The last item in the list is numbered N-1, where N is the number of items in the list).  __If you have just used :RESET or have just created the ITERATOR, then the value of :INDEX is -1.__  It only becomes 0 after the first call to :NEXT.
:VALUE      | varies    | yes | no  | zero args        | Returns the thing stored at the current position in the list.

#### Example:

A loop using an ITERATOR on a LIST might look like this:

    // Starting with a list that was built like this:
    //
    SET MyList To LIST().
    MyList:ADD( "Hello" ).
    MyList:ADD( "Aloha" ).
    MyList:ADD( "Bonjour" ).
    //
    // It could be looped over like this:
    //
    SET MyCurrent TO MyList:ITERATOR.
    MyCurrent:RESET().
    PRINT "After reset, position = " + MyCurrent:INDEX. 
    UNTIL NOT MyCurrent:NEXT {
        PRINT "Item at position " + MyIter:INDEX + " is [" + MyIter:VALUE + "].".
    }.

Which would result in this output:

    After reset, position = -1.
    Item at position 0 is [Hello].
    Item at position 1 is [Aloha].
    Item at position 2 is [Bonjour].

