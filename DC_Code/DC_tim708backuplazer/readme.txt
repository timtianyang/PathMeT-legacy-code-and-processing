How to modify the inchworm:

change inchwormcycle variable in smpFunctionHeader.h, each 4 ticks is 1 deg.

change damping by using the command in here http://www.usdigital.com/support/user-guides/x3-rs232-serial-communication-user-guide
change incChangeDampingTime[] array in the header accordingly. The default is 2000ms

how to program chips:

open MPlab. import hex file. connect the programmer. provide power to the circuits.
click program.

ChangeLog 12/13/2013:
for some reason the LNG and LAT are reversed. the latest processing program will process as is. So does the GPS filtering javascript utility.
The bad thing about this is that all boston data need to be manually changed, ie. reverse the order of LNG and LAT inorder to use the latest post processing program. 


changelog 4/28/2014
increased buffersize to 20*512 because Ian used a higer level function to log.

changelog 4/29/2014
reduced SPI bus speed to 140/8 MBit ==> around 500 bytes/ms, no curruption has been detected.

changelog 5/9/2014
removed camGPS chip in order to connect Cannon.

changelog 5/29/2014
restored camGPS chip. Everything except incl and cam trigger(B4 on cam) have been changed

changelog 6/03/2014
added handshake with buff and cam chip so success or failure is known to user. Previous SD card failures
are attributed to bad soldering and damaged headers for SD click sockets.

changelog 6/10/2014 designed for the rev7 board.

changelog 6/24/2014
Event trigger added