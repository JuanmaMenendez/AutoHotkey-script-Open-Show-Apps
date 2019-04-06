# AutoHotkey script to Open or Show Apps


This [AutoHotkey](https://www.autohotkey.com/) script is to Open or Show (if it is already opened) the desires Apps using the configured shortcuts key (hotkeys) you want.
There are two functions for this: 


**a)** `OpenOrShowAppBasedOnExeName(AppExeName, AppAddress)`

**b)** `OpenOrShowAppBasedOnWindowTitle(WindowTitleWord, AppAddress)`  //Useful specially for Chrome Apps and Chrome Shortcuts


## Examples

`F3:: OpenOrShowAppBasedOnExeName("Everything.exe", "C:\Program Files\Everything\Everything.exe")`

`F8:: OpenOrShowAppBasedOnWindowTitle("Trello", "C:\Program Files (x86)\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=dpmjamchlbolhdobgpgiiflcmadekkfh")`




## Instalation Steps

1- Download and install the AutoHotkey App [here.](https://autohotkey.com/download/ahk-install.exe)

2- Download the file "AutoHotkey-script-Open-Show-Apps.ahk"

3- Execute the script (Double click)

4- (Optional) In order to automatically load this script on System Start Up, create a windows shortcut for it and put it in the Windows startup folder, located exactly at "*%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup*".

5- Enjoy
