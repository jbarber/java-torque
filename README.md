### io.github.jbarber.pbs - Java class for PBS/Torque

This class provides an interface to interact with the [PBS/Torque resource manager](http://www.adaptivecomputing.com/products/open-source/torque/).

This class differentiates itself from others in the problem space by using [SWIG](http://www.swig.org/) generated JNI bindings to the PBS/Torque C interface. The other classes (that I'm aware of):
* [pbs4torque](https://code.google.com/p/pbs4java/)
* [pbs-java-api](https://github.com/biouno/pbs-java-api/)

simply wrap the Torque binaries and parse their output.

At the moment only a few of the functions from the PBS/Torque C interface have been added, but they are enough to prove the concept and provide basic functionality.

## Building

You will need:
* SWIG 2 (tested with 2.0.11)
* A JDK (tested with OpenJDK 1.7.0u45)
* A C compiler (tested with gcc 4.8.2)
* Torque libraries and header files (tested with torque-2.5.7 on RHEL6)
* make (tested with GNU make 3.82)

"make run" should build all of the dependencies and then launch the main.class to try and connect to a Torque daemon on the localhost address (the server can be specified via the first argument).

## Example usage

See `main.java` for examples on how-to connect to and query the server (localhost by default).

To specify a different host, provide the hostname as the first argument. e.g.:

````
   LD_LIBRARY_PATH=$PWD java -cp pbs.class:./ main torque.example.com
````

## TODO

* Tests
* Add more functions from the PBS/Torque 
* Check for memory leaks
* Create a more idiomatic Java interface based on this class
