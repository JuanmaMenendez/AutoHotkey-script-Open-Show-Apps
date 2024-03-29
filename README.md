<h1 align="center">
   <img src="https://github.com/JuanmaMenendez/AutoHotkey-script-Open-Show-Apps/raw/master/logo.png" alt="AutoHotkey-script-Open-Show-Switch-windows-Apps" width="650px">    
</h1>

<h3 align="center"><a href="https://www.autohotkey.com/" target="_blank">AutoHotkey</a> script to Open, Restore or Minimize any Apps using the hotkeys you want</h3>
<br /> 

<div align="center">
    <a href="https://autohotkey.com">
        <img src="https://img.shields.io/badge/AutoHotkey-1.1-blue.svg" alt="AutoHotkey 1.1" /></a>    
    <a href="https://GitHub.com/JuanmaMenendez/AutoHotkey-script-Open-Show-Apps/graphs/commit-activity"> 
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" alt="Maintenance"></a>
    <img src="https://img.shields.io/badge/contributions-welcome-orange.svg" alt="Contributions Welcome">
    <a href="https://github.com/JuanmaMenendez/AutoHotkey-script-Open-Show-Apps/blob/master/LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License"></a>
</div>


## Features

**1)** Support for *Windows regular Apps*, *Windows Store Apps*, *Chrome Apps* and [*Chrome Website Shortcuts*](https://www.laptopmag.com/articles/how-to-create-desktop-shortcuts-for-web-pages-using-chrome) (useful to directly open any web page)

**2)** Ability to switch between open windows of the same App by pressing **Alt + `** (key above Tab key) similar to how it works in macOS. You can switch for example between multiple Chrome open windows 

<br /> 


## How it works

You set a hotkey and a corresponding utility function responsible to execute the action.

There are three utility functions you can use for this:


**a)** `OpenOrShowAppBasedOnExeName(AppAddress)` - Useful for **regular Window Apps**

Example: `F7:: OpenOrShowAppBasedOnExeName("C:\Windows\notepad.exe")`

<br>

**b)** `OpenOrShowAppBasedOnWindowTitle(WindowTitleWord, AppAddress)` - Specially useful for **Chrome Apps** and [**Chrome Website Shortcuts**](https://www.laptopmag.com/articles/how-to-create-desktop-shortcuts-for-web-pages-using-chrome) 

Example: `F8:: OpenOrShowAppBasedOnWindowTitle("Gmail", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --app=https://mail.google.com/mail/")`

<br>

**c)** `OpenOrShowAppBasedOnAppModelUserID(AppTitle, AppModelUserID)` - Useful for **Windows Store Apps** (contained in the "shell:AppsFolder\")

Example: `F9:: OpenOrShowAppBasedOnAppModelUserID("Calculator", "Microsoft.WindowsCalculator_8wekyb3d8bbwe!App")`

Note: To get the AppUserModelID of a Windows Store App, you can use this [comprehensive guide](https://jcutrer.com/windows/find-aumid).


<br /> 


## Installation and Usage

1- Download and install the AutoHotkey App v1.1 [here](https://www.autohotkey.com/) <br />
Note: v1.1 is still working fine. Pull Requests to refactor the scripts for v2 compatibility are welcome.

2- Download the script file [here](https://github.com/JuanmaMenendez/AutoHotkey-script-Open-Show-Apps/releases/latest/download/Open-Apps-and-Switch-opened-windows.ahk)

3- Edit the _"*** YOUR SHORTCUTS CONFIGURATION ***"_ section in the script file (Notepad works) and create/modify your shortcuts, setting your [hotkeys](https://autohotkey.com/docs/KeyList.htm) and the path to your desired App by using the above [utility functions](https://github.com/JuanmaMenendez/AutoHotkey-script-Open-Show-Apps#how-it-works)

For example, this line `F7:: OpenOrShowAppBasedOnExeName("C:\Windows\notepad.exe")`  will open the Window's Notepad App when you press the *F7* key

4- Execute the script (Double click on it)

5- (Optional) To automatically load this script on System Startup, you have to create a Windows desktop shortcut for it and move it into the Windows startup folder, located precisely at "*%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup*"

6- Enjoy

<br /> 
