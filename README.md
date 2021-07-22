## Ultibo demo project

This is a self running demonstration of some of the features of Ultibo core.

The demo image can be downloaded from the releases page on GitHub or by following the link from the download page on the Ultibo website. If you don’t have a Raspberry Pi a video of the demo is available on YouTube at https://youtu.be/GF9Xbf3mbf4

To run the demo unzip the downloaded file (Ultibo-Demo-1.0.10.zip), copy the contents to the root directory of an SD card formatted with a FAT partition and use the card to boot your Raspberry Pi. 

You can also use an existing SD card created for Raspberry Pi OS (Raspbian) to run the demo by copying the kernel.img, kernel7.img, kernel7l.img, armstub32-rpi2.bin, armstub32-rpi3.bin, armstub32-rpi4.bin and config.txt files from the downloaded zip to the root directory of the FAT partition.

To build the demo download or clone this repository to your local computer, select Project, Open Project ... from within the Lazarus (Ultibo Edition) IDE and choose UltiboDemoRPi.lpr, UltiboDemoRPi2.lpr, UltiboDemoRPi3.lpr or  UltiboDemoRPi4.lpr from the location you downloaded to.

Select Run, Build from the menu to build kernel.img, kernel7.img or kernel7l.img depending on which project you opened above.

For more information on Ultibo and what it can do see https://ultibo.org/

