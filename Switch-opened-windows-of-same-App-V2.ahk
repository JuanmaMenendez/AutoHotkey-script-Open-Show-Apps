#Requires AutoHotkey v2.0

; This AutoHotkey script allows switching between open Windows of the current active App or Chrome Website Shortcut
; For regular Windows Apps it checks the app Process and Class
; For Chrome Apps and Chrome Website Shortcuts it checks the window's title (Eg: New Document - Word )


; Extracts the application title from the window's full title
ExtractAppTitle(FullTitle) {
    return SubStr(FullTitle, InStr(FullTitle, " ", false, -1) + 1)
}

; Switch a "Chrome App or Chrome Website Shortcut" open windows based on the same application title
HandleChromeWindowsWithSameTitle() {
    FullTitle := WinGetTitle("A")
    AppTitle := ExtractAppTitle(FullTitle)
    SetTitleMatchMode 2
    windowsWithSameTitleList := WinGetList(AppTitle)
    WinActivate "ahk_id " . windowsWithSameTitleList[windowsWithSameTitleList.Length]
}

; Switch "App" open windows based on the same process and class
HandleWindowsWithSameProcessAndClass(ActiveProcessName) {
    activeClass := WinGetClass("A")
    SetTitleMatchMode 2
    windowsListWithSameProcessAndClass := WinGetList("ahk_exe " . ActiveProcessName . " ahk_class " . activeClass)
    WinActivate "ahk_id " . windowsListWithSameProcessAndClass[windowsListWithSameProcessAndClass.Length]
}

/* ;
********************************************
***** YOUR SHORTCUTS CONFIGURATION *****
********************************************
*/

; Alt + ` - hotkey to activate NEXT Window of same type of the current App or Chrome Website Shortcut
!`::
{
    ActiveProcessName := WinGetProcessName("A")

    if (ActiveProcessName = "chrome.exe") {
        HandleChromeWindowsWithSameTitle()
    } else {
        HandleWindowsWithSameProcessAndClass(ActiveProcessName)
    }
}