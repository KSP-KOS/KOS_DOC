File I/O
========

## COPY $1 FROM/TO $2

#### Arguments
$1: Name of target file.
$2: Target volume.

Copies a file to or from another volume. Volumes can be referenced by their ID numbers or their names if they’ve been given one. See LIST, SWITCH and RENAME.
Example:

    SWITCH TO 1.       // Makes volume 1 the active volume
    COPY file1 FROM 0. // Copies a file called file1 from volume 0 to volume 1
    COPY file2 TO 0.   // Copies a file called file1 from volume 1 to volume 0

## DELETE $1 FROM $2

Deletes a file. You can delete a file from the current volume, or from a named volume.

#### Arguments
$1: Name of target file.
$2: (optional) Target volume.

Example:

    DELETE file1.         // Deletes file1 from the active volume.
    DELETE file1 FROM 1.  // Deletes file1 from volume 1

## EDIT $1

Edits a program on the currently selected volume.

#### Arguments
$1: Name of file for editing.

Example:

    EDIT filename.

## LOG $1 TO $2

Logs the selected text to a file on the local volume. Can print strings, or the result of an expression.

#### Arguments
$1: Value you would like to log.
$2: Name of file to log into.

Example:

    LOG “Hello” to mylog.
    LOG 4+1 to mylog .
    LOG “4 times 8 is: “ + (4*8) to mylog.

## RENAME $1 TO $2

Renames a file or volume.

#### Arguments
$1: Volume/File Name you would like to change.
$2: New name for $1.

Example:

    RENAME VOLUME 1 TO AwesomeDisk
    RENAME FILE MyFile TO AutoLaunch.

## RUN $1

Runs the specified file as a program.

#### Arguments
$1: File to run

Example:

    RUN AutoLaunch.

## SWITCH TO $1

Switches to the specified volume. Volumes can be specified by number, or it’s name (if it has one). See LIST and RENAME.

#### Arguments
$1: Volume name/number

Example:

    SWITCH TO 0.                        // Switch to volume 0.
    RENAME VOLUME 1 TO AwesomeDisk.     // Name volume 1 as AwesomeDisk.
    SWITCH TO AwesomeDisk.              // Switch to volume 1.
    PRINT VOLUME:NAME.                  // Prints "AwesomeDisk".

