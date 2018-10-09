#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.

#SingleInstance, Force

; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


SetWorkingDir c:\Users\ST-ASUS\source\repos\AhkAndBat\
customWorkingDir = c:\Users\ST-ASUS\source\repos\AhkAndBat\


rdpWork=wks-


#Include c:\Users\ST-ASUS\source\repos\AhkAndBat\  
#Include Variables.ahk
#Include C:\Program Files (Portable)\AHK-scripts\Variables.custom.ahk
#Include Main.ahk


#o::
{
	Run %appPathNpp% "C:\Program Files (Portable)\AHK-scripts\Default.ahk"

	Send ^s ; save current file (ctrl+s)
	
	Run "C:\Program Files (Portable)\AHK-scripts\Default.ahk"

	#SingleInstance, Force ; skips the dialog box and replaces the old instance automatically
	
	return
}
