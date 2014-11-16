File I/O
========

Note: All filenames (program names) must be valid Identifiers.  (for example, you can't have a filename called "this is my-file".)

***

## Volume and Filename arguments

### This is a recent change in kOS v0.15.

Any of the commands below which use filename arguments, **with the exception
of the RUN command**, follow these rules:

* (expression filenames) A filename may be an expression which evaluates to a string.
* (bareword filenames) A filename may also be an undefined identifier which does not match a variable name, in which case the bare word name of the identifier will be used as the filename.  If the identifier does match a variable name, then it will be evaluated as an expression and the variable's contents will be used as the filename.
* A bareword filename may contain file extensions with dots, provided it does not end in a dot.
* If the filename does not contain a file extension, kOS will pad it with a ".ks" extension and use that.

Putting the above rules together, you can refer to filenames in any of the following ways:

  * copy myfilename to 1.       // This is an example of a bareword filename.
  * copy "myfilename" to 1.     // This is an example of an EXPRESSION filename. 
  * copy myfilename.ks to 1.    // This is an example of a bareword filename.
  * copy myfilename.txt to 1.   // This is an example of a bareword filename.
  * copy "myfilename.ks" to 1.  // This is an example of an EXPRESSION filename
  * set str to "myfile" + "name" + ".ks".  copy str to 1.  // This is an example of an EXPRESSION filename

**Limits:**

The following rules apply as limitations to the bareword filenames:

* The **RUN command only works with bareword filenames**, not expression filenames.  Every other command works with either type of filename.
* Filenames containing any characters other than A-Z, 0-9, underscore, and the period extension separator ('.'), can only be referred to using a string expression (with quotes), and cannot be used as a bareword expression (without quotes).
* If your filesystem is case-senstive (Linux and sometimes Mac OSX, or even Windows if using some kinds of remote network drives), then bareword filenames will only work properly on filenames that are all lowercase.  If you try to use a file with capital letters in the name on these systems, you will only be able to do so by quoting it.

**Volumes too:**

The rules for filenames also apply to volumes.  You may do this for example:

*  set volNum to 1. copy "myfile" to volNum.

***

## COMPILE $1 (TO $2)?

### (experimental)

#### Arguments:
* argument 1: Name of source file.
* argument 2: Name of destination file.  If the optional argument 2 is missing, it will assume it's the same as argument 1, but with a file extension changed to *.ksm.

Pre-compiles a script into an [Kerboscript ML Exceutable image](../../summary_topics/MLfile/index.html) that can be used instead of executing the program discript directly.

The RUN command (elsewhere on this page) can work with either *.ks script files or *.ksm compiled files.

The full details of this process are long and complex enough to be placed on a separate page.

Please see [the details of the Kerboscript ML Executable](../../summary_topics/MLfile/index.html).


## COPY $1 FROM/TO $2

#### Arguments
* argument 1: Name of target file.
* argument 2: Target volume.

Copies a file to or from another volume. Volumes can be referenced by their ID numbers or their names if they’ve been given one. See LIST, SWITCH and RENAME.

Understanding how [volumes work](../../summary_topics/volumes/index.html) is important to understanding this command.

In order for a copy operation to work, the volumes being copied between must be within [CommRange](../../summary_topics/commrange/index.html).

Example:

    SWITCH TO 1.             // Makes volume 1 the active volume
    COPY file1 FROM 0.       // Copies a file called file1.ks from volume 0 to volume 1
    COPY file2 TO 0.         // Copies a file called file1.ks from volume 1 to volume 0
    COPY file1.ks FROM 0.    // Copies a file called file1.ks from volume 0 to volume 1
    COPY file2.ksm TO 0.     // Copies a file called file1.ksm from volume 1 to volume 0
    COPY "file1.ksm" FROM 0. // Copies a file called file1.ksm from volume 0 to volume 1
    COPY "file1" + "." + "ks" FROM 0. // Copies a file called file1.ks from volume 0 to volume 1

***

## DELETE $1 FROM $2

Deletes a file. You can delete a file from the current volume, or from a named volume.

#### Arguments
* argument 1: Name of target file.
* argument 2: (optional) Target volume.

In order for a delete operation to work, the volumes being copied between must be within [CommRange](../../summary_topics/commrange/index.html).

Example:

    DELETE file1.         // Deletes file1.ks from the active volume.
    DELETE "file1".       // Deletes file1.ks from the active volume.
    DELETE file1.txt.     // Deletes file1.txt from the active volume.
    DELETE "file1.txt".   // Deletes file1.txt from the active volume.
    DELETE file1 FROM 1.  // Deletes file1.ks from volume 1

***

## EDIT $1

Edits a program on the currently selected volume.

#### Arguments
* argument 1: Name of file for editing.

NOTE: The Edit feature was lost in version 0.11 but is back again after version 0.12.2 under a new
guise.  The new editor is unable to show a monospace font for a series of complex reasons involving
how Unity works and how squad bundled the KSP game.  The editor works, but will be in a proporional
width font, which isn't ideal for editing code.  The best way to edit code remains to use a text
editor external to KSP, however for a fast peek at the code during play, this editor is useful.

Example:

    EDIT filename.       // edits filename.ks
    EDIT filename.ks.    // edits filename.ks
    EDIT "filename.ks".  // edits filename.ks
    EDIT "filename".     // edits filename.ks
    EDIT "filename.txt". // edits filename.txt

***

## LOG $1 TO $2

Logs the selected text to a file on the local volume. Can print strings, or the result of an expression.

#### Arguments
* argument 1: Value you would like to log.
* argument 2: Name of file to log into.

Example:

    LOG “Hello” to mylog.txt.    // logs to "mylog.txt".
    LOG 4+1 to "mylog" .         // logs to "mylog.ks" because .ks is the default extension.
    LOG “4 times 8 is: “ + (4*8) to mylog.   // logs to mylog.ks because .ks is the default extension.

***

## RENAME $1 TO $2

Renames a file or volume.

#### Arguments
* argument 1: Volume/File Name you would like to change.
* argument 2: New name for $1.

Example:

    RENAME VOLUME 1 TO AwesomeDisk
    RENAME FILE MyFile TO AutoLaunch.

***

## RUN $1 [ ( comma-separated-args ) ]

Runs the specified file as a program, optionally passing information to the program 
in the form of a comma-separated list of arguments in parentheses.

#### Arguments
* argument 1: File to run.
* comma-separagted-args: a list of values to pass into the program.

Example:

    RUN AutoLaunch.ks.
    RUN AutoLaunch.ksm.
    RUN AutoLaunch.      // runs AutoLaunch.ksm if available, else runs AutoLaunch.ks.
    RUN AutoLaunch( 75000, true, "hello" ).
    RUN AutoLaunch.ks( 75000, true, "hello" ).
    RUN AutoLaunch.ksm( 75000, true, "hello" ).

The program that is reading the arguments sees them in the variables it
mentions in [DECLARE PARAMETER statements](../variable/index.html#declare-parameter)

#### Important exceptions to the usual filename rules for RUN

The RUN command does not allow the same sorts of generic open-ended filenames that the other
file commands allow.  This is very important.

* RUN only works when the filename is a bareword filename.  It cannot use expression filenames:

~~~
    RUN "ProgName"   // THIS WILL FAIL.  Run needs a bare word filename.
    SET ProgName to "MyProgram".
    RUN ProgName     // THIS WILL FAIL also.  It will attempt to run a file
                     // called "ProgName.ksm" or "ProgName.ks", when it sees this,
                     // rather than "MyProgram".
~~~

> The reasons for the exception to how filenames work for the RUN
> command are too complex to go into in large detail here.   Here's the
> short version: While the kOS system does defer the majority of the work
> of actually compiling subprogram scripts until run-time, it still has to
> generate some header info about them at compile time, and the filename
> has to be set in stone at that time.  Changing this would require a 
> large re-write of some of the archetecture of the virtual machine.

***

## SWITCH TO $1

Switches to the specified volume. Volumes can be specified by number, or it’s name (if it has one). See LIST and RENAME.  Understanding how [volumes work](../../summary_topics/volumes/index.html) is important to understanding this command.

In order for a switch operation to work, it must be within [CommRange](../../summary_topics/commrange/index.html).

#### Arguments
* argument 1: Volume name/number

Example:

    SWITCH TO 0.                        // Switch to volume 0.
    RENAME VOLUME 1 TO AwesomeDisk.     // Name volume 1 as AwesomeDisk.
    SWITCH TO AwesomeDisk.              // Switch to volume 1.
    PRINT VOLUME:NAME.                  // Prints "AwesomeDisk".

