
; This AutoHotkey script allows switching between open Windows of the current active App or Chrome Website Shortcut
; For regular Windows Apps it checks the app Process and Class
; For Chrome Apps and Chrome Website Shortcuts it checks the window's title (Eg: New Document - Word )


/* ;
*****************************
***** UTILITY FUNCTIONS *****
*****************************
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
***********************************
***** SHORTCUTS CONFIGURATION *****
***********************************
*/

; Alt + ` - hotkey to activate NEXT Window of same type of the current App or Chrome Website Shortcut
!`::
WinGet, activeProcessName, ProcessName, A

if (activeProcessName = "chrome.exe") {
    HandleChromeWindowsWithSameTitle()
} else {
    HandleWindowsWithSameProcessAndClass(activeProcessName)
}
Return



