Sensor
======

The type of structures returned by [LIST SENSORS IN SOMEVARIABLE](../../command/list/index.html#vessel-lists).

(This is not fully understood because the type of PartModule in the KSP API called ModuleEnviroSensor, which
all Sensors are a kind of, is not well documented.)

#### Structure

Suffix      | Type     | Get | Set | Description
------------|----------|-----|-----|--------------------------------------
All the suffixes of [Part](../part/index.html) plus... | varies | .. | .. | Sensor is a type of Part, and therefore can use all the suffixes of Part.  Shown below are only the suffixes that are unique to Engine variables:
:ACTIVE     | boolean  | yes | yes | true of the sensor is enabled.  Can SET to cause the sensor to activate or de-activate.
:TYPE       | ??       | yes | no  | ??
:READOUT    | varies, usually double | yes | no  | The value of the sensor's readout, usually a double.


Example

    PRINT "Full Sensor Dump:".
    LIST SENSORS IN SENSELIST.
    FOR SENSOR IN SENSELIST {
      PRINT "SENSOR " + SENSOR:TYPE + ": ACTIVE = " + SENSOR:ACTIVE + " VALUE = " + SENSOR:READOUT.
    }.
