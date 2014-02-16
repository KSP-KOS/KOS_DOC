# Time

Returns time in various formats.

Structure
=========


* CLOCK - Time (HH:MM:SS)
* CALENDAR - Date (Year #, day #)
* YEAR - Number
* DAY - Number (1-365)
* HOUR - Number (0-23)
* MINUTE - Number (0-59)
* SECOND - Number (0-59)
* SECONDS - Number (Total Seconds)


    TIME                // Gets the current universal time
    TIME:CLOCK          // Universal time in H:M:S format(1:50:26)
    TIME:CALENDAR       // Year 1, day 134
    TIME:YEAR           // 1
    TIME:DAY            // 134
    TIME:HOUR           // 1
    TIME:MINUTE         // 50
    TIME:SECOND         // 26
    TIME:SECONDS          // Total Seconds
