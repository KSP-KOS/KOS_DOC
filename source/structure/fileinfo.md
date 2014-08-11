FILEINFO
========

File name and size information.

You can obtain a list of values of type FileInfo using the [LIST FILES](../../command/list/index.html#file-system-lists) command.

Structure
=========

Suffix      | Type     | Get | Set | Description
------------|----------|-----|-----|--------------------------------------
:NAME       | String   | yes | no  | name of the file.
:SIZE       | Number   | yes | no  | size of the file.

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

