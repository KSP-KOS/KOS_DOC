Sensor
======

The type of structures returned by [LIST SENSORS IN SOMEVARIABLE](../../command/list/index.html#vessel-lists).

(This is not fully understood because the type of PartModule in the KSP API called ModuleEnviroSensor, which
all Sensors are a kind of, is not well documented.)

#### Structure

Suffix      | Type     | Get | Set | Method&nbsp;Arguments | Description
------------|----------|-----|-----|-----------------------|-----------------------------
All the suffixes of [Part](../part/index.html) plus... | varies | .. | .. | .. | Sensor is a type of Part, and therefore can use all the suffixes of Part.  Shown below are only the suffixes that are unique to Engine variables:
:ACTIVE     | boolean  | yes | yes | no args      | true of the sensor is enabled.  Can SET to cause the sensor to activate or de-activate.
:TYPE       | ??       | yes | no  | no args      | ??
:READOUT    | varies, usually double | yes | no  | no args      | The value of the sensor's readout, usually a double.
:POWERCONSUMPTION | Number | yes | no  | no args      | The rate at which this sensor drains ElectricCharge.  (Units unkown - TODO - fix that)
:TOGGLE     | n/a      | n/a | no | no args | CALL this method to cause the sensor to switch between active and deactivated or visa versa.


Example

    PRINT "Full Sensor Dump:".
    LIST SENSORS IN SENSELIST.

    // TURN EVERY SINGLE SENSOR ON:
    FOR S IN SENSELIST {
      PRINT "SENSOR " + S:TYPE + " VALUE = " + S:READOUT.
      IF S:ACTIVE {
        PRINT "     SENSOR IS ALREADY ON."
      } ELSE {
        PRINT "     SENSOR WAS OFF.  TURNING IT ON."
        S:TOGGLE().
      }.
    }.
