# AutoHotkey script to Open or Show Apps


This [AutoHotkey](https://www.autohotkey.com/) script is to Open or Show (if it is already opened) the desires Apps using the configured shortcuts key (hotkeys) you want.

There are two **utility functions** for this porpouse: 

**a)** `OpenOrShowAppBasedOnExeName(AppAddress)` //Useful for regular Window Apps

**b)** `OpenOrShowAppBasedOnWindowTitle(WindowTitleWord, AppAddress)`  //Specially useful for Chrome Apps and Chrome Shortcuts


## Configuration Examples

`F7:: OpenOrShowAppBasedOnExeName("C:\Windows\System32\SnippingTool.exe")`

`F8:: OpenOrShowAppBasedOnWindowTitle("Gmail", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --app=https://mail.google.com/mail/")`



## Installation Steps

1- Download and install the AutoHotkey App [here.](https://autohotkey.com/download/ahk-install.exe)

2- Download the file ["AutoHotkey-script-Open-Show-Apps.ahk"](https://raw.githubusercontent.com/JuanmaMenendez/AutoHotkey-script-Open-Show-Apps/master/AutoHotkey-script-Open-Show-Apps.ahk) and remove the .txt extention

3- Edit the file (Notepad works) and create your shortcuts setting your [keys](https://autohotkey.com/docs/KeyList.htm) and using the above utility functions

4- Execute the script (Double click on it)

5- (Optional) In order to automatically load this script on System Start Up, create a Window desktop shortcut for it and move it into the Windows startup folder, located exactly at "*%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup*"

6- Enjoy
