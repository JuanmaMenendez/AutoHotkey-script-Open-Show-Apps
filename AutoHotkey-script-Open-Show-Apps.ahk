
; This AutoHotkey script is to Open or Show (if it is already opened) the desires Apps using the configured shortcuts key (hotkeys)
; There are two functions for this: 
;
; a) OpenOrShowAppBasedOnExeName(AppAddress) 
; b) OpenOrShowAppBasedOnWindowTitle(WindowTitleWord, AppAddress)  //Specially useful for Chrome Apps and Chrome Shortcuts 



/* ;
*****************************
***** UTILITY FUNCTIONS *****
*****************************
*/


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




/* ;
***********************************
***** SHORTCUTS CONFIGURATION *****
***********************************
*/


; F7 - Open||Show "SnippingTool"
F7:: OpenOrShowAppBasedOnExeName("C:\Windows\System32\SnippingTool.exe")			

	
; F8 - Open||Show  "Gmail as Chrome App"
F8:: OpenOrShowAppBasedOnWindowTitle("Gmail", "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --app=https://mail.google.com/mail/")


    
