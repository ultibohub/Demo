program UltiboDemoRPi2;

{Ultibo demo project for Raspberry Pi 2B                                       }
{                                                                              }
{For the Raspberry Pi A/B/A+/B+/Zero version see the file UltiboDemoRPi.lpr    }
{For the Raspberry Pi 3B/3B+/3A+/Zero2W version see the file UltiboDemoRPi3.lpr}
{For the Raspberry Pi 4B/400 version see the file UltiboDemoRPi4.lpr           }
{                                                                              }
{To compile this project select Build, Run from the Lazarus menu               }
{                                                                              }
{History: 1.0.0  - Initial release                                             }
{         1.0.1  - Add Raspberry Pi 3B support                                 }
{         1.0.2  - Add USB fixes for Raspberry Pi A/A+/Zero                    } 
{         1.0.3  - Update to use ConsolePeekKey and ConsoleGetKey functions    }
{         1.0.6  - Update to add detection of Raspberry Pi 3B+                 }
{         1.0.7  - Update to include LAN78XX driver for Raspberry Pi 3B+       }
{         1.0.8  - Update to add detection of Raspberry Pi 3A+                 }
{         1.0.9  - Add Raspberry Pi 4B/400 support                             }
{         1.0.10 - Update to include eMMC support for Compute Module           }
{         1.0.11 - Add Raspberry Pi Zero 2 W support                           }
{         1.0.12 - Update to FreePascal 3.2.2                                  }
{         1.0.13 - Update to include USBCDCEthernet driver for QEMU            }
{         1.0.14 - Update to include ShellNetwork unit                         }
{         1.0.15 - Update to include HIDTouch and HIDJoystick units            }

{$mode delphi} {Default to Delphi compatible syntax}
{$H+}          {Default to AnsiString}

uses
 RaspberryPi2,
 GlobalConfig,
 GlobalConst,
 Platform,
 Threads,
 DemoMain,
 Logging,
 Console,
 ConsoleShell,
 USBCDCEthernet;
 
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
  end;
  
 {Halt the Main thread if it ever returns here}
 ThreadHalt(0); 
end.