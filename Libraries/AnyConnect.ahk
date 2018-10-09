; Create a shortcut to this file in Windows for each AnyConnect VPN configuration you need
; Each shortcut can have a different host, user, and pass defined (3 command line args)
; Usage: AutoHotKey.exe AnyConnect.ahk hostname username password
#SingleInstance force

if 0 < 3 ; The left side of a non-expression if-statement is always the name of a variable.
{
  MsgBox This script requires at least 3 incoming parameters but it only received %0%.
  ExitApp
}

vpn=%1%
username=%2%
password=%3%
group=%4%

EnvGet,localAppData,LOCALAPPDATA
pathToAnyConnect=C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe
pathToPreferencesXml=%localAppData%\Cisco\Cisco AnyConnect Secure Mobility Client\preferences.xml

Process,Close,vpnui.exe
Sleep,250

/*
FileDelete,%pathToPreferencesXml%
FileAppend,
(
<?xml version="1.0" encoding="UTF-8"?>
<AnyConnectPreferences>
<DefaultUser>%username%</DefaultUser>
<DefaultSecondUser></DefaultSecondUser>
<ClientCertificateThumbprint></ClientCertificateThumbprint>
<ServerCertificateThumbprint></ServerCertificateThumbprint>
<DefaultHostName>%vpn%</DefaultHostName>
<DefaultHostAddress></DefaultHostAddress>
<DefaultGroup>%group%</DefaultGroup>
<ProxyHost></ProxyHost>
<ProxyPort></ProxyPort>
<SDITokenType>none</SDITokenType>
<ControllablePreferences></ControllablePreferences>
</AnyConnectPreferences>
), %pathToPreferencesXml%
*/

Run,%pathToAnyConnect%,,,pid
WinWaitActive,ahk_pid %pid% 
Sleep,250

ControlGetText,ButtonText,Button1
if ButtonText<>Connect
{
  MsgBox,Connect button not found. Automation aborted.
  Exit
}

ControlClick,Button1

WinWaitActive,Cisco AnyConnect | %vpn%,Password
Sleep,500


/*
ControlSetText,Edit1,%username%
ControlSetText,Edit2,%password%
*/
;Send,%password%{Enter}
Send ^!a ;Activate Kee Pass Auto-Type Ctrl+Alt+A

; Check for a screen with an Accept button and a title of "Cisco AnyConnect" (but not "Cisco AnyConnect Secure (Mobility Client)...")
; If found, click Accept.  Timeout after 8 seconds.
WinWaitActive,Cisco AnyConnect,Accept,8
if not ErrorLevel
{
  Sleep,100
  ControlClick,Button1
}

Exit
