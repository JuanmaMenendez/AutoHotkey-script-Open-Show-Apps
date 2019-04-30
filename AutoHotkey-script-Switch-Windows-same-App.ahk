
; This AutoHotkey script is to switch between open Windows of the same type and same App (.exe)
; The "type" checking is based on the App's Title convention that stipulates that the App name should be at the end of the Window title (Eg: New Document - Word )
; It works well with regular Window Apps, Chrome Shortcuts and Chrome Apps


/* ;
*****************************
***** UTILITY FUNCTIONS *****
*****************************
*/


ExtractAppTitle(FullTitle)
{	
	AppTitle := SubStr(FullTitle, InStr(FullTitle, " ", false, -1) + 1)
	Return AppTitle
}



/* ;
***********************************
***** SHORTCUTS CONFIGURATION *****
***********************************
*/


; Alt + ` -  Activate NEXT Window of same type (title checking) of the current APP
!`::
WinGet, ActiveProcess, ProcessName, A
WinGet, OpenWindowsAmount, Count, ahk_exe %ActiveProcess%

If OpenWindowsAmount = 1  ; If only one Window exist, do nothing
    Return
	
Else
	{
		WinGetTitle, FullTitle, A
		AppTitle := ExtractAppTitle(FullTitle)

		SetTitleMatchMode, 2		
		WinGet, WindowsWithSameTitleList, List, %AppTitle%
		
		If WindowsWithSameTitleList > 1 ; If several Window of same type (title checking) exist
		{
			WinActivate, % "ahk_id " WindowsWithSameTitleList%WindowsWithSameTitleList%	; Activate next Window	
		}
	}
Return
