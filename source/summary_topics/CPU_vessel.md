### CPU VESSEL (terminology)

When kOS documentation refers to the "CPU Vessel", it has the following definition:

* whichever vessel happens to currently contain the CPU in which the executing code is running.

It's important to distinguish this from "active vessel", which is a KSP term referring to
whichever vessel the camera is centered on, and therefore the vessel that will recieve the
keyboard controls for WASD and so on.


The two terms can differ when you are in a situation where there are two vessels near
each other, both of them within full physics range (i.e. 2.5 km), such as would happen
during a docking operation.  In such a situation it is possible for kOS programs to be
running on one, both, or neither of the two vessels.  The vessel on which a program is
executing is not necessarily the vessel the KSP game is currently considering the 'active'
one.

* NOTE: The built-in variable called **SHIP** is always set to the current CPU_vessel.  Whenver
you see the documentation refer to CPU_vessel, you can think of that as being "the SHIP variable".

For all places where a kOS program needs to do something with "this vessel", for the sake
of centering [SHIP-RAW coords](../../ref_frame/index.html), for the sake of deciding which
ship is having manuever nodes added to it, and for the sake of deciding which vessel is
being controlled by the autopilot, the vessel it is referring to is itself, the **CPU vessel**,
NOT necessarily what KSP thinks of as the "active vessel".
