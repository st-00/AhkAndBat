#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.

#SingleInstance, Force

; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;#Include  Variables.ahk
;#Include C:\Program Files (Portable)\AHK-scripts\Variables.custom.ahk

#Include  Shorcuts.apps.ahk



;$^F5::
^#t::
{
	Send ^!a
	;Send ^{F5} 
	;Vs_BeforeBuild()
	return
}


Vs_BeforeBuild(){
	WinWait, Login error,,120
	WinClose, Login error,,120
}


