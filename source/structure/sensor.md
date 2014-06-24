# Sensor

The type of structures returned by LIST SENSORS IN SOMEVARIABLE

Structure
=========

#### Getters

* All the suffixes of [Part](../part/index.html) plus...
  * ACTIVE - boolean - true of the sensor is enabled.
  * TYPE - ??
  * READOUT - ?? 

#### Setters
* All the suffixes of [Part](../part/index.html) plus...
  * ACTIVE - boolean - cause the sensor to become active or inactive.

Example

    PRINT "Full Sensor Dump:".
    LIST SENSORS IN SENSELIST.
    FOR SENSOR IN SENSELIST {
      PRINT "SENSOR " + SENSOR:TYPE + ": ACTIVE = " + SENSOR:ACTIVE + " VALUE = " + SENSOR:READOUT.
    }.
