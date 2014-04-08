# Vector

Represents a vector. [Wiki](http://en.wikipedia.org/wiki/Euclidean_vector)

Structure
=========

* X - Number (degrees)
* Y - Number (degrees)
* Z - Number (degrees)
* MAG - Number

#### Creation

V (x, y, z)

#### Vector Math Expressions

Assume S is a scalar, VA and VB are vectors:
    
* ```S * VA``` a vector, the [scalar multiplied by](http://en.wikipedia.org/wiki/Vector_addition#Scalar_multiplication) the vector.
* ```VA + VB``` a vector, the tip-to-tail [vector addition](http://en.wikipedia.org/wiki/Vector_addition#Addition_and_subtraction) of VA and VB.
* ```VA - VB``` a vector, the tip-to-tail [vector addition](http://en.wikipedia.org/wiki/Vector_addition#Addition_and_subtraction) of VA and (-1)*VB.
* ```VA * VB``` a synonym for VECTORDOTPRODUCT(VA,VB) (see next line).
* ```VECTORDOTPRODUCT(VA,VB)``` or ```VDOT(VA,VB)``` a scalar, the [dot product](http://en.wikipedia.org/wiki/Dot_product) of VA and VB
* ```VECTORCROSSPRODUCT(VA,VB)``` or ```VCRS(VA,VB)``` a vector, the [cross product](http://en.wikipedia.org/wiki/Cross_product) of VA and VB, in THAT order.
* ```VECTORANGLE(VA,VB)``` or ```VANG(VA,VB)``` a scalar, the angle between VA and VB.
  *    Same result as ```arccos( (VDOT(VA,VB) / VDOT(VA,VB):MAG )```.
* ```VECTOREXCLUDE(VA,VB)``` or ```VXCL(VA,VB)``` a vector, VA with all of VB excluded from it.
  *    In other words, the projection of VA onto the plane that is normal to VB.

#### Example
    SET varname TO V(100,5,0).          // initializes a vector with x=100, y=5, z=0
    varname:X.                          // Returns 100.
    V(100,5,0):Y.                       // Returns 5.
    V(100,5,0):Z.                       // Returns 0.
    varname:MAG.                        // Returns the magnitude of the vector, in this case
    SET varname:X TO 111.               // Changes vector x value to 111.
    SET varname:MAG to 10.              // Lengthen or shorten vector to make its magnitude 10.
    SET retroSurf to (-1)*velocity:surface.               // get vector pointing opposite to surface velocity.
    SET norm to VCRS(velocity:orbit,ship:body:position).  // use cross product to find normal to the orbit plane.
    
