
/*
1- This AutoHotkey script enables you to open, restore, or minimize desired "Applications, Chrome Apps or Chrome Web Shortcuts", using your configured shortcuts key (hotkeys)

How it works ?

You set a hotkey and a corresponding utility function responsible to execute the action.

 There are three utility functions you can use for this:

 a) OpenOrShowAppBasedOnExeName(AppAddress) //Useful for regular Window Apps

 b) OpenOrShowAppBasedOnWindowTitle(WindowTitleWord, AppAddress)  //Specially useful for Chrome Apps and Chrome Shortcuts

 c) OpenOrShowAppBasedOnAppModelUserID(AppTitle, AppModelUserID) //Useful for Windows Store Apps (contained in the "shell:AppsFolder\")


2- Additionally, pressing Alt + ` (key above Tab key) you can switch between open Windows of the current active App or Chrome Website Shortcut
*/


/* ;
*******************************************************************
*****  open, restore, or minimize APP - UTILITY FUNCTIONS *****
*******************************************************************
*/


#WinActivateForce ; Prevent task bar buttons from flashing when different windows are activated quickly one after the other.



; AppAddress: The address to the .exe (Eg: "C:\Windows\System32\SnippingTool.exe")

OpenOrShowAppBasedOnExeName(AppAddress)
{
	AppExeName := SubStr(AppAddress, InStr(AppAddress, "\", false, -1) + 1)

	IfWinExist ahk_exe %AppExeName%
	{
		IfWinActive
		{
			WinMinimize
			Return
		}
		else
		{
			WinActivate
			Return
		}
	}
	else
	{
		Run, %AppAddress%, UseErrorLevel
        If ErrorLevel
        {
            Msgbox, File %AppAddress% Not Found
            Return
        }
		else
		{
			WinWait, ahk_exe %AppExeName%
			WinActivate ahk_exe %AppExeName%
			Return
		}
	}
}


; WindowTitleWord: Usually the word at the end of the app window title (Eg: in: "New Document - Word" will be "Word")
; AppAddress: The address to the .exe (Eg: "C:\Windows\System32\SnippingTool.exe")

OpenOrShowAppBasedOnWindowTitle(WindowTitleWord, AppAddress)
{
	SetTitleMatchMode, 2

    IfWinExist, %WindowTitleWord%
    {
		IfWinActive
		{
			WinMinimize
			Return
		}
		else
		{
			WinActivate
			Return
		}
	}
    else
    {
        Run, %AppAddress%, UseErrorLevel
        If ErrorLevel
        {
            Msgbox, File %AppAddress% Not Found
            Return
        }
		else
		{
			WinActivate
			Return
		}
    }
}



; AppTitle: Usually the word at the end of the app window title(Eg: in: "New Document - Word" will be "Word")
; AppModelUserID: A comprehensive guide on how to find the AppModelUserID of a windows store app can be found here: https://jcutrer.com/windows/find-aumid

OpenOrShowAppBasedOnAppModelUserID(AppTitle, AppModelUserID)
{
	SetTitleMatchMode, 2

    IfWinExist, %AppTitle%
    {
		IfWinActive
		{
			WinMinimize
			Return
		}
		else
		{
			WinActivateBottom %AppTitle%
		}
	}
    else
    {
        Run, shell:AppsFolder\%AppModelUserID%, UseErrorLevel
        If ErrorLevel
        {
            Msgbox, File %AppModelUserID% Not Found
            Return
        }
    }
}



/* ;
***************************************************
***** Switch open window  - UTILITY FUNCTIONS *****
***************************************************
*/

; Extracts the application title from the window's full title
ExtractAppTitle(FullTitle) {
    return SubStr(FullTitle, InStr(FullTitle, " ", false, -1) + 1)
}

; Switch a "Chrome App or Chrome Website Shortcut" open windows based on the same application title
HandleChromeWindowsWithSameTitle() {
    WinGetTitle, FullTitle, A
    AppTitle := ExtractAppTitle(FullTitle)
    SetTitleMatchMode, 2
    WinGet, windowsWithSameTitleList, List, %AppTitle%
    WinActivate, % "ahk_id " windowsWithSameTitleList%windowsWithSameTitleList%
}

; Switch "App" open windows based on the same process and class
HandleWindowsWithSameProcessAndClass(activeProcessName) {
    WinGetClass, activeClass, A
    SetTitleMatchMode, 2
    WinGet, windowsListWithSameProcessAndClass, List, ahk_exe %activeProcessName% ahk_class %activeClass%
    WinActivate, % "ahk_id " windowsListWithSameProcessAndClass%windowsListWithSameProcessAndClass%
}


/* ;
********************************************
***** YOUR SHORTCUTS CONFIGURATION *****
********************************************
*/


; F7 - Open "Notepad"
F7:: OpenOrShowAppBasedOnExeName("C:\Windows\notepad.exe")

/* F8 - Open "Gmail as Chrome App"
 Note: if you have your chrome.exe located in the "Program Files (x86)" folder instead of "Program Files" use:
 F8:: OpenOrShowAppBasedOnWindowTitle("Gmail", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --app=https://mail.google.com/mail/")
*/
F8:: OpenOrShowAppBasedOnWindowTitle("Gmail", "C:\Program Files\Google\Chrome\Application\chrome.exe --app=https://mail.google.com/mail/")

; F9 - Open "Windows store Calculator app"
; Note: to get a Windows store app aumid check "https://jcutrer.com/windows/find-aumid"
F9:: OpenOrShowAppBasedOnAppModelUserID("Calculator", "Microsoft.WindowsCalculator_8wekyb3d8bbwe!App")


; Alt + ` - hotkey to activate NEXT Window of same type of the current App or Chrome Website Shortcut
!`::
WinGet, activeProcessName, ProcessName, A

if (activeProcessName = "chrome.exe") {
    HandleChromeWindowsWithSameTitle()
} else {
    HandleWindowsWithSameProcessAndClass(activeProcessName)
}
Return