<h1 align="center">
   <img src="https://github.com/JuanmaMenendez/AutoHotkey-script-Open-Show-Apps/raw/master/logo.png" alt="AutoHotkey-script-Open-Show-Apps" width="650px">    
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

**2)** Ability to switch between open windows of the same App pressing **Alt + `** (key above Tab key) like in Mac OS. You can switch for example between multiple Chrome open windows 

<br /> 


## Utility Functions

**a)** `OpenOrShowAppBasedOnExeName(AppAddress)` - Useful for **regular Window Apps**

Example: `F7:: OpenOrShowAppBasedOnExeName("C:\Windows\System32\SnippingTool.exe")`

<br>

**b)** `OpenOrShowAppBasedOnWindowTitle(WindowTitleWord, AppAddress)` - Specially useful for **Chrome Apps** and [**Chrome Website Shortcuts**](https://www.laptopmag.com/articles/how-to-create-desktop-shortcuts-for-web-pages-using-chrome) 

Example: `F8:: OpenOrShowAppBasedOnWindowTitle("Gmail", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --app=https://mail.google.com/mail/")`

<br>

**c)** `OpenOrShowAppBasedOnAppModelUserID(AppTitle, AppModelUserID)` - Useful for **Windows Store Apps** (contained in the "shell:AppsFolder\")

Example: `F9:: OpenOrShowAppBasedOnAppModelUserID("Calculator", "Microsoft.WindowsCalculator_8wekyb3d8bbwe!App")`
 
<br /> 


## Installation

1- Download and install the AutoHotkey App [here](https://www.autohotkey.com/)

2- Download the script file [here](https://github.com/JuanmaMenendez/AutoHotkey-script-Open-Show-Apps/releases/latest/download/AutoHotkey-script-Open-Show-Apps.ahk)

3- Edit the "SHORTCUTS CONFIGURATION" section in the script file (Notepad works) and create your shortcuts, setting your [keys](https://autohotkey.com/docs/KeyList.htm) and the address to your desired App by using the above [utility functions](https://github.com/JuanmaMenendez/AutoHotkey-script-Open-Show-Apps#utility-functions)

For example, this line `F7:: OpenOrShowAppBasedOnExeName("C:\Windows\System32\SnippingTool.exe")`  will open the Window's SnippingTool when you press the *F7* key

4- Execute the script (Double click on it)

5- (Optional) In order to automatically load this script on System Start Up, you have to create a Window desktop shortcut for it and move it into the Windows startup folder, located exactly at "*%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup*"

6- Enjoy

<br /> 


## Extras

### Find AppUserModelID

To get the AppUserModelID of a Windows Store App, you can use this [comprehensive guide](https://jcutrer.com/windows/find-aumid).
