## === Structure ===

### V (x, y, z)

Represents a vector. [Wiki](http://en.wikipedia.org/wiki/Euclidean_vector)

* X - Number (meters/s)
* Y - Number (meters/s)
* Z - Number (meters/s)
* MAG - Number

#### Example
    SET varname TO V(100,5,0).          // initializes a vector with x=100, y=5, z=0
    varname:X.                          // Returns 100.
    V(100,5,0):Y.                       // Returns 5.
    V(100,5,0):Z.                       // Returns 0.
    varname:MAG.                        // Returns the magnitude of the vector, in this case
    SET varname:X TO 111.               // Changes vector x value to 111.
    SET varname:MAG to 10.              // Changes magnitude of vector. e.g. V(9.98987,0.44999,0)
