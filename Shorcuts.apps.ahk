#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



#n::
{
	Run %appPathNpp%
	return
}


^!k::
{
	Run %appPathKeePass%
	return
}

#t::
{
	Run, mstsc.exe /v:10.26.0.62
	return
}

#y::
{
	Run, mstsc.exe /v:%rdpWork%
	return
}

#u::
{
	Run %customWorkingDir%\Libraries\AnyConnect.ahk "param1" "param2" "param3" "param4"
	return
}



#m::
{
	MsgBox test #m hotkey: %testVar1%
	return
}