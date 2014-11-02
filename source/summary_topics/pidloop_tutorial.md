## PID Loops in kOS

This tutorial covers how one can implement a [PID loop](http://en.wikipedia.org/wiki/PID_controller) using kOS. A P-loop, or "proportional feedback loop" was already introduced in the second section of the [Design Patterns Tutorial](summary_topics/intermediate_tutorial/index.html), and that will serve as our starting point. After some code rearrangement, the integral and derivative terms will be added and discussed in turn. Next, a couple extra features will be added to the full PID-loop. Lastly, we'll show a case-study in tuning a full PID loop using the Ziegler-Nichols method. We'll use the LOG method to dump telemetry from KSP into a file and our favorite graphing software to visualize the data.

The code examples in this tutorial can be tested with a similar rocket design as shown. Do not forget the accelerometer, gravioli detector or the kOS CPU module. The engine is purposefully overpowered to demonstrate the feedback in action.

### Proportional Feedback Loop (P-loop)

The example code from the [Design Patterns Tutorial](summary_topics/intermediate_tutorial/index.html), with some slight modifications looks like the following:

    // staging, throttle, steering, go
    WHEN STAGE:LIQUIDFUEL < 0.1 THEN {
        STAGE.
        PRESERVE.
    }
    LOCK THROTTLE TO 1.
    LOCK STEERING TO R(0,0,-90) + HEADING(90,90).
    STAGE.
    WAIT UNTIL SHIP:ALTITUDE > 1000.
    
    // P-loop setup
    SET g TO KERBIN:MU / KERBIN:RADIUS^2.
    LOCK accvec TO SHIP:SENSORS:ACC - SHIP:SENSORS:GRAV.
    LOCK gforce TO accvec:MAG / g.
    LOCK dthrott TO 0.05 * (1.2 - gforce).
    
    SET thrott TO 1.
    LOCK THROTTLE to thrott.
    
    UNTIL SHIP:ALTITUDE > 40000 {
        SET thrott to thrott + dthrott.
        WAIT 0.1.
    }

The first several lines sets up a simple staging condition, puts the throttle to maximum, steers the rocket straight up and launches. The rocket is assumed to use only liquid fuel engines. After the rocket hits 1km, the script sets up the LOCK used in the P-loop which is updated every 0.1 seconds in the UNTIL loop.

The input to this feedback loop is the acceleration experienced by the ship (gforce) in terms of Kerbin's gravitational acceleration at sea level (g). The variable accvec is the total acceleration vector and is obtained by the accelerometer and gravioli detectors, both of which must be on the ship for this to work. The variable dthrott is the change in throttle that should be applied in a single iteration of the feedback loop.

In terms of a PID loop, the factor 1.2 is called the setpoint, gforce is the process variable and 0.05 is called the proportional gain. The setpoint and gain factors can be promoted to their own variables with names. Also, the code up to and including the "WAIT UNTIL SHIP:ALTITUDE > 1000." will be implied for the next few examples of code:

    // P-loop
    SET g TO KERBIN:MU / KERBIN:RADIUS^2.
    LOCK accvec TO SHIP:SENSORS:ACC - SHIP:SENSORS:GRAV.
    LOCK gforce TO accvec:MAG / g.
    
    SET gforce_setpoint TO 1.2
    SET Kp TO 0.05.
    LOCK dthrott TO Kp * (gforce_setpoint - gforce).
    
    SET thrott TO 1.
    LOCK THROTTLE to thrott.
    
    UNTIL SHIP:ALTITUDE > 40000 {
        SET thrott to thrott + dthrott.
        WAIT 0.1.
    }

This is not a big change, but it will set us up to include the integral and derivative terms in the next section.

### Proportional-Integral Feedback Loop (PI-loop)

Adding the integral term requires us to keep track of time. This is done by introducing a variable (t0) to store the time of the last iteration. Now, the throttle is changed only on iterations where some time has elapsed so the WAIT time in the UNTIL can be brought to 0.001.

    // PI-loop
    SET g TO KERBIN:MU / KERBIN:RADIUS^2.
    LOCK accvec TO SHIP:SENSORS:ACC - SHIP:SENSORS:GRAV.
    LOCK gforce TO accvec:MAG / g.
    
    SET gforce_setpoint TO 1.2
    
    LOCK P TO gforce_setpoint - gforce.
    SET I TO 0.
    
    SET Kp TO 0.05.
    SET Ki TO 0.05.
    
    LOCK dthrott TO Kp*P + Ki*I.
    
    SET thrott TO 1.
    LOCK THROTTLE to thrott.

    SET t0 TO TIME:SECONDS.
    UNTIL SHIP:ALTITUDE > 40000 {
        SET dt TO TIME:SECONDS - t0.
        IF dt > 0 {
            SET I TO I + P*dt.
            SET thrott to thrott + dthrott.
            SET t0 TO TIME:SECONDS.
        }
        WAIT 0.001.
    }

### Proportional-Integral-Derivative Feedback Loop (PID-loop)

The derivative term requires an additional variable to keep track of the previous value of the proportional term, P.

    // PID-loop
    SET g TO KERBIN:MU / KERBIN:RADIUS^2.
    LOCK accvec TO SHIP:SENSORS:ACC - SHIP:SENSORS:GRAV.
    LOCK gforce TO accvec:MAG / g.
    
    SET gforce_setpoint TO 1.2
    
    LOCK P TO gforce_setpoint - gforce.
    SET I TO 0.
    SET D TO 0.
    SET P0 TO P.
    
    SET Kp TO 0.05.
    SET Ki TO 0.05.
    SET Kd TO 0.05.
    
    LOCK dthrott TO Kp * P + Ki * I + Kd * D.
    
    SET thrott TO 1.
    LOCK THROTTLE to thrott.

    SET t0 TO TIME:SECONDS.
    UNTIL SHIP:ALTITUDE > 40000 {
        SET dt TO TIME:SECONDS - t0.
        IF dt > 0 {
            SET I TO I + P * dt.
            SET D TO (P - P0) / dt.
            SET P0 TO P.
            SET thrott to thrott + dthrott.
            SET t0 TO TIME:SECONDS.
        }
        WAIT 0.001.
    }

### Final Touches

There are a few modifications that can make PID loops very robust. The following code example adds three range limits:

1. bounds on the Integral term which addresses possible [integral windup](http://en.wikipedia.org/wiki/Integral_windup)
2. bounds on the throttle since it must stay in the range 0 to 1
3. a [deadband](http://en.wikipedia.org/wiki/Deadband) to avoid changing the throttle due to small fluctuations

Of course, KSP is a simulator and small fluctuations are not observed in this particular loop. Indeed, the P-loop is sufficient in this example, but all these features are included here for illustration purposes and they could become useful for unstable aircraft or untested scenarios.

    // PID-loop
    SET g TO KERBIN:MU / KERBIN:RADIUS^2.
    LOCK accvec TO SHIP:SENSORS:ACC - SHIP:SENSORS:GRAV.
    LOCK gforce TO accvec:MAG / g.
    
    SET gforce_setpoint TO 1.2
    
    LOCK P TO gforce_setpoint - gforce.
    SET I TO 0.
    SET D TO 0.
    SET P0 TO P.
    
    LOCK in_deadband TO ABS(P) < 0.1.
    
    SET Kp TO 0.05.
    SET Ki TO 0.05.
    SET Kd TO 0.05.
    
    LOCK dthrott TO Kp * P + Ki * I + Kd * D.
    
    SET thrott TO 1.
    LOCK THROTTLE to thrott.
    
    SET t0 TO TIME:SECONDS.
    UNTIL SHIP:ALTITUDE > 40000 {
        SET dt TO TIME:SECONDS - t0.
        IF dt > 0 {
            IF NOT in_deadband {
                SET I TO I + P * dt.
                SET D TO (P - P0) / dt.
                SET P0 TO P.
                
                // If Ki is non-zero, then limit Ki*I to [-1,1]
                IF Ki > 0 {
                    SET I TO MIN(1.0/Ki, MAX(-1.0/Ki, I)).
                }
                
                // set throttle but keep in range [0,1]
                SET thrott to MIN(1, MAX(0, thrott + dthrott)).
                
                SET t0 TO TIME:SECONDS.
            }
        }
        WAIT 0.001.
    }
