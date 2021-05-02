program UltiboDemoRPi4;

{Ultibo demo project for Raspberry Pi 4B/400                                   }
{                                                                              }
{For the Raspberry Pi A/B/A+/B+/Zero version see the file UltiboDemoRPi.lpr    }
{For the Raspberry Pi 2B version see the file UltiboDemoRPi2.lpr               }
{For the Raspberry Pi 3B/3B+/3A+ version see the file UltiboDemoRPi3.lpr       }
{                                                                              }
{To compile this project select Build, Run from the Lazarus menu               }
{                                                                              }
{History: 1.0.0 - Initial release                                              }
{         1.0.1 - Add Raspberry Pi 3B support                                  }
{         1.0.2 - Add USB fixes for Raspberry Pi A/A+/Zero                     } 
{         1.0.3 - Update to use ConsolePeekKey and ConsoleGetKey functions     }
{         1.0.6 - Update to add detection of Raspberry Pi 3B+                  }
{         1.0.7 - Update to include LAN78XX driver for Raspberry Pi 3B+        }
{         1.0.8 - Update to add detection of Raspberry Pi 3A+                  }
{         1.0.9 - Add Raspberry Pi 4B/400 support                              }

{$mode delphi} {Default to Delphi compatible syntax}
{$H+}          {Default to AnsiString}

uses
 RaspberryPi4,
 GlobalConfig,
 GlobalConst,
 Platform,
 Threads,
 DemoMain,
 Logging,
 Console,
 ConsoleShell;
 
begin
 {Initialize the Demo}
 if InitDemo then
  begin
   {Run the Demo}
   RunDemo;
   
   {When we return start the Console shell}
   CONSOLE_SHELL_ENABLED:=True;
   CONSOLE_SHELL_POSITION:=CONSOLE_POSITION_TOPRIGHT;
   ConsoleShellDeviceAdd(ConsoleDeviceGetDefault,False);
   ConsoleWindowActivate(ConsoleWindowFind(ConsoleDeviceGetDefault,CONSOLE_SHELL_POSITION));
   
   {And start the Console logging}
   CONSOLE_REGISTER_LOGGING:=True;
   CONSOLE_LOGGING_POSITION:=CONSOLE_POSITION_BOTTOMRIGHT;
   LoggingConsoleDeviceAdd(ConsoleDeviceGetDefault);
   LoggingDeviceSetDefault(LoggingDeviceFindByType(LOGGING_TYPE_CONSOLE));
   LoggingOutput('This is a log window, try connecting a USB device');
   case BoardGetType of
    BOARD_TYPE_RPI4B,BOARD_TYPE_RPI400:begin
      LoggingOutput('');
      LoggingOutput('Important Note:');
      LoggingOutput(' This is a Raspberry Pi 4 so USB');
      LoggingOutput(' support is only currently active');
      LoggingOutput(' if you power the Pi via the 40 pin');
      LoggingOutput(' header and connect USB devices to');
      LoggingOutput(' the USB-C connector.');
      LoggingOutput('');
     end;
    BOARD_TYPE_RPI_COMPUTE4:begin
      {Nothing, CM4 USB is supported via the DWCOTG host controller}
     end;
   end;  
  end;
  
 {Halt the Main thread if it ever returns here}
 ThreadHalt(0); 
end.