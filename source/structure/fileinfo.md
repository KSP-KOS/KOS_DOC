FILEINFO
========

File name and size information.

You can obtain a list of values of type FileInfo using the [LIST FILES](../../command/list/index.html#file-system-lists) command.

Structure
=========

Suffix      | Type     | Get | Set | Description
------------|----------|-----|-----|--------------------------------------
:NAME       | String   | yes | no  | name of the file, including its file extension.
:FILETYPE   | String   | yes | no  | Type of the file as a string, taken from the [File Type List](#File_Type_list) below.
:SIZE       | Number   | yes | no  | size of the file, in bytes.
:MODIFIED   | String   | yes | no  | The date the file was last modified, in [Real World Timestamp](#Real_World_Timestamp) format, described below.
:CREATED    | String   | yes | no  | The date the file was first created, in [Real World Timestamp](#Real_World_Timestamp) format, described below.

###File Type List

File types from the :FILETYPE suffix are one of the following strings:

* **"ASCII"** - A file containing ASCII text, like the result of a LOG command.
* **"KERBOSCRIPT"** - (unimplemented) A type of ASCII file containing Kerboscript ascii code.  At the moment this type does not ever get returned.  You will always get files of type ASCII instead.
* **"KSM"** - A type of file containing KerboMachineLanguage compiled code, that was created from the [COMPILE command](../../summary_topics/compile/index.html).
* **"UNKNOWN"** - Any other type of file.

###Real World Timestamp

These timestamps are NOT in Kerbal Space Program's simulated clock, but
are in real world time.  This is for a good reason: the files exist outside
of any one saved game and are global to all saved games you have.

**The format of the real-world timestamps is as follows:**

<i>YYYY</i>-<i>MM</i>-<i>DD</i><b>T</b><i>hh</i>:<i>mm</i>:<i>ss</i>.<i>sssss</i><b>Z</b>

Where:

* *YYYY* is the Four-digit year.
* *MM* is the Two-digit month, padded with zeroes (i.e. September is '09' rather than '9'.)
* *DD* is the Two-digit day of month, padded with zeroes (i.e. the 5th of the month is '05' rather than '5'.)
* **T** is always a hardcoded capital letter "T".
* *hh* is the 24-hour clock time (5 AM is 05, 5 PM is 18).
* *mm* is the Two-digit minute-hand, padded with zeroes.
* *ss.ssss* is the seconds-hand, padded with zeroes to at least 2 digits before the decimal point, and a varying number of digits after that.  It can store fractional parts of the second.
* **Z** is always a hardcoded capital letter "Z", meaning its the local timezone-less timestamp.

This string format should be possible to sort on directly.

Example:

    // This example checks if a file exists on the current volume.
    DECLARE PARAMETER searchFile.
    LIST FILES IN fileList.
    SET exists to FALSE.
    
    FOR file IN fileList {
        IF file:NAME = searchFile {
            set exists to TRUE.
        }
    }
    
    IF exists {
        PRINT searchFile + " exists".
    } ELSE {
        PRINT searchFile + " does not exist".
    }

