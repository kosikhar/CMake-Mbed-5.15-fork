# A Fork of MbedOS v5.15

A Simple Fork of MbedOS v5.15 which includes a custom implementation of CMake. 
* As Development occurs, changes to the OS will need to be made. This fork keeps track of the changes and allow projects to be updated. 

## How to Use
* Project requires you to define the Enviromental Variable of the location of this repository called "MBED_OS_V5_15_DIR"
* In your project CMakeLists.txt, add "include($ENV{MBED_OS_V5_15_DIR}/cmake/{your MCU here}.cmake)" add then "include($ENV{MBED_OS_V5_15_DIR}/CMakeLists.txt)" 
	* This will add a library that you can link to called "MBED_OS_V5_15"
	* Simply add it into the list that would inside your "target_link_libraries()" function in your project's CMakeLists.txt

## During Application Development
* If an Application specific change needs to be made, please branch using the PYGO Project Code as the name of the branch. (ie: SUNC-001-002-2020CA) 
* Changes made on master must be NON-INVASIVE. 
	* ie: Adding a method to a class. Other Application code bases will not call this method so it should be safe. 
	* Examples of invasive changes:
		* Adding Definitions -> Possiblity of name collision
		* Changing the implementation of a function/method. 
		
### Device Support
This list is limited. As New Projects are done, more will be be supported. 

* STM32L432KC
