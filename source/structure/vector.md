Vector
======

Represents a vector. [Wiki](http://en.wikipedia.org/wiki/Euclidean_vector)

To deeply understand most vectors in kOS, you have to understand a bit about the
[underlying coordinate system of KSP](../../ref_frame/index.html).  If you are
having trouble making sense of the direction the axes point in, go read that page.

### Structure

Suffix        | Type      | Get | Set | Description
--------------|-----------|-----|-----|--------------------------------------
:X            | Number    | yes | yes | The X component of the vector.
:Y            | Number    | yes | yes | The Y component of the vector.
:Z            | Number    | yes | yes | The Z component of the vector.
:MAG          | Number    | yes | yes | The magnitude of the vector, as a scalar number, by the Pythagorean Theorem
:NORMALIZED   | Vector    | yes | no  | This creates a unit vector pointing in the same direction as this vector.  (The same effect as multiplying the vector by the scalar 1/MyVec:MAG. )
:SQRMAGNITUDE | Number    | yes | no  | The magnitude of the vector, squared.  Use instead of (MyVec:MAG ^ 2) if you need to square of the magnitude as this skips the step in the Pythagorean formula where you take the square root in the first place.  Taking the square root and then squaring that would introduce floating point error needlessly.
:DIRECTION    | [Direction](../direction/index.html) | yes | yes | GET: The vector rendered into a direction (see note at the bottom of this page about information loss when doing this).  SET: Tells the vector to keep its magnitude as it is but point in a new direction, adjusting its XYZ numbers accordingly.
:VEC          | Vector    | yes | no  | This is a suffix that creates a COPY of this vector.  Useful if you want to copy a vector and then change the copy.  (Normally if you SET V2 TO V1, then V1 and V2 are two names for the same vector and changing one would change the other).

#### Creation

The function:

*  **V(** *x*, *y*, *z* **)**

Creates a vector from its 3 components.

#### Vector Math Expressions

Assume S is a scalar, VA and VB are vectors:
    
* **```S * VA```** is a vector, the [scalar multiplied by](http://en.wikipedia.org/wiki/Vector_addition#Scalar_multiplication) the vector.
* **```VA + VB```** is a vector, the tip-to-tail [vector addition](http://en.wikipedia.org/wiki/Vector_addition#Addition_and_subtraction) of VA and VB.
* **```VA - VB```** is a vector, the tip-to-tail [vector addition](http://en.wikipedia.org/wiki/Vector_addition#Addition_and_subtraction) of VA and (-1)*VB.
* **```VA * VB```** is a synonym for VECTORDOTPRODUCT(VA,VB) (see next line).
* **```VECTORDOTPRODUCT(VA,VB)```** or **```VDOT(VA,VB)```** is a scalar, the [dot product](http://en.wikipedia.org/wiki/Dot_product) of VA and VB
* **```VECTORCROSSPRODUCT(VA,VB)```** or **```VCRS(VA,VB)```** is a vector, the [cross product](http://en.wikipedia.org/wiki/Cross_product) of VA and VB, in THAT order.
* **```VECTORANGLE(VA,VB)```** or **```VANG(VA,VB)```** is a scalar, the angle between VA and VB.
  *    Same result as ```arccos( (VDOT(VA,VB) / VDOT(VA,VB):MAG )```.
* **```VECTOREXCLUDE(VA,VB)```** or **```VXCL(VA,VB)```** is a vector, VB with all of VA excluded from it.
  *    In other words, the projection of VB onto the plane that is normal to VA.

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
    
#### The difference between a Direction and a Vector, and the consequences of conversions:

A Vector and a Direction can be represented with the exact same amount of information:
a tuple of 3 floating point numbers.  So you might wonder why it is that a Vector
can hold information about the magnitude of the line segment, while a Direction cannot,
given that both have the same amount of information.  The answer is that a Direction does
contain one thing a Vector does not.  A Direction knows which way is "up", while a Vector
does not.  If you tell kOS to LOCK STEERING to a Vector, it will be able to point the nose
of the vessel in the correct direction, but won't know which way you want the roof of the
craft rotated to.  This works fine for axial symmetrical rockets but can be a problem for
airplanes.

Therefore if you do this:

    SET MyVec to V(100,200,300).
    SET MyDir to MyVec:DIRECTION.

Then MyDir will be a Direction, but it will be a Direction where you have no control over which
way is "up" for it.

