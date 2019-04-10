
; This AutoHotkey script is to Open or Show (if it is already opened) the desires Apps using the configured shortcuts key (hotkeys)
; There are two functions for this: 
;
; a) OpenOrShowAppBasedOnExeName(AppExeName, AppAddress) 
; b) OpenOrShowAppBasedOnWindowTitle(WindowTitleWord, AppAddress)  //Useful specially for Chrome Apps and Chrome Shortcuts 



/* ;
*****************************
***** UTILITY FUNCTIONS *****
*****************************
*/


OpenOrShowAppBasedOnExeName(AppExeName, AppAddress)
{
	IfWinExist ahk_exe %AppExeName%
	{
		WinActivate, ahk_exe %AppExeName%
		Return
	}
	else
	{	
	
		Run, %AppAddress%,, UseErrorLevel
        If ErrorLevel
        {
            Msgbox, File %AppAddress% Not Found
            Return
        }
		else
		{
			WinWait, ahk_exe %AppExeName%
			WinActivate, ahk_exe %AppExeName%			
			Return
		}			
		
	}
}



OpenOrShowAppBasedOnWindowTitle(WindowTitleWord, AppAddress)
{

	SetTitleMatchMode, 2

    IfWinExist, %WindowTitleWord%
    {    
		WinActivate
		Return
	}
    else
    {
        Run, %AppAddress%,, UseErrorLevel
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



/* ;
***********************************
***** SHORTCUTS CONFIGURATION *****
***********************************
*/


; F4 - Open||Show  "YouTube as Chrome App"
F4:: OpenOrShowAppBasedOnWindowTitle("YouTube", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --app=https://www.youtube.com/")


; F6 - Open||Show "File Explorer"
F6:: OpenOrShowAppBasedOnExeName("explorer.exe", "C:\Windows\explorer.exe")


; F7 - Open||Show "SnippingTool"
F7:: OpenOrShowAppBasedOnExeName("SnippingTool.exe", "C:\Windows\System32\SnippingTool.exe")			

	
; F8 - Open||Show  "Gmail as Chrome App"
F8:: OpenOrShowAppBasedOnWindowTitle("Gmail", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --app=https://mail.google.com/mail/")


    
