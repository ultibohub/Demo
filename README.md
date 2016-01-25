Ultibo demo project

This is a self running demonstration of some of the features of Ultibo core.

The demo image can be downloaded from the releases page on GitHub or follow
the link from the download page on the Ultibo website.

To run the demo simply copy the files KERNEL.IMG and KERNEL7.IMG to an SD card
formatted as FAT, copy the Raspberry Pi firmware files which you can download
from https://github.com/raspberrypi/firmware onto the SD card as well and use
the card to boot your Raspberry Pi.

To build the demo download or clone this repository to your local computer, select
Project, Open Project ... from within the Lazarus (Ultibo Edition) IDE and select
the UltiboDemo.lpr from the location you downloaded to. 

Select Project, Project Options ..., Config and Target and choose the appropriate
target controller setting for your Raspberry Pi model. Then select Run, Compile from
the menu to build either KERNEL.IMG or KERNEL7.IMG

For more information on Ultibo and what it can do see https://ultibo.org/

