# AutoHotkey script to Open or Show Apps


This [AutoHotkey](https://www.autohotkey.com/) script is to Open, Restore or Minimize (if it is already opened) the desired Apps, using the shortcuts key (hotkeys) that you want to set.<br /> 
It works well with regular Window Apps, Chrome Shortcuts and Chrome Apps.

There are two **utility functions** for this purpose: 

**a)** `OpenOrShowAppBasedOnExeName(AppAddress)` //Useful for regular Window Apps

**b)** `OpenOrShowAppBasedOnWindowTitle(WindowTitleWord, AppAddress)`  //Specially useful for Chrome Apps and Chrome Shortcuts


## Configuration Examples

`F7:: OpenOrShowAppBasedOnExeName("C:\Windows\System32\SnippingTool.exe")`

`F8:: OpenOrShowAppBasedOnWindowTitle("Gmail", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --app=https://mail.google.com/mail/")`



## Installation Steps

1- Download and install the AutoHotkey App [here](https://autohotkey.com/download/ahk-install.exe)

2- Download the script file [here](https://github.com/JuanmaMenendez/AutoHotkey-script-Open-Show-Apps/releases/latest/download/Open-Show-Apps.ahk)

3- Edit the script (Notepad works) and create your shortcuts, setting your [keys](https://autohotkey.com/docs/KeyList.htm) and the address to your desired App by using the above utility functions

For example, this line `F7:: OpenOrShowAppBasedOnExeName("C:\Windows\System32\SnippingTool.exe")`  will open the Window's SnippingTool when you press the *F7* key

4- Execute the script (Double click on it)

5- (Optional) In order to automatically load this script on System Start Up, create a Window desktop shortcut for it and move it into the Windows startup folder, located exactly at "*%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup*"

6- Enjoy


## Extras

Additionally, pressing Alt + ` (key above Tab key) you can switch between open Windows of the same type.
