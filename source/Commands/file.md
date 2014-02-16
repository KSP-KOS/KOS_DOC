File I/O
========

### COPY

Copies a file to or from another volume. Volumes can be referenced by their ID numbers or their names if they’ve been given one. See LIST, SWITCH and RENAME.
Example:

    SWITCH TO 1.       // Makes volume 1 the active volume
    COPY file1 FROM 0. // Copies a file called file1 from volume 0 to volume 1
    COPY file2 TO 0.   // Copies a file called file1 from volume 1 to volume 0

### DELETE

Deletes a file. You can delete a file from the current volume, or from a named volume.
Example:

    DELETE file1.         // Deletes file1 from the active volume.
    DELETE file1 FROM 1.  // Deletes file1 from volume 1

### EDIT

Edits a program on the currently selected volume.
Example:

    EDIT filename.

### LOG.. TO

Logs the selected text to a file on the local volume. Can print strings, or the result of an expression.
Example:

    LOG “Hello” to mylog.
    LOG 4+1 to mylog .
    LOG “4 times 8 is: “ + (4*8) to mylog.

### RENAME

Renames a file or volume.
Example:

    RENAME VOLUME 1 TO AwesomeDisk
    RENAME FILE MyFile TO AutoLaunch.

### REMOVE

Removes a maneuver node.
Example:

    REMOVE NEXTNODE.        // Removes the first maneuver node in the flight plan.

### RUN

Runs the specified file as a program.
Example:

    RUN AutoLaunch.

### SWITCH TO

Switches to the specified volume. Volumes can be specified by number, or it’s name (if it has one). See LIST and RENAME.
Example:

    SWITCH TO 0.                        // Switch to volume 0.
    RENAME VOLUME 1 TO AwesomeDisk.     // Name volume 1 as AwesomeDisk.
    SWITCH TO AwesomeDisk.              // Switch to volume 1.
    PRINT VOLUME:NAME.                  // Prints "AwesomeDisk".

