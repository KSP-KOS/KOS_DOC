Predictive Functions
====================

These return predicted information about the future position and velocity of an object.

### POSITIONAT( THING, TIME )

Returns a prediction of where **thing** will be at universal timestamp **time**.
If the THING is a Vessel, and the Vessel has planned manuever nodes, the
prediction assumes the manuever nodes will be executed exactly as planned.
* **thing** is an Orbitable
* **time** is a Timestamp
* **return value** is a VECTOR, expressed in ship-center-raw-rotation coords.

### VELOCITYAT( THING, TIME )

Returns a prediction of what **thing**s velocity will be at universal timestamp **time**.
If the THING is a Vessel, and the Vessel has planned manuever nodes, the
prediction assumes the manuever nodes will be executed exactly as planned.
* **thing** is an Orbitable
* **time** is a Timestamp
* **return value** is an ORBITABLEVELOCITY structure.

### ORBITAT( THING, TIME )

Returns the Orbit patch where the thing is predicted to be at universal timestamp time.
If the THING is a Vessel, and the Vessel has planned manuever nodes, the
prediction assumes the manuever nodes will be executed exactly as planned.
* **thing** is an Orbitable
* **time** is a Timestamp
* **return value** is an ORBIT structure.


Example:

    //kOS
    // test the future position and velocity prediction.
    // Draws a position and velocity vector at a future predicted time.
    
    declare parameter item. // thing to predict for, i.e. SHIP.
    declare parameter offset. // how much time into the future to predict.
    declare parameter velScale. // how big to draw the velocity vectors.
                  // If they're far from the camera you should draw them bigger.
    
    
    set predictUT to time + offset.
    set stopProg to false.
    
    set futurePos to positionat( item, predictUT ).
    set futureVel to velocityat( item, predictUT ).
    
    set drawPos to vecdrawargs( v(0,0,0), futurePos, green, "future position", 1, true ).
    set drawVel to vecdrawargs( futurePos, velScale*futureVel:orbit, yellow, "future velocity", 1, true ).

Example Screenshot:

![Image showing exmple](https://camo.githubusercontent.com/ed83a348cb38b769a5dd45eba43aea1d32c415b0/687474703a2f2f692e696d6775722e636f6d2f786c5237557a4d2e706e67)

(Please click the image and view it in a standalone window to see it full size).
