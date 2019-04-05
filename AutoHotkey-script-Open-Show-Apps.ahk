
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


; F3 - Open||Show Everything
F3:: OpenOrShowAppBasedOnExeName("Everything.exe", "C:\Program Files\Everything\Everything.exe")


; F6 - Open||Show Station
F6:: OpenOrShowAppBasedOnExeName("Station.exe", "C:\Users\Juanma\AppData\Local\browserX\Station.exe")	
		

; F7 - Open||Show Clover
F7:: OpenOrShowAppBasedOnExeName("Clover.exe", "C:\Program Files (x86)\Clover\Clover.exe")

	
; F8 - Open||Show  Trello chrome shortcut
F8:: OpenOrShowAppBasedOnWindowTitle("Trello", "C:\Program Files (x86)\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=dpmjamchlbolhdobgpgiiflcmadekkfh")

	

    