Config
======

Config is a special variable name that allows your kerboscript programs to
set or get the values stored in the kOS plugin's config file.

***

<a name="IPU"></a>

### CONFIG:IPU

An integer.  Gettable and Settable.  Configures the InstructionsPerUpdate setting.

This is the number of kRISC psuedo-machine-langauge instructions that each kOS CPU will attempt to execute from the main program per [physics update tick](../../summary_topics/CPU_hardeare/index.html).


***

<a name="UCP"></a>

### CONFIG:UCP

A boolean.  Gettable and Settable.  Configures the UseCompressedPersistence setting.

If true, then the contents of the kOS local volume 'files' stored inside the campaign
save's persistence file will be stored using a compression algorithm that has the
advantage of making them take less space, but at the cost of making the data 
impossible to decipher with the naked human eye when looking at the persistence file.

***

<a name="STAT"></a>

### CONFIG:STAT

A boolean.  Gettable and Settable.  Configures the ShowStatistics setting.

If true, then executing a program will log numbers to the screen showing
execution speed statistics.

***

<a name="RT2"></a>

### CONFIG:RT2

A boolean.  Gettable and Settable.  Configures the EnableRT2Integration setting.

If true, then the kOS mod will attempt to interact with the Remote Tech 2 mod,
letting RT2 make decisions about whether or not a vessel is within communications
range rather than having kOS use its own more primitive algorithm for it.

Due to a long stall in the development of the RT2 mod, this setting should still
be considered experimental at this point.

***

<a name="ARCH"></a>

### CONFIG:ARCH

A boolean.  Gettable and Settable.  Configures the StartOnArchive setting.

If true, then when a vessel is first loaded onto the launchpad or runway, the
initial default volume will be set to volume 0, the archive, instead of volume 1,
the local drive.

***

<a name="SAFE"></a>

### CONFIG:SAFE

A boolean.  Gettable and Settable.  Configures the EnableSafeMode setting.

If true, then it enables the following error messages: 

    Tried to push NaN into the stack.
    Tried to push Infinity into the stack.

They will be triggered any time any mathematical operation would result in
something that is not a real number, such as dividing by zero, or trying to
take the square root of a negative number, or the arccos of a number larger
than 1.  Performing such an operation will immediately terminate the
program with one of the error messages shown above.

If false, then these operations are permitted, but the result may lead to
code that does not function correctly if you are not careful about how you
use it.  Using a value that is not a real number may result in freezing
Kerbal Space Program itself if that value is used in a variable that is
passed into Kerbal Space Program's API routines.  KSP's own API interface does
not seem to have any protective checks in place and will faithfully try to use
whatever values its given.

***

<a name="VERBOSE"></a>

### CONFIG:VERBOSE

A boolean.  Gettable and Settable.  Configures the VerboseExceptions setting.

If true, then it enables a mode in which errors coming from kOS are very long
and verbose, trying to explain every detail of the problem.

***
