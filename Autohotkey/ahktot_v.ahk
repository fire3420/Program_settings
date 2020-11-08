
full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try ; leads to having the script re-launching itself as administrator
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}
SetCapsLockState, AlwaysOff

;~ #SingleInstance force
#InstallKeybdHook
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;autoset1;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;#include imeCheck.ahk 

#include %A_ScriptDir%/WPXA.ahk
;~ #include %A_ScriptDir%/enmode.ahk
SetTitleMatchMode, 2
GroupAdd, MATFIG, Figure ; Add only Internet Explorer windows to this group.
GroupAdd, KAKAO, ahk_exe KakaoTalk.exe
GroupAdd, PPT, ahk_class PPTFrameClass
GroupAdd, EXCEL, ahk_class XLMAIN
GroupAdd, SCITE, ahk_exe SciTE.exe
GroupAdd, IEX, ahk_class IEFrame
GroupAdd, WORD, ahk_class OpusApp
GroupAdd, GCAL, Google 스프레드시트
GroupAdd, GDOC, Google 문서
GroupAdd, AHKgg, ahk_exe AutoHotkey.exe
GroupAdd, HWP, ahk_exe Hwp.exe
GroupAdd, ADOBERD, ahk_class AcrobatSDIWindow
GroupAdd, SNOTE, Samsung Notes
GroupAdd, TOTCMD, ahk_class TTOTAL_CMD
GroupAdd, DOUBCMD, ahk_exe doublecmd.exe
GroupAdd, ALPDF, ahk_exe ALPDF.exe
GroupAdd, MSTC, ahk_exe mstsc.exe
GroupAdd, SCT, ahk_exe SourceTree.exe
GroupAdd, PAINT, ahk_class MSPaintApp
GroupAdd, NOTEPAD, ahk_class Notepad
GroupAdd, MATLAB, ahk_exe matlab.exe
GroupAdd, VMWARE, ahk_exe vmplayer.exe
GroupAdd, SPYDER, Spyder
GroupAdd, CODE, ahk_exe Code.exe
GroupAdd, CODEINSIDE, ahk_exe Code - Insiders.exe
GroupAdd, CODIUM, ahk_exe VSCodium.exe
GroupAdd, POWERSHELL, ahk_exe powershell.exe


toEncode :=	[" ","%", """", "#", "&"
 , "/", ":", ";", "<"
 , "=", ">", "?", "@"
 , "[", "\", "]", "^"
 , "``", "{", "|", "}", "~"]

e :=	["+","%25", "%22", "%23", "%26"
 , "%2F", "%3A", "%3B", "%3C"
 , "%3D", "%3E", "%3F", "%40"
 , "%5B", "%5C", "%5D", "%5E"
 , "%60", "%7B", "%7C", "%7D", "%7E"]


return ; End of autoexecute section.


#if GetKeyState("Capslock","P")
$q::
	SendInput, {Left}
	SetCapsLockState , AlwaysOff
return

$+t::
SetTitleMatchMode, 2
if WinActive("Tasks"){
	SendInput, ^!{n}
}
SetCapsLockState , AlwaysOff
return


$+3::
SetTitleMatchMode, 2
if WinActive("Google 캘린더"){
	Keywait, Shift
	SendInput,!^{p}
}
SetCapsLockState , AlwaysOff
return


$f::
	
	if WinActive("ahk_exe POWERPNT.EXE"){
	
		CoordMode, Pixel, Client
		CoordMode, Mouse, Client
		WinGetPos, X, Y, Width, Height, ahk_exe POWERPNT.EXE
		xx:=Width-50
		yy:=Height/2
		MouseClick, left, xx, yy
		Send, {PgUp}
	}
	else{
		Send, {PgUp}
	}
	SetCapsLockState , AlwaysOff
	
return

$+f::
	Send, +{PgUp}
	SetCapsLockState , AlwaysOff
return
$+v::
	Send, +{PgDn}
	SetCapsLockState , AlwaysOff
return


$v::
	;~ Keywait Capslock
	if WinActive("ahk_exe POWERPNT.EXE"){
	
		CoordMode, Pixel, Client
		CoordMode, Mouse, Client
		WinGetPos, X, Y, Width, Height, ahk_exe POWERPNT.EXE
		xx:=Width-50
		yy:=Height/2
		MouseClick, left, xx, yy
		Send, {PgDn}
	}
	else{
		Send, {PgDn}
	}

	SetCapsLockState , AlwaysOff
		
	;~ Send, {Capslock}
	;~ SetCapsLockState , AlwaysOff
return

$d::
	SetTitleMatchMode, 2

	Loop, 5{
    Click, WheelUp
	}
	SetCapsLockState , AlwaysOff
return

$c::
	SetTitleMatchMode, 2
	
	Loop, 5{
    Click, WheelDown
	}
	SetCapsLockState , AlwaysOff
return

$g::
	;~ Keywait, CapsLock
	SetTitleMatchMode, 2
	SetCapsLockState , AlwaysOff
	if WinActive("ahk_exe Hwp.exe"){
		Send, ^{PgUp}
	}
	else{
		Send, ^{Home}
	}
	SetCapsLockState , AlwaysOff
	
	
return


$b::
;~ Keywait, CapsLock
	SetTitleMatchMode, 2
	SetCapsLockState , AlwaysOff
	if WinActive("ahk_exe Hwp.exe"){
		Send, ^{PgDn}
	}
	else{
		Send, ^{End}
	}
		

	SetCapsLockState , AlwaysOff


	;~ Send, {Capslock}
	;~ SetCapsLockState , AlwaysOff
return


$w::
	SendInput, {Down}
	SetCapsLockState , AlwaysOff
return

$+w::
	Sendinput, {Lshift Down}{Down}{Lshift Up}
	SetCapsLockState , AlwaysOff
return

$e::
	SendInput, {Right}
	SetCapsLockState , AlwaysOff
return

$+r::
	SendInput, {Lshift Down}{Right}{Lshift Up}
	SetCapsLockState , AlwaysOff
return

$+q::
	SendInput, {Lshift Down}{Left}{Lshift Up}
	SetCapsLockState , AlwaysOff

return

$^w::
	Sendinput, {LCtrl Down}{Right}{LCtrl Up}
	SetCapsLockState , AlwaysOff
return


$2::
	SendInput, {Up}
	SetCapsLockState , AlwaysOff
return


$+2::
	Sendinput, {Lshift Down}{Up}{Lshift Up}
	SetCapsLockState , AlwaysOff
return

$#q::
	SendInput, ^{Left}
	SetCapsLockState , AlwaysOff
return

$#e::
	SendInput, ^{Right}
	SetCapsLockState , AlwaysOff
return



$h::
	SendInput, {Left}
	SetCapsLockState , AlwaysOff
return

$+h::
	SendInput, +{Left}
	SetCapsLockState , AlwaysOff
return

$^+h::
	SendInput, ^+{Left}
	SetCapsLockState , AlwaysOff
return


$j::

	SendInput, {Down}
	SetCapsLockState , AlwaysOff

return


$+j::
	Sendinput, {Lshift Down}{Down}{Lshift Up}
	SetCapsLockState , AlwaysOff
return

$^j::
	Sendinput, {LCtrl Down}{Down}{LCtrl Up}
	SetCapsLockState , AlwaysOff
return

$^+j::
	Sendinput, {Lshift Down}{LCtrl Down}{Down}{Lshift Up}
	SetCapsLockState , AlwaysOff
return

$k::

	SendInput, {Up}
	SetCapsLockState , AlwaysOff	
return


$m::
	SendInput, \\\
	SendInput, j
	SetCapsLockState , AlwaysOff
return

$n::
	SendInput, \\
	SendInput, s
	SetCapsLockState , AlwaysOff
return



$y::
	SetCapsLockState , AlwaysOff
	if WinExist("ahk_exe search_v.exe"){
		WinActivate ahk_exe search_v.exe
	}
	else{
		run %A_ScriptDir%\search_v.exe
	}
return

$^k::
	Sendinput, {LCtrl Down}{Up}{LCtrl Up}
	SetCapsLockState , AlwaysOff
return


$+k::
	Sendinput, {Lshift Down}{Up}{Lshift Up}
	SetCapsLockState , AlwaysOff
return

$+m::
	Sendinput, {Lshift Down}{PGDN}{Lshift Up}
	SetCapsLockState , AlwaysOff
return

$+9::
	Sendinput, {Lshift Down}{PGUP}{Lshift Up}
	SetCapsLockState , AlwaysOff
return



Backspace::
	SendInput, {delete}
return

+]::
	Sendinput, {Lshift Down}{End}{Lshift Up}
	SetCapsLockState , AlwaysOff

return


+[::
	Sendinput, {Lshift Down}{Home}{Lshift Up}
	SetCapsLockState , AlwaysOff

return

$o::
	Sendinput, \
	SetCapsLockState , AlwaysOff
return


$!q::
	SendInput, ^{Left}
	SetCapsLockState , AlwaysOff
return

$!e::
	SendInput, ^{Right}
	SetCapsLockState , AlwaysOff
return

$s::
	SendInput, {Home}
	SetCapsLockState , AlwaysOff
return


$x::
	SendInput, {End}
	SetCapsLockState , AlwaysOff
return



$l::
	SendInput, {Right}
	SetCapsLockState , AlwaysOff
	
	;~ Send, {Capslock}
	;~ SetCapsLockState , AlwaysOff
return


$^l::
	Sendinput, {LCtrl Down}{Right}{LCtrl Up}
	SetCapsLockState , AlwaysOff
return


$+l::
	Sendinput, {Lshift Down}{Right}{Lshift Up}
	SetCapsLockState , AlwaysOff
return

$^+l::
	Sendinput, {Lshift Down}{LCtrl Down}{Right}{Lshift Up}
	SetCapsLockState , AlwaysOff
return


$i::
	SendInput, {Up}
	SetCapsLockState , AlwaysOff
		
	;~ Send, {Capslock}
	;~ SetCapsLockState , AlwaysOff
		
return


$^i::
	Sendinput, {LCtrl Down}{Up}{LCtrl Up}
	SetCapsLockState , AlwaysOff
return


$+i::
	Sendinput, {Lshift Down}{Up}{Lshift Up}
	SetCapsLockState , AlwaysOff
return

$#1::
	Sendinput, {F5}
	SetCapsLockState , AlwaysOff
return

Space::
	MouseClick, left
	SetCapsLockState , AlwaysOff
return

^Space::
	MouseClick, left,,,2
	SetCapsLockState , AlwaysOff
return


$F1::

	if WinExist("ahk_exe SnippingTool.exe"){
		WinActivate, ahk_exe SnippingTool.exe
	}
	
	else{
		run %windir%\system32\SnippingTool.exe
		Sleep, 500
		run %windir%\system32\SnippingTool.exe
	}
	SetCapsLockState , AlwaysOff

return  

$F2::

	run %windir%\system32\mstsc.exe
	;~ WinActivate, ahk_class #32770
	SetCapsLockState , AlwaysOff

return

$F3::

	if WinExist("ahk_class MSPaintApp"){
		GroupActivate PAINT
	}
	else{
		run %windir%\system32\mspaint.exe
		WinWait ahk_class MSPaintApp
		WinActivate ahk_class MSPaintApp
	}
	SetCapsLockState , AlwaysOff


return

$F4::

	if WinExist("ahk_class Notepad"){
		GroupActivate NOTEPAD
	}
	else{
		run %windir%\system32\notepad.exe
		WinWait ahk_class Notepad
		WinActivate ahk_class Notepad
	}
	SetCapsLockState , AlwaysOff

return


$F5::
SetTitleMatchMode, 2
if Winactive("Chromium") || winactive("ahk_exe msedge.exe"){
	englishMode()
	;~ BlockInput on
	Sleep,200
	send,!{d}
	Sleep,200
	englishMode()
	SendInput {Raw}https://tasks.google.com/embed/?origin=https://calendar.google.com&fullWidth=1	
	Sleep,200
	Send,{Enter}
	;~ BlockInput off
}
SetCapsLockState , AlwaysOff
return


$F10::
	SetTitleMatchMode, 2
	Winactivate Microsoft​ Edge Beta
return


$F11::

return




$!F10::
Send, {Media_Play_Pause}
SetCapsLockState , AlwaysOff
return


$!F11::
Send, {Media_Prev}
SetCapsLockState , AlwaysOff
return

$!F12::
Send, {Media_Next}
SetCapsLockState , AlwaysOff
return

$Enter::

	if Winexist("����"){
			WinClose,����
			Sleep,1000
	}
	Send, #{i}
	hangulMode()
	Winwait, ����
	Sleep,1000
	SendRaw, ��ġ�е�
	Sleep,300
	Sendinput, {Enter}
	Sleep,300
	Sendinput, {Enter}
	Sleep,300
	SendInput, {Tab}
	
SetCapsLockState , AlwaysOff
return

$+F1::
	SendInput, +{Enter}
return


$!F1::
	SetCapsLockState , AlwaysOff
	if winactive("pygdocseditor") || winactive("pygdocdiary"){
		WinMinimize
	}
	else{
	Send, !{F4}
	}
return

$a::
	if WinActive("ahk_exe doublecmd.exe"){
		Send, {Left}
	}
	else if WinActive("ahk_class TTOTAL_CMD"){
		Send, ^{PgUp}
	}
	else if Winactive("Spyder"){
		SendInput, ^+{x}
		Loop,2{
			Sleep, 30
			SendInput, {Tab}
		}
		Sleep,30
		SendInput, {Space}
		Sleep,30
		SendInput, ^+{x}
	}
	else if WinActive("ahk_exe MATLAB.exe"){
		Keywait, Alt
		BlockInput On
		exclip:=Clipboard
		SendInput, ^{0}
		englishMode()
		SendInput, cd ..
		Sleep,100
		SendInput, {Enter}
		BlockInput Off
	}
	else if winactive("ahk_class PuTTY") || winactive("ahk_class KiTTY") || winactive("ahk_exe MobaXterm.exe"){
		Send, cd ..
		Send, {Enter}
		Send, ls -al
		Send, {Enter}
		
	}
	else{
		Send, !{Up}
	}
	SetCapsLockState , AlwaysOff

return


$`::
Send, {Backspace}
SetCapsLockState , AlwaysOff
return

$!`::
Send, !{Left}
SetCapsLockState , AlwaysOff
return

$!1::
Send, !{Right}
SetCapsLockState , AlwaysOff
return


$7::
DetectHiddenWindows, On
SetTitleMatchMode, 2
If WinExist("Jungyong's Record"){
	WinActivate, ahk_exe ahkgui.exe
}
else if WinExist("pygdocseditor2"){
	WinActivate, pygdocseditor2
}
else if WinExist("Edit Gdocs address"){
	WinActivate, Edit Gdocs address
}
else{
run, %A_ScriptDir%\\run_pygdocs.ahk
}
SetCapsLockState , AlwaysOff
return


$8::
	SetTitleMatchMode, 2
	if WinExist("ahk_exe Telegram.exe"){
		Winactivate, ahk_exe Telegram.exe
	}
SetCapsLockState , AlwaysOff
return

$!8::
	SetTitleMatchMode, 2
	if WinExist("ahk_exe Slack.exe"){
		Winactivate, ahk_exe Slack.exe
	}
SetCapsLockState , AlwaysOff
return

$9::
SetTitleMatchMode, 2
if (A_ComputerName == "DESKTOP-B9CNSNS"){
	WinActivate ahk_exe msedge.exe
}
else{
	if WinExist("Chromium"){
		WinActivate, Chromium
	}
	else{
		run, C:\Program Files (x86)\Chromium\Application\chrome.exe
	}
}
SetCapsLockState , AlwaysOff
return

$0::
	if Winexist("ahk_exe Code.exe"){
			GroupActivate, CODE, r
	}
	else{
		run, code, ,Hide
	}
SetCapsLockState , AlwaysOff
return

$F12::
	if Winexist("ahk_exe Code - Insiders.exe"){
			GroupActivate, CODEINSIDE, r
	}
	else{
		run, code-insiders, ,Hide
	}
SetCapsLockState , AlwaysOff
return

$!3::
	if Winexist("ahk_exe powershell.exe"){
		; WinActivate ahk_exe powershell.exe
		GroupActivate, POWERSHELL, r
	}
	else{
		run, powershell
	}
SetCapsLockState , AlwaysOff
return

$+1::

SendInput, <details markdown="1">
SendInput, {Enter}
SendInput, <summary> my text </summary>
SendInput, {Enter}
SendInput, {Enter}
SendInput, {Enter}
SendInput, </details>

SetCapsLockState , AlwaysOff
return


$1::
if WinActive("ahk_exe AcroRd32.exe"){
	
	Send, {LShift Down}
	Loop,20{
		Click, WheelDown
		Sleep, 100
	}
	Send, {LShift Up}
}
else{
	Send, {delete}
}
SetCapsLockState , AlwaysOff
return


$r::
	Send,	{End}
	Send, {Shift Down}{Home}{Shift Up}
	SetCapsLockState , AlwaysOff
return

$t::

	Send,	{Ctrl Down}{Left}{Ctrl Up}
	Send,	{Ctrl Down}{Shift Down}{Right}{Shift Up}{Ctrl Up}
SetCapsLockState , AlwaysOff
return

$3::
Send, ^{c}
SetCapsLockState , AlwaysOff
return

$4::
if winactive("ahk_class PuTTY") || winactive("ahk_class KiTTY") || winactive("ahk_exe MobaXterm.exe"){
	Send, +{Insert}
}
else{
Send, ^{v}
}
SetCapsLockState , AlwaysOff
return

$!]::
Send, {Ctrl Down}
Loop, 5{
    Click, WheelUp
	}
	Send, {Ctrl Up}
	SetCapsLockState , AlwaysOff
return

$![::
	Send, {Ctrl Down}
Loop, 5{
    Click, WheelDown
	}
	Send, {Ctrl Up}
	SetCapsLockState , AlwaysOff
return


$p::
	if winactive("ahk_exe Code.exe")|| winactive("ahk_exe Code - Insiders.exe") || winactive("ahk_exe VSCodium.exe"){
		send, !^+{y}
	}
	
	SetCapsLockState , AlwaysOff
return

$;::
	SetTitleMatchMode, 2

	if winactive("HackMD ") || winactive("ahk_exe Code.exe")|| winactive("ahk_exe Code - Insiders.exe") || winactive("ahk_exe VSCodium.exe"){
		englishMode()
	}

	; if WinActive("- 개인 -"){
	; 	Send, {Esc}
	; 	Send, {Esc}
	; }
	; else{
	; 	send, {Esc}
	; }

	send, {Esc}
	SetCapsLockState , AlwaysOff
return

$\::
	if winactive("ahk_exe Code.exe")|| winactive("ahk_exe Code - Insiders.exe") || winactive("ahk_exe VSCodium.exe"){
		send, !^+{r}
	}
	SetCapsLockState , AlwaysOff
return

$.::
	if winactive("ahk_exe Code.exe")|| winactive("ahk_exe Code - Insiders.exe") || winactive("ahk_exe VSCodium.exe"){
		send, !^+{h}
	}
	SetCapsLockState , AlwaysOff
return

$-::
	if winactive("ahk_exe Code.exe")|| winactive("ahk_exe Code - Insiders.exe") || winactive("ahk_exe VSCodium.exe"){
		
		send, ^+{8}
	}
	SetCapsLockState , AlwaysOff	
return

$'::
	if winactive("ahk_exe Code.exe")|| winactive("ahk_exe Code - Insiders.exe") || winactive("ahk_exe VSCodium.exe"){
		
		send, !^+{i}
	}
	SetCapsLockState , AlwaysOff	
return


$=::
	if winactive("ahk_exe Code.exe")|| winactive("ahk_exe Code - Insiders.exe") || winactive("ahk_exe VSCodium.exe"){
		send, !^{b}
	}
	SetCapsLockState , AlwaysOff	
return

$esc::

	WinActivate, ahk_class Shell_TrayWnd
	SetCapsLockState , AlwaysOff
return

#if




CapsLock::
	acaps:=1

return

!CapsLock::
	Keywait Alt
	SetCapsLockState , AlwaysOff
return


^CapsLock::
	Keywait Ctrl
	SetCapsLockState , AlwaysOff
return

+CapsLock::
	Keywait Shift
	SetCapsLockState , AlwaysOff
return


HideTrayTip() {
    TrayTip  ; Attempt to hide it the normal way.
    if SubStr(A_OSVersion,1,3) = "10." {
        Menu Tray, NoIcon
        Sleep 200  ; It may be necessary to adjust this sleep.
        Menu Tray, Icon
    }
}





#!CAPSLOCK::
	if GetKeyState("CapsLock", "T"){
		
		SetCapsLockState, off
		TrayTip, Capslock, Off, 2
		Sleep 1000   ; Let it display for 3 seconds.
		HideTrayTip()
	}
	else{
		
		SetCapsLockState, on
		TrayTip, Capslock, On, 2
		Sleep 1000   ; Let it display for 3 seconds.
		HideTrayTip()
		
	}

RETURN



#+q::
	KeyWait, LWin
	KeyWait, Shift
	
	Sleep 50
    CoordMode,Mouse,Screen
    WinGetPos, winTopL_x, winTopL_y, width, height, A
    winCenter_x := winTopL_x + width/2
    winCenter_y := winTopL_y + height/2
    ;MouseMove, X, Y, 0 ; does not work with multi-monitor
    DllCall("SetCursorPos", int, winCenter_x, int, winCenter_y)
    ;Tooltip winTopL_x:%winTopL_x% winTopL_y:%winTopL_y% winCenter_x:%winCenter_x% winCenter_y:%winCenter_y%
return


$!n::

if WinActive("ahk_class EVA_Window_Dblclk"){
	Send,!{n}
	Sleep,2000
	Send,+{Tab}
	englishMode()
}
; else if Winactive("다른 이름으로 저장"){
; 	SendInput, {Tab}
; 	SendInput, !{n}
; }
else{
	SendInput,!{n}
}
return

$!m::
;qqq
if WinActive("Microsoft To-Do"){
	Keywait, Alt
	BlockInput,On
	DPIsize:=checkDPIsize()
	Dpiconv:=DPIsize/96
	xx:=42*Dpiconv
	yy:=42*Dpiconv
	CoordMode, Mouse, Client
	;~ MouseClick, left, xx, yy,2
	MouseClick, left, xx, yy
	Sleep,100
	send, {Down}
	send, {Up}
	Send, {Enter}
	BlockInput,Off
}
else{
	Send !{m}
}
return


!+CapsLock::
	Keywait, Shift
	Keywait, Alt
	Keywait, CapsLock

	Sleep, 500
	
	WinGet, OutputVar1, Count, ahk_exe mstsc.exe
	
	
	
	BlockInput On
	Loop, %OutputVar1%{
		
		WinMinimize, ahk_class TscShellContainerClass
		Sleep,500
	}
	BlockInput Off
	
	Send, {Blind}{Shift UP}
	Send, {Blind}{Alt UP}
	

return




+Enter::
	if WinActive("Microsoft To-Do"){
		Send, {Enter}
		Sleep,500
		Send, {Up}
		Sleep,500
		Send, {Enter}
	}
	else{
		Send, +{Enter}
}
return


$!+b::
	Keywait, Alt
	KeyWait, Shift

	Send, #{b}
	Send, {Left}
	Send, {Left}
	Send, {Enter}
	
return

$!+t::
	SetTitleMatchMode, 2
	Keywait, Alt
	Keywait, Shift
	if WinActive("ahk_class PPTFrameClass") || WinActive("ahk_class OpusApp"){
			Send, !{n}
			Send, {l}
	}
	else if WinActive("ahk_exe Hwp.exe"){
		Send, +{F10}
		Sleep, 200
		Send, {u}
	}
	; else if  Winactive("Google ����"){
	; 	Send, ^!{m}
	; }
	else{
		Send, !+t
	}
return


#+d::

	Send, #p
return

#+e::
	Keywait, Shift
	Keywait, LWin
	Send, #p
	Sleep,300
	Send, {Down}{Down}
	Sleep,300
	Send, {Enter}
	Sleep,300
	Send, {Esc}
return

#+r::
	edit
return

#+t::
run, C:\Program Files\AutoHotkey\Windowspy.ahk
return

#+a::
	Keywait, Shift
	Keywait, LWin
	BlockInput,on
	Send, #+{Right}
	Sleep,300
	WinMaximize, A
	Send, #{Down}
	Sleep,300
	WinMaximize, A
	BlockInput,off
return


$#b::
	SendInput, #{b}
	SendInput, {Enter}
return



ScrollLock::
MsgBox, ScrollLock
return

!+F4::
run, C:\Program Files\AutoHotkey\WindowSpy.ahk
return

!+F5::
run "C:\Program Files (x86)\Google\Chrome\Application\chrome_proxy.exe" --profile-directory=Default --app-id=felcaaldnbdncclmgdcncolpebgiejap --app=https://docs.google.com/spreadsheets/d/1kRtSiyp29fSX0pJydJqkgDgIkP1laa5nczbVoMU7rS8/edit#gid=0
return

!+esc::
	Sendinput, !{d}
	Sendinput, C:\Users\%A_UserName%\Downloads
	Sendinput, {Enter}
	
return

checkDPIsize()
{
RegRead, DPI_value, HKEY_CURRENT_USER, Control Panel\Desktop\WindowMetrics, AppliedDPI
if errorlevel=1 ; the reg key was not found - it means default settings
   return 96
if DPI_value=96 ; 96 is the default font size setting
   return %DPI_value%
if DPI_value>96 ; A higher value should mean LARGE font size setting
   return %DPI_value%
}
	
	
return

$^!e::
	if WinActive("ahk_class Chrome_WidgetWin_1"){
		Send, ^{9}
	}
	else{
		Send, ^!{e}
	}
return


#a::
	if(!Winactive("ahk_exe SearchUI.exe")){
		Send, #{Left}
		Sleep 100
		if(iswinkey==1){
		Send, {Enter}
		Sleep 100
		Send, {Esc}
		}
	}
return

#s::
	if(!Winactive("ahk_exe SearchUI.exe")){
		Send, #{Right}
		Sleep 100
		if(iswinkey==1){
		Send, {Enter}
		Sleep 100
		Send, {Esc}
		}
		
	}
return

#w::
	Send, #{Up}
	Sleep 100
	
	
	if(iswinkey==1){
	Send, {Enter}
	Sleep 100
	Send, {Esc}
	}
return


#z::
	if(!Winactive("ahk_exe SearchUI.exe")){
		WinMinimize, A
	}
	
return

#x::
	Send, #{Down}
	Sleep 100
	if(iswinkey==1){
	Send, {Enter}
	Sleep 100
	Send, {Esc}
	}
return


#q::
	if(!Winactive("ahk_exe SearchUI.exe")){
		WinMaximize, A
	}
	
return

+F1::
	Send,+{Enter}
return

+F2::
	Send, {Down}
return


#f::
	SetTitleMatchMode, 2
	if WinActive("Tasks"){
		Send, ^!{1}
	}		
return

#+f::
	if WinActive("ahk_exe chrome.exe"){
		Send, {Esc}
		Send, {Esc}
		Send, {f}
	}
	
return


!del::
	Send, !{Right}
return

+del::
	capstate := GetKeyState("Capslock", "T")
	if(capstate){
		Send, {?}
		SetCapsLockState , AlwaysOff
	}
	else{
		Send, {?}
	}
return

#del::
	capstate := GetKeyState("Capslock", "T")
	if(capstate){
		Send, {\}
		SetCapsLockState , AlwaysOff
	}
	else{
		Send, {\}
	}
return

F6::
	Send, {/}
return

^+F6::
	Send, {|}
return


$+F10::
Keywait, Shift
if winactive("ahk_exe notepad++.exe"){
	Send, {F8}
}
else{
	SendInput, +{F10}
}
return



CapsLock & F8::
	SendInput, {F8}
return

^F8::

SetTitleMatchMode, 2
if WinActive("Todoist"){
	Send, {q}
}
else if WinActive("ahk_exe Hwp.exe"){
	Send, !{n}
}
else if WinActive("ahk_class MSPaintApp"){
	run %windir%\system32\mspaint.exe
}
else if WinActive("ahk_class Notepad"){
	run %windir%\system32\notepad.exe
}
else if WinActive("ahk_exe MATLAB.exe"){
	Send, ^{Enter}
}
else{
	Send, ^{n}
}
return

!F8::
	capstate := GetKeyState("Capslock", "T")
	
	if(capstate){
		KeyWait Capslock
		Send, {{}
		SetCapsLockState , AlwaysOff		
	}
	else{
		Send, {}}
	}
return

!F6::
	Send, {{}
return

+F8::
	if WinActive("Microsoft To-Do"){
		Send, {Enter}
		Sleep,500
		Send, {Up}
		Sleep,500
		Send, {Enter}
	}
	else{
		capstate := GetKeyState("Capslock", "T")
		if(capstate){
			KeyWait Capslock
			Send, {(}
			SetCapsLockState , AlwaysOff
		}
		else{
			Send, {)}
		}
	}
return


+F6::
	Send, {(}
return

!+F8::
	capstate := GetKeyState("Capslock", "T")
	if(capstate){
		KeyWait Capslock
		Send, {:}
		SetCapsLockState , AlwaysOff
	}
	else{
		Send, {;}
	}
return


!+F6::
	Send, {:}
return

$^+F8::
	if WinActive("ahk_exe doublecmd.exe")|| WinActive("ahk_class TTOTAL_CMD"){
		Send, {F7}
	}
	else{
		Send, ^+{n}
	}
return


!+^F8::
	if WinActive("ahk_exe doublecmd.exe") || WinActive("ahk_class TTOTAL_CMD"){
		Send, !{d}
		Sleep,100
		Send, ^{c}
		Sleep,100
		Send, #{e}
		Sleep,100
		Send, !{d}
		Sleep,100
		Send, ^{v}
		Send, {Enter}
	}
return

!+^Enter::
	if WinActive("ahk_exe doublecmd.exe") || WinActive("ahk_class TTOTAL_CMD"){
		Send, !{d}
		Sleep,100
		Send, ^{c}
		Sleep,100
		Send, #{e}
		Sleep,100
		Send, !{d}
		Sleep,100
		Send, ^{v}
		Send, {Enter}
	}
return

^!F8::
	capstate := GetKeyState("Capslock", "T")
	if(capstate){
		KeyWait Capslock
		Send, {'}
		SetCapsLockState , AlwaysOff
	}
	else{
		Send, {"}
	}
return

^!F6::
	Send, {'}
return

#F8::
	capstate := GetKeyState("Capslock", "T")
	if(capstate){
		KeyWait Capslock
		Send, {[}
		SetCapsLockState , AlwaysOff
	}
	else{
		Send, {]}
	}
return

#F6::
	Send, {[}
return

^#F8::
	capstate := GetKeyState("Capslock", "T")
	if(capstate){
		KeyWait Capslock
		Send, {,}
		SetCapsLockState , AlwaysOff
	}
	else{
		Send, {.}
	}
return

^#F6::
	Send, {,}
return

!#F8::
	capstate := GetKeyState("Capslock", "T")
	if(capstate){
		KeyWait Capslock
		Send, {_}
		SetCapsLockState , AlwaysOff
	}
	else{
		Send, {-}
	}
return

!#F6::
	Send, {_}
return

#+F8::
	capstate := GetKeyState("Capslock", "T")
	if(capstate){
		KeyWait Capslock
		Send, {+}
		SetCapsLockState , AlwaysOff
	}
	else{
		Send, {=}
	}
return

#+F6::
	Send, {+}
return


$Esc::
	SetTitleMatchMode, 2
	if WinActive("카카오톡")
		{
			WinMinimize, A
		}
	else if WinActive("- 개인 -"){
		Send, {Esc}
		Send, {Esc}
	}
	else{
		Send, {Esc}
	}
return

$!F4::
	SetTitleMatchMode, 2
	if WinActive("Todoist")|| WinActive("Microsoft To-Do") || WinActive("pygdocseditor") ||WinActive("ahk_class EVA_Window_Dblclk")|| winactive("pygdocdiary"){
		WinMinimize, A
	}
	else{
		Send, !{F4}
	}
return



$^h::

	Keywait, Control
	capstate := GetKeyState("Capslock", "T")
	if(capstate){
		SetTitleMatchMode, 2
		SetCapsLockState , AlwaysOff
		if WinActive("ahk_exe Hwp.exe"){
			Send, ^{PgUp}
		}
		else{
			Send, ^{Home}
		}
		
		
	}
	else{
		SetTitleMatchMode, 2
		if WinActive("ahk_class OpusApp") || Winactive("Google ����") || WinActive("ahk_class PPTFrameClass"){
			Send, ^{i}
		}
		else if WinActive("ahk_exe Hwp.exe"){
			Send, !+{i}
		}
		else{
			Send, ^{h}
		}
	}

return

$!c::
	if WinActive("ahk_class OpusApp")|| WinActive("ahk_class PPTFrameClass") || WinActive("ahk_exe EXCEL.exe"){
		Send, !{h}
		Sleep, 200
		Send, {f}
		Send, {p}
	}
	else{
		Send, !{c}
	}
return

#esc::

	isc1:=1
	
	if Winexist("ahk_class OpusApp"){
		GroupActivate, WORD, r
		isc1:=0
	}
	
	
	if(isc1=1){
		
		KeyWait LWin
		WinActivate, ahk_class Shell_TrayWnd

		KeyWait Control 
		KeyWait Alt
		
		SendInput, {End}
		SendInput, {Home}
		
		BlockInput On
		Send #T
		Sleep, 100
		Loop,4{
			Send, {right}
		}
		Send, {Enter}
		
		BlockInput Off
	}

return

$^+s::

	if WinActive("ahk_class OpusApp"){
		Send, {F12}
	}
	else if WinActive("ahk_exe EXCEL.exe"){
		Send, {F12}
	}
	else if WinActive("ahk_exe notepad++.exe"){
		Send, !^{s}
	}
	else if WinActive("ahk_exe Hwp.exe"){
		Send, !{v}
	}
	else{
		Send, ^+s
	}
return

!#z::
	SetTitleMatchMode, 2
	if WinActive("Microsoft To-Do"){
		
		CoordMode, Mouse, Client
		MouseGetPos, xpos, ypos 
		
		DPIsize:=checkDPIsize()
		Dpiconv:=DPIsize/96
		xx:=394*Dpiconv
		yy:=ypos
		
		MouseMove, xx, yy
	}
	else if WinActive("Todoist"){
		
		CoordMode, Mouse, Client
		MouseGetPos, xpos, ypos 
		
		DPIsize:=checkDPIsize()
		Dpiconv:=DPIsize/96
		xx:=535*Dpiconv
		yy:=ypos
		
		MouseMove, xx, yy
	}

	Loop, 5{
    Click, WheelUp
	}
return


!#a::
	if WinActive("ahk_exe doublecmd.exe"){
		Send, {Left}
	}
	else if WinActive("ahk_class TTOTAL_CMD"){
		Send, ^{PgUp}
	}
	else{
		Send, !{Up}
	}
	
return

!#x::
SetTitleMatchMode, 2
	if WinActive("Microsoft To-Do"){
		CoordMode, Mouse, Client
		MouseGetPos, xpos, ypos 
		
		DPIsize:=checkDPIsize()
		Dpiconv:=DPIsize/96
		xx:=394*Dpiconv
		yy:=ypos
		MouseMove, xx, yy
	}
	
	else if WinActive("Todoist"){
		
		CoordMode, Mouse, Client
		MouseGetPos, xpos, ypos 
		
		DPIsize:=checkDPIsize()
		Dpiconv:=DPIsize/96
		xx:=535*Dpiconv
		yy:=ypos
		
		MouseMove, xx, yy
	}
	
	Loop, 5{
    Click, WheelDown
	}
return

#PgDn::
	Loop, 5{
    Click, WheelDown
	}
return

#PgUp::
	Loop, 5{
    Click, WheelUp
	}
return


$^q::
Keywait, Control
if WinActive("ahk_class OpusApp"){
	Send, !r
	Send, {t}
	Send, {d}
}
else if WinActive("ahk_exe Hwp.exe"){
	Send, {LAlt Down}
	Sleep, 50
	Send, {LAlt Up}	
	Sleep, 100
	Send, {h}
	Sleep, 100
	Send, {i}
}
else{
	Send, ^{q}
}
return

$^+q::
SetTitleMatchMode, 2
Keywait, Control
Keywait, Shift
if WinActive("ahk_class OpusApp"){
	Send, !r
	Sleep, 200
	Send, {t}
	Send, {d}
	Sleep, 200
	Send, {Up}
	Sleep, 200
	Send, {Enter}
	Send, {Esc}
}
else if WinActive("ahk_exe Hwp.exe"){
	Send, {LAlt Down}
	Sleep, 50
	Send, {LAlt Up}	
	Sleep, 100
	Send, {h}
	Sleep, 100
	Send, {f}
}
else{
	Send, ^+{q}
}
return



$!a::
SetTitleMatchMode, 2
if WinActive("Tasks"){
	SendInput, !^{h}
}
else if WinActive("Google 캘린더"){
	SendInput, !^{h}
}
else{
	SendInput !a
}
return

$!z::
SetTitleMatchMode, 2
if WinActive("Tasks"){
	SendInput, ^!{9}
}
else{
	Send, !{z}
}
return

$!t::
SetTitleMatchMode, 2
if WinActive("Tasks"){
	SendInput, ^!{n}
}
else if WinActive("Google 캘린더"){
	Keywait, Alt
	SendInput, ^!{6}
}
else{
	SendInput, !{t}
}
return

$^e::
	
	capstate := GetKeyState("Capslock", "T")
	if(capstate){
		SetTitleMatchMode, 2
		SetCapsLockState , AlwaysOff
		if WinActive("ahk_exe Hwp.exe"){
			Send, ^{PgDn}
		}
		else{
			Send, ^{End}
		}
		
		
	}
	else{
		if WinActive("ahk_exe Hwp.exe"){
			Send, ^+{c}
		}
		else{
			Send, ^{e}
		}
	}
	

return

$^j::
if WinActive("ahk_exe Hwp.exe"){
	Send, ^+{m}
}
else{
	Send, ^{j}
}
return


$^d::
if WinActive("ahk_exe Hwp.exe"){
	Send, !{l}
}
else if WinActive("Microsoft To-Do"){
	Send,{Up}
	Send,{Down}
	Send,^{d}
}
else{
	Send, ^{d}
}
return

^`::
	if WinActive("ahk_class PPTFrameClass"){
		Send !{h}
		Send {g}
		Send {a}
		Send {c}
	}
	else if WinActive("ahk_exe doublecmd.exe"){
			Send, ^{-}
	}
	else if WinActive("ahk_class TTOTAL_CMD"){
		Send, ^{NumpadSub}
	}
return

$^1::
SetTitleMatchMode, 2
if WinActive("ahk_class OpusApp")||WinActive("ahk_exe Hwp.exe"){
	Send ^{[}
}
else if Winactive("ahk_class XLMAIN"){
	Send, !{h}
	Send, {f}
	Send, {k}

}	
else if WinActive("ahk_class PPTFrameClass"){
	Keywait, Ctrl
	Send, ^+{<}
}
else if Winactive("Google ����"){
	Send, !{o}
	Sleep, 100
	Send, !{s}
	Sleep, 100
	Send, !{o}
	Sleep, 100
	Send, {Enter}
}
else if WinActive("ahk_exe texworks.exe"){
	CoordMode, Pixel, Client
	CoordMode, Mouse, Client
	WinGetPos, X, Y, Width, Height, ahk_exe texworks.exe
	xx:=Width/2
	yy:=1.35*Height/10
	MouseClick, left, xx, yy
}
else if WinActive("Quick google translate"){
	ControlClick, Button1, Quick google translate	
}
else{
	Send ^1
}
return

$^2::
SetTitleMatchMode, 2
if WinActive("ahk_class OpusApp")||WinActive("ahk_exe Hwp.exe"){
	Send ^{]}
}
else if Winactive("ahk_class XLMAIN"){
	Send, !{h}
	Send, {f}
	Send, {g}

}	
else if WinActive("ahk_class PPTFrameClass"){
	Keywait, Ctrl
	Send, ^+{>}
}
else if WinActive("Google ����"){
	Send, !{o}
	Sleep, 100
	Send, !{s}
	Sleep, 100
	Send, !{o}
	Sleep, 100
	Send, {Down}
	Sleep, 100
	Send, {Enter}
}
else if WinActive("ahk_exe texworks.exe"){
	
	Keywait, Control
	CoordMode, Pixel, Client
	CoordMode, Mouse, Client
	WinGetPos, X, Y, Width, Height, ahk_exe texworks.exe
	xx:=Width/2
	yy:=1.35*Height/10
	MouseClick, left, xx, yy,2
	
	
}
else{
	Send ^2
}
return


$^Tab::

SetTitleMatchMode, 2
	if WinActive("ahk_exe MATLAB.exe") || WinActive("ahk_exe SciTE.exe") || WinActive("ahk_exe notepad++.exe") || WinActive("ahk_exe EXCEL.exe") || WinActive("ahk_exe pythonw.exe"){
		if(WinActive("academic use")){
			Send, ^{Tab}
		}
		else if WinActive("ã��") || WinActive("�ٲٱ�") || WinActive("å����"){
			Send, +{Tab}
			Send, {Right}
		}
		else{
			Send, {Ctrl Down}{PgDn}{Ctrl Up}
		}
	}
	else if WinActive("ahk_class OpusApp"){
		Send, !n
		Send, {e}
		Send, {i}
	}
	else if WinActive("ahk_exe Hwp.exe"){
		Send, ^{n}{m}
	}
	else if WinActive("ahk_class PPTFrameClass"){
		Send, !n
		Send, {e}
		Send, {Enter}
	}
	else if winactive("ahk_exe Code.exe"){
		Send, ^{Pgdn}
	}
	else{
		Send, ^{Tab}
	}
return

$^+Tab::
	if WinActive("ahk_exe MATLAB.exe") || WinActive("ahk_exe SciTE.exe") || WinActive("ahk_exe notepad++.exe") || WinActive("ahk_exe EXCEL.exe") || WinActive("ahk_exe pythonw.exe"){
		if(WinActive("academic use")){
			Send, ^+{Tab}
		}
		else if WinActive("ã��") || WinActive("�ٲٱ�") || WinActive("å����"){
			Send, +{Tab}
			Send, {Left}
		}
		else{
			Send, {Ctrl Down}{PgUp}{Ctrl Up}
		}
	}
	else if WinActive("ahk_exe pycharm64.exe"){
		Send, !{Left}
	}
	else if winactive("ahk_exe Code.exe"){
		Send, ^{PgUp}
	}
	else{
	
		Send, ^+{Tab}
	}
return

$^+t::
	if WinActive("ahk_class TTOTAL_CMD"){
		;~ BlockInput On
		Keywait Shift
		Keywait Control
		SplashImage, copytab.jpg
		Send, !{d}
		Sleep,100
		Send, ^{c}
		Sleep,100
		Send, {Esc}
		Sleep,100
		Send, {Tab}
		Sleep,100
		Send, ^{t}
		Sleep,100
		Send, !{d}
		Sleep,100
		Send, ^{v}
		Sleep,100
		Send, {Enter}
		SplashImage, off
		;~ BlockInput Off
	}
	else if WinActive("ahk_exe doublecmd.exe"){
		BlockInput On
		Keywait Shift
		Keywait Control
		Send, {Tab}
		Sleep, 200
		Send, ^{t}
		Sleep, 500
		Send, {Tab}
		Sleep, 200
		Send, !{z}
		BlockInput On
	}
	else{
	
		Send, ^+{t}
	}

return




+F3::run taskmgr.exe

$!1::
SetTitleMatchMode, 2
if WinActive("ahk_exe doublecmd.exe"){
	Send, !{1}
	Send, {esc}
}
else if WinActive("Tasks"){
	Keywait, Ctrl
	Keywait, Shift
	SendInput, ^!{p}
}
else{
	Sendinput, !{1}
}
return

$^v::
SetTitleMatchMode, 2
if winactive("ahk_class PuTTY") || winactive("ahk_class KiTTY"){
	Send, +{Insert}
}
else{
	SendInput ^v
}
return



$!s::
SetTitleMatchMode, 2
if WinActive("Microsoft To-Do"){
	DPIsize:=checkDPIsize()
	Dpiconv:=DPIsize/96
	xx:=87*Dpiconv
	yy:=369*Dpiconv
	CoordMode, Mouse, Client
	MouseClick, left, xx, yy

}
else if WinActive("Todoist"){
	
	DPIsize:=checkDPIsize()
	Dpiconv:=DPIsize/96
	xx:=87*Dpiconv
	yy:=381*Dpiconv
	CoordMode, Mouse, Client
	MouseClick, left, xx, yy
	
}
else{
	SendInput !s
}
return

$!d::
SetTitleMatchMode, 2
if WinActive("Tasks"){
	SendInput,^!{i}
	Sleep,500
	Loop,4{
		Send,+{Tab}
	}
}
else if WinActive("Google 캘린더"){
	SendInput,^!{5}
}
else if WinActive("ahk_exe pycharm64.exe"){
	KeyWait, Alt
	Send, !{n}
	Sleep,100
	Send,!{p}
	Sleep,100
	Send,{Enter}
	Sleep,500
	Send,{Enter}
	
}
else if WinActive("ahk_exe MATLAB.exe"){
	Keywait, Alt
	BlockInput On
	exclip:=Clipboard
	SendInput, ^{0}
	englishMode()
	SendInput, clipboard('copy',pwd)
	Sleep,100
	SendInput, {Enter}
	Sleep,100
	run %A_ScriptDir%\matlabpath.exe
	winwait Matlab path change
	ControlSetText, Edit1, %Clipboard%, Matlab path change
	WinActivate Matlab path change
	winwait Matlab path change
	SendInput, {End}
	SendInput, ^{a}
	Clipboard:=exclip
	BlockInput Off
}
else if Winactive("Spyder"){
	SendInput, ^+{x}
	Loop,9{
		Sleep, 30
		SendInput, +{Tab}
	}
}
else{
	SendInput !d
}
return


$!+d::
SetTitleMatchMode, 2
if WinActive("Tasks"){
	SendInput,^!{o}
}
else{
	SendInput !+d
}
return


$!f::
SetTitleMatchMode, 2
if WinActive("Google 캘린더"){
	Send, !^{5}
}
else if Winactive("Spyder"){
	Send, ^+{x}
}
else if WinActive("ahk_exe matlab.exe"){
	Send, ^{0}
	Send, ^+{Tab}
}
else{
	SendInput !f
}
return


$!g::
SetTitleMatchMode, 2
if WinActive("Google 캘린더"){
	SendInput,!^{b}
}
else{
	SendInput !g
}
return

$!h::
SetTitleMatchMode, 2
if WinActive("Tasks"){
	Keywait, Shift
	SendInput,^!{p}
	Sleep,500
	Send,{Esc}
	Sleep,200
	Send,+{Tab}
}
else if Winactive("Google 캘린더"){
	SendInput,^!{2}
}
else if Winactive("Spyder"){
	Send, ^+{h}
}
else{
	SendInput !h
}
return



$^r::
if WinActive("ahk_exe pycharm64.exe"){
	Send ^/
}
else if WinActive("ahk_exe pythonw.exe"){
	Send, ^{1}
}
else if WinActive("ahk_exe texworks.exe"){
	Send ^+{]}
}
else if WinActive("ahk_exe notepad++.exe"){
	Send ^{k}
}
else if WinActive("ahk_class OpusApp") || WinActive("ahk_class PPTFrameClass"){
	Send !{h}{4}
}
else if WinActive("ahk_exe SciTE.exe"){
	Send, ^{q}
}
else if WinActive("ahk_exe Hwp.exe"){
	Send !{l}
	sleep,300
	Send !{e}
	sleep,300
	Send !{d}
}
else{
	Send ^r
}
return


$^+r::
if WinActive("ahk_exe pycharm64.exe"){
	Send ^/
}
else if WinActive("ahk_exe pythonw.exe"){
	Send ^{1}
}
else if WinActive("ahk_exe texworks.exe"){
	Send ^+{[}
}
else if WinActive("ahk_exe notepad++.exe"){
	Send ^+{k}
}
else if WinActive("ahk_exe MATLAB.exe"){
	Send ^{t}
}
else if WinActive("ahk_exe SciTE.exe"){
	Send, ^{q}
}
else if WinActive("Google 캘린더"){

	If WinExist("Tasks"){
		WinActivate
	}
	else{
		run firefox.exe "https://tasks.google.com/embed/?origin=https://calendar.google.com&fullWidth=1"
		winwait, Tasks
	}

	MouseGetPos, xpos, ypos 
	Mousemove,0,0
	
	Send,^f
	Sleep,100
	Sendraw,L_
	Sleep,100
	BlockInput on
	Send,{Enter}
	Send,{Enter}
	Sleep,100
	Send,{Esc}
	Sleep,100
	Send,+{Tab}

	Sleep,100
	Send,{Enter}
	Sleep,100
	
	Loop,11{
		Send,{Down}
		Sleep,100
	}
	Send,{Enter}
	Sleep,2500
	Loop,6{
		Send,{Tab}
		Sleep,100
	}
	BlockInput off
	Mousemove,xpos,ypos
}
else if WinActive("Tasks"){
	MouseGetPos, xpos, ypos 
	Mousemove,0,0
	
	Send,^f
	Sleep,100
	Sendraw,L_
	Sleep,100
	BlockInput on
	Send,{Enter}
	Send,{Enter}
	Sleep,100
	Send,{Esc}
	Sleep,100
	Send,+{Tab}

	Sleep,100
	Send,{Enter}
	Sleep,100
	
	Loop,11{
		Send,{Down}
		Sleep,100
	}
	Send,{Enter}
	Sleep,2500
	Loop,6{
		Send,{Tab}
		Sleep,100
	}
	BlockInput off
	Mousemove,xpos,ypos
}
else{
	Send ^+r
}
return

$^+1::

if WinActive("ahk_exe notepad++.exe"){
	Send, !{l}{p}
	Send, {Up}
	Send, {Enter}

}
else if WinActive("ahk_exe matlab.exe"){
	Send, ^{0}
	Send, ^+{Tab}
}
else{
	Sendinput, ^+{1}
}
return

^+`::
if WinActive("Google 캘린더"){
	CoordMode, Mouse, Client
	SplashImage, WAITSign.jpg
	MouseClick, left, 344, 222,2
	Sleep,100
	BlockInput on
	Send,^!{,}
	Sleep,100	
	Send,+{Tab}
	Sleep,100
	Send,+{Tab}
	Sleep,100
	Send,{Enter}
	Sleep,100
	Loop,1{
		Send,{Down}
		Sleep,100
	}
	Send,{Enter}
	Sleep,2500
	Loop,5{
		Send,{Tab}
		Sleep,100
	}
	SplashImage, Off
	BlockInput off
}
else{
	Sendinput, ^+{`}
}

return

$^+2::
if WinActive("ahk_exe notepad++.exe"){
	Send, !{l}{l}
	Send, {Enter}

}
else if WinActive("ahk_exe matlab.exe"){
	Send, ^{0}
}
else if WinActive("ahk_class TTOTAL_CMD"){
	Keywait, Control
	Keywait, Shift
	SendInput, {Alt Down}
	Sleep,100
	SendInput, {Alt Up}
	
	SendInput, {m}
	SendInput, {y}
}
else{
	Sendinput, ^+{2}
}
return



$^n::
SetTitleMatchMode, 2
if WinActive("ahk_exe pycharm64.exe"){
	KeyWait, Control
	Send, ^!{Insert}
	Sleep, 100
	SendInput, python file
	Sleep,100
	Send,{Enter}
}
else if WinActive("Todoist"){
	Send, {q}
}
else if WinActive("ahk_exe Hwp.exe"){
	Send, !{n}
}
else if WinActive("ahk_class MSPaintApp"){
	run %windir%\system32\mspaint.exe
}
else if WinActive("ahk_class Notepad"){
	run %windir%\system32\notepad.exe
}		
else{
	Send ^n
}
return

!+g::
	if winactive("ahk_exe explorer.exe"){
		KeyWait Shift
		KeyWait Alt
		Send, +{F10}
		Sleep,300
		Send, {p}	
	}
	else if Winactive("ahk_exe ALPDF.exe"){
		KeyWait Shift
		KeyWait Alt
		Sleep,300
		Send, !{f}
		Sleep,300
		Send, !{p}
	}
	else{
		Send, ^{p}
	}
return


$!+h::
	if WinActive("ahk_exe POWERPNT.EXE"){
		CoordMode, Pixel, Client
		CoordMode, Mouse, Client
		WinGetPos, X, Y, Width, Height, ahk_exe POWERPNT.EXE
		xx:=Width/2
		yy:=Height-100
		MouseClick, left, xx, yy
		Send, {PgUp}
	}
	else{
		Send,!+{h}
	}
return


Insert::
	Sendinput, {delete}
return


!+z::
	isc1:=1

	if winexist("ahk_exe VSCodium.exe"){
		GroupActivate, CODIUM
	}
	else{
		run, codium
	}

return

!+x::

	isc1:=1
	
	if Winexist("ahk_class AcrobatSDIWindow"){
		GroupActivate, ADOBERD, r
		isc1:=0
	}
	
	
	if(isc1=1){
		KeyWait Shift  
		KeyWait Alt
		
		WinActivate, ahk_class Shell_TrayWnd
		
		KeyWait Shift  
		KeyWait Alt
		
		SendInput, {End}
		SendInput, {Home}

		BlockInput On
		Send #T
		Sleep, 100
		Loop,10{
			Send, {right}
		}
		Send, {Enter}
		
		BlockInput Off
	}
	

return

!+c::

	isc1:=1
	
	if Winexist("ahk_exe POWERPNT.EXE"){
		GroupActivate, PPT, r
		isc1:=0
	}
	
	
	if(isc1=1){
		KeyWait Shift  
		KeyWait Alt
		WinActivate, ahk_class Shell_TrayWnd

		KeyWait Shift  
		KeyWait Alt
		
		SendInput, {End}
		SendInput, {Home}
		
		BlockInput On
		Send #T
		Sleep, 100
		Loop,11{
			Send, {right}
		}
		Send, {Enter}
		
		BlockInput Off
	}
return

!+v::

	Keywait, Alt
	Keywait, Lshift

	isc1:=1
	if Winexist("ahk_exe EXCEL.EXE"){
		GroupActivate, EXCEL, r
		isc1:=0
	}
	
	
	if(isc1=1){
		KeyWait Shift  
		KeyWait Alt
			
		WinActivate, ahk_class Shell_TrayWnd

		KeyWait Shift  
		KeyWait Alt
		
		SendInput, {End}
		SendInput, {Home}
		
		BlockInput On
		Send #T
		Sleep, 100
		Loop,12{
			Send, {right}
		}
		Send, {Enter}
		
		BlockInput Off
	}
return

^!z::

	isc1:=1
	
	DetectHiddenWindows, Off
	if Winexist("카카오톡"){
		;~ GroupActivate, KAKAO, r
		WinActivate, 카카오톡
		isc1:=0
	}
	if(isc1=1){
		KeyWait Control 
		KeyWait Alt
		WinActivate, ahk_class Shell_TrayWnd

		KeyWait Control 
		KeyWait Alt
		
		SendInput, {End}
		SendInput, {Home}
		
		BlockInput On
		Send #T
		Sleep, 100
		Loop,13{
			Send, {right}
		}
		Send, {Enter}
		
		BlockInput Off
	}


return

^!x::	
	isc1:=1
	
	if Winexist("ahk_exe Hwp.exe"){
		GroupActivate, HWP, r
		isc1:=0
	}

	
	if(isc1=1){
		KeyWait Control  
		KeyWait Alt
		
		WinActivate, ahk_class Shell_TrayWnd

		KeyWait Control  
		KeyWait Alt
		
		SendInput, {End}
		SendInput, {Home}
		
		BlockInput On
		Send #T
		Sleep, 100
		Loop,14{
			Send, {right}
		}
		Send, {Enter}
		
		BlockInput Off
	}
return

^!c::
	SetTitleMatchMode, 2

	if Winexist("FileZilla"){
			WinActivate FileZilla
			isc1:=0
	}
	
	if(isc1=1){
		KeyWait Control  
		KeyWait Alt
		
		WinActivate, ahk_class Shell_TrayWnd

		KeyWait Control  
		KeyWait Alt
		
		SendInput, {End}
		SendInput, {Home}
		
		BlockInput On
		Send #T
		Sleep, 100
		Loop,15{
			Send, {right}
		}
		Send, {Enter}
		
		BlockInput Off
	}
return



$!y::
SetTitleMatchMode, 2
if Winactive("Spyder"){
	Send, ^+{l}
}
else if WinActive("Tasks"){
	Keywait, Shift
	SendInput,^!{p}
	Sleep,500
	BlockInput On
	Send,{Esc}
	Sleep,200
	Send,+{Tab}
	Sleep,200
	Send,+{Tab}
	BlockInput Off
}
else if WinActive("Google 캘린더"){
	Keywait, Ctrl
	Keywait, Shift
	SendInput, ^!{1}
}
else{
	SendInput, !{y}
}
return


$!v::
SetTitleMatchMode, 2
if Winactive("Spyder"){
	Send, ^+{v}
}
else if WinActive("ahk_exe matlab.exe"){
	Send, ^{0}
	Send, ^{Tab}
}
else if WinActive("Google 캘린더"){
	Send, !^{7}
}
else{
	SendInput, !{v}
}
return

$!b::
SetTitleMatchMode, 2
if WinActive("Google 캘린더"){
	Send, !^{8}
}
else{
	SendInput, !{b}
}
return

^!v::

	isc1:=1

	
	if Winexist("ahk_exe ALPDF.exe"){
		GroupActivate, ALPDF, r
		isc1:=0
	}
	
	
	if(isc1=1){
			
		KeyWait Control 
		KeyWait Alt
		
		WinActivate, ahk_class Shell_TrayWnd


		KeyWait Control 
		KeyWait Alt
		
		SendInput, {End}
		SendInput, {Home}
		
		BlockInput On
		Send #T
		Sleep, 100
		Loop,16{
			Send, {right}
		}
		Send, {Enter}
		
		BlockInput Off
	}

return


^!a::
	SetTitleMatchMode, 2	
	

	if Winexist("Google 캘린더"){
		WinActivate Google 캘린더
	}
	else{
		KeyWait Control 
		KeyWait Alt
		KeyWait Shift
		
		WinActivate, ahk_class Shell_TrayWnd

		KeyWait Control 
		KeyWait Alt
		KeyWait Shift
		
		SendInput, {End}
		SendInput, {Home}
		
		BlockInput On
		Send #T
		Sleep, 100
		Loop,17{
			Send, {right}
		}
		Send, {Enter}
		
		BlockInput Off
	}
return


$^!s::
	SetTitleMatchMode, 2
	isc1:=1

	if Winexist("Google 스프레드시트"){
		GroupActivate, GCAL, r
		isc1:=0
	}

	
	if(isc1=1){
		KeyWait Control  
		KeyWait Alt
		KeyWait Shift
		
		WinActivate, ahk_class Shell_TrayWnd
		
		KeyWait Control  
		KeyWait Alt
		KeyWait Shift
		
		SendInput, {End}
		SendInput, {Home}
		
		
		BlockInput On
		Send #T
		Sleep, 100
		Loop,18{
			Send, {right}
		}
		Send, {Enter}
		
		BlockInput Off
	}

return

^!d::

	SetTitleMatchMode, 2
	isc1:=1
	
		if Winexist("Google 문서"){
			GroupActivate, GDOC, r
			isc1:=0
		}
	
	
	if(isc1=1){
		KeyWait Control  
		KeyWait Alt
		KeyWait Shift
		
		WinActivate, ahk_class Shell_TrayWnd

		KeyWait Control  
		KeyWait Alt
		KeyWait Shift
		
		SendInput, {End}
		SendInput, {Home}
		
		
		BlockInput On
		Send #T
		Sleep, 100
		Loop,19{
			Send, {right}
		}
		Send, {Enter}
		
		BlockInput Off
	}
return

$^!f::

	isc1:=1
	DetectHiddenWindows, On
	if Winexist("ahk_exe SciTE.exe"){
		GroupActivate, SCITE
		isc1:=0
	}
		
	if(isc1=1){
		KeyWait Control 
		KeyWait Alt
		KeyWait Shift
		
		WinActivate, ahk_class Shell_TrayWnd

		KeyWait Control 
		KeyWait Alt
		KeyWait Shift
		
		SendInput, {End}
		SendInput, {Home}
		
		
		BlockInput On
		Send #T
		Sleep, 100
		Loop,20{
			Send, {right}
		}
		Send, {Enter}
		
		BlockInput Off
	}
return

^#!a::

	isc1:=1
	;~ if(A_ComputerName = "DESKTOP-K7S692N")||(A_ComputerName = "DESKTOP-K7L6GIG")||(A_ComputerName = "DESKTOP-MHBO4SK")||(A_ComputerName = "DESKTOP-MTCBFE6") {
		if Winexist("ahk_exe SourceTree.exe"){
			WinActivate Sourcetree
			isc1:=0
		}
	;~ }
	
	if(isc1=1){
		KeyWait Control 
		KeyWait Alt
		KeyWait Shift
		
		WinActivate, ahk_class Shell_TrayWnd

		KeyWait Control 
		KeyWait Alt
		KeyWait Shift
		
		SendInput, {End}
		SendInput, {Home}
		
		
		BlockInput On
		Send #T
		Sleep, 100
		Loop,21{
			Send, {right}
		}
		Send, {Enter}
		
		BlockInput Off
	}
return

^!CapsLock::
	Keywait, Alt
	Keywait, Control
	Keywait, CapsLock
	
	Sleep, 500
	
	BlockInput On
	;~ if WinExist("ahk_exe mstsc.exe"){
		GroupActivate, MSTC, r
		
	;~ }
	
	BlockInput Off

	
	Send, {Alt UP}
	Send, {Ctrl UP}
	


return

^#!s::
	KeyWait Control 
	KeyWait Alt
	KeyWait Shift
	
	WinActivate, ahk_class Shell_TrayWnd

	KeyWait Control 
	KeyWait Alt
	KeyWait Shift
	
	SendInput, {End}
	SendInput, {Home}
	
	
	BlockInput On
	Send #T
	Sleep, 100
	Loop,22{
		Send, {right}
	}
	Send, {Enter}
	
	BlockInput Off
return

^#!d::
	KeyWait Control 
	KeyWait Alt
	KeyWait Shift
	
	WinActivate, ahk_class Shell_TrayWnd

	KeyWait Control 
	KeyWait Alt
	KeyWait Shift
	
	SendInput, {End}
	SendInput, {Home}
	
	
	BlockInput On
	Send #T
	Sleep, 100
	Loop,23{
		Send, {right}
	}
	Send, {Enter}
	
	BlockInput Off
return

^#!f::
	KeyWait Control 
	KeyWait Alt
	KeyWait Shift
	
	WinActivate, ahk_class Shell_TrayWnd

	KeyWait Control 
	KeyWait Alt
	KeyWait Shift
	
	SendInput, {End}
	SendInput, {Home}
	
	
	BlockInput On
	Send #T
	Sleep, 100
	Loop,24{
		Send, {right}
	}
	Send, {Enter}
	
	BlockInput Off
return


#+1::
    Run %A_ScriptDir%
return



+space::
	Send, {vk15sc138}
return


sc1F1::
	Send, {space}
return



#space::
KeyWait LWin
if winactive("ahk_exe Code.exe")|| winactive("ahk_exe Code - Insiders.exe") || winactive("ahk_exe VSCodium.exe"){
	Send, {F8}
}
return


#F2::
	WinMaximize, A
return

#F3::
	Reload
return

!+1::
	Keywait, Alt
	Keywait, Lshift
	Send, #6
return

^!+1::

	SetTitleMatchMode, 2
	isc1:=1
	
	if Winexist("ahk_exe filezilla.exe"){
		WinActivate
		isc1:=0
	}
	
return

!+2::
	Keywait, Alt
	Keywait, Lshift
	if WinExist("ahk_exe doublecmd.exe"){
		WinActivate ahk_exe doublecmd.exe
	}
	else{
		run, C:\Program Files (x86)\Double Commander\doublecmd.exe
	}
return

!+3::
	Keywait, Alt
	Keywait, Lshift
		
	SetTitleMatchMode, 2

	if Winexist("ahk_exe Code.exe"){
			GroupActivate, CODE, r
	}
	else{
		Send, #8
	}
	
return

;~ $#3::
;~ if (A_ComputerName = "DESKTOP-K7L6GIG"){
	;~ GroupActivate VMWARE, R
;~ }
;~ else{
	;~ if !Winexist("ahk_exe MATLAB.exe"){
	;~ MsgBox, 4,, Would you like to continue Matlab? (press Yes or No)
	;~ IfMsgBox Yes
		;~ Send, #{3}
	;~ }
	;~ else{
		;~ GroupActivate MATLAB, R
	;~ }	
;~ }

;~ return



!+4::
	Keywait, Alt
	Keywait, Lshift
	Send, #9
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!#q::
if WinActive("ahk_exe AcroRd32.exe"){
	;~ KeyWait A
	;~ KeyWait LWin
	Send, {LShift Down}
	Loop,20{
		Click, WheelUp
		Sleep, 100
	}
	Send, {LShift Up}
}
else{
	Send, !{Left}
}
	
return

!#w::
if WinActive("ahk_exe AcroRd32.exe"){
	;~ KeyWait Alt
	;~ KeyWait LWin
	Send, {LShift Down}
	Loop,20{
		Click, WheelDown
		Sleep, 100
	}
	Send, {LShift Up}
}
else{
	Send, !{Right}
}
	

return



;;;;;;;;;;;$$$$$$$$$$$$$;;;;;;;;;;;;;;;;;;;
!+r::
	KeyWait, Alt
	KeyWait, Shift

	capstate := GetKeyState("Capslock", "T")
	if(capstate){
		SetCapsLockState , AlwaysOff
		run %A_ScriptDir%\personal_v.ahk
	}
	else{
		SetTitleMatchMode, 2
		if WinActive("ahk_exe Hwp.exe"){
			Keywait, Alt
			KeyWait, Shift
			Send, !{k}
			Sleep, 100
			Send, {Enter}
		}
		else if WinActive("ahk_class OpusApp") || WinActive("ahk_class PPTFrameClass"){
			KeyWait, Alt
			KeyWait, Shift
			Send, !{r}
			Sleep,200
			Send, {s}
		}
		else if WinActive("Google ����"){
			KeyWait, Alt
			KeyWait, Shift
			Send, !{t}
			Sleep, 200
			Send, {s}
			Sleep, 200
			Send, {s}
		}
		
	}



return


$^F1::
	KeyWait, Control

	if WinActive("ahk_exe doublecmd.exe") || WinActive("ahk_class TTOTAL_CMD") || WinActive("ahk_class TTOTAL_CMD"){
		SendInput, ^{F1}
	}
	else if WinActive("ahk_exe Explorer.EXE"){
		SendInput, {LAlt Down}
		Sleep, 50
		SendInput, {LAlt Up}
		Sleep,100
		Send, {v}
		Sleep, 100
		Send, {o}
		Send, {Enter}
	}
	
	else if WinActive("Tasks"){
		SendInput, ^{Enter}
	}
	else{
		Send, ^{F1}
	}

return  

$^F2::
	KeyWait, Control
	capstate := GetKeyState("Capslock", "T")
	if(capstate){
		run %windir%\system32\mstsc.exe
		SetCapsLockState , AlwaysOff
	}
	else{
		if WinActive("ahk_exe doublecmd.exe") || WinActive("ahk_class TTOTAL_CMD")|| WinActive("ahk_class TTOTAL_CMD"){
			SendInput, ^{F2}
		}
		else if WinActive("ahk_exe Explorer.EXE"){
			SendInput, {LAlt Down}
			Sleep, 50
			SendInput, {LAlt Up}
			Sleep,100
			Send, {v}
			Sleep, 100
			Send, {o}
			Send, {Down}
			Send, {Enter}
		}
	}

return

$^F3::
	KeyWait, Control

	capstate := GetKeyState("Capslock", "T")
	if(capstate){
		
		if WinExist("ahk_class MSPaintApp"){
			GroupActivate PAINT
		}
		else{
			run %windir%\system32\mspaint.exe
			WinWait ahk_class MSPaintApp
			WinActivate ahk_class MSPaintApp
		}
		SetCapsLockState , AlwaysOff
	}
	else{
		if WinActive("ahk_exe Explorer.EXE"){
			SendInput, {LAlt Down}
			Sleep, 50
			SendInput, {LAlt Up}
			Sleep,100
			Send, {v}
			Sleep, 100
			Send, {o}
			Send, {Down}
			Send, {Down}
			Send, {Enter}
		}
		else if WinActive("ahk_class MSPaintApp"){
			GroupActivate PAINT
		}
		else{
			SendInput, ^{F3}
		}
		
	}	

return

$^F4::
	KeyWait, Control
	
	capstate := GetKeyState("Capslock", "T")
	if(capstate){
		
		if WinExist("ahk_class Notepad"){
			GroupActivate NOTEPAD
		}
		else{
			run %windir%\system32\notepad.exe
			WinWait ahk_class Notepad
			WinActivate ahk_class Notepad
		}
		SetCapsLockState , AlwaysOff
	}
	else{
		if WinActive("ahk_exe Explorer.EXE"){
			SendInput, {LAlt Down}
			Sleep, 50
			SendInput, {LAlt Up}
			Sleep,100
			Send, {v}
			Sleep, 100
			Send, {o}
			Send, {Down}
			Send, {Down}
			Send, {Down}
			Send, {Enter}
		}
		else{
			SendInput, ^{F4}
		}
	}
	
return
;;;;;;;;;;;;;$$$$$$$$$$$$$$$$$4;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
$!q::
	if WinActive("Quick Search for Autohotkey"){
		ControlClick, Button1, Quick Search for Autohotkey
	}
	else if WinActive("Microsoft To-Do"){
		Keywait, Alt
		BlockInput,On
		DPIsize:=checkDPIsize()
		Dpiconv:=DPIsize/96
		xx:=42*Dpiconv
		yy:=42*Dpiconv
		CoordMode, Mouse, Client
		;~ MouseClick, left, xx, yy,2
		MouseClick, left, xx, yy
		Sleep,100
		MouseClick, left, xx, yy
		Sleep,100
		Send, {Tab}
		Send, {Down}
		Loop,15{
			Send, {Up}
		}
		Send, {Tab}
		Loop,5{
			Send, {Down}
		}
		Send, {Enter}
		Loop,7{
			Send,{Tab}
		}
		BlockInput,Off
	}
	else{
		Sendinput,!{q}
	}
return


$!r::
	if WinActive("Quick Search for Autohotkey"){
		ControlClick, Button1, Quick Search for Autohotkey
	}
	else if WinActive("Tasks"){
		SendInput, ^!{9}
		Sleep,100
		SendInput,{Up}
		Sleep,50
		Send,{Enter}
	}
	else{
		Sendinput,!{r}
	}
return

$!w::
	if WinActive("Quick Search for Autohotkey"){
		ControlClick, Button1, Quick Search for Autohotkey
	}
	else if WinActive("Google 캘린더"){
		Keywait, Ctrl
		Keywait, Shift
		SendInput, ^!{3}
	}
	else{
		Sendinput, !{w}
	}
return

$!x::
	if WinActive("Google 캘린더"){
		Keywait, Ctrl
		Keywait, Shift
		SendInput, ^!{4}
	}
	else{
		Sendinput, !{x}
	}
return


$!e::
	if WinActive("Microsoft To-Do"){
		Keywait, Alt
		BlockInput,On
		DPIsize:=checkDPIsize()
		Dpiconv:=DPIsize/96
		xx:=42*Dpiconv
		yy:=42*Dpiconv
		CoordMode, Mouse, Client
		;~ MouseClick, left, xx, yy,2
		MouseClick, left, xx, yy
		Sleep,100
		MouseClick, left, xx, yy
		Sleep,100
		Send, {Tab}
		Send, {Down}
		Loop,15{
			Send, {Up}
		}
		Send, {Tab}
		Loop,7{
			Send, {Down}
		}
		Send, {Enter}
		Loop,7{
			Send,{Tab}
		}
		BlockInput,Off
	}
	else{
		Sendinput, !{e}
	}
return

!+q::
	
	Keywait Shift
	Keywait Alt
	Send,	{End}
	Send, {Shift Down}{Home}{Shift Up}
return

!+w::
	
	Keywait Shift
	Keywait Alt
	Send,	{Ctrl Down}{Left}{Ctrl Up}
	Send,	{Ctrl Down}{Shift Down}{Right}{Shift Up}{Ctrl Up}
return



$!+e::
SetTitleMatchMode, 2
if WinActive("ahk_exe Hwp.exe"){
	Send, ^{n}{t}
}
else if WinActive("ahk_class OpusApp") || WinActive("ahk_class PPTFrameClass"){
	KeyWait, Alt
	KeyWait, Shift
	Send, !{n}
	Sleep,200
	Send, {t}
}
else if WinActive("Google ����"){
	Send, !{i}
	Sleep, 200
	Send, !{t}
}
else{
	Send,!+{e}
}
return


$!+y::
if WinActive("ahk_class OpusApp") || WinActive("ahk_class PPTFrameClass"){
	KeyWait, Alt
	KeyWait, Shift
	Send, !{n}
	Sleep,200
	Send, {x}
	Sleep,200
	Send, {h}
}
return



$;::
if WinActive("ahk_exe MATLAB.exe"){
	SendInput {;}
	SendInput {Tab}
	SendRaw `%
	englishmode()
	SendRaw JY_
	FormatTime, CurrentDateTime,, yy_MMdd_
	SendInput %CurrentDateTime%
}
else{
	SendInput {;}
}
return

$!+;::
if WinActive("ahk_exe MATLAB.exe"){
	SendInput {;}
}
else{
	SendInput {;}
}
return


F1::
	Send, {Enter}
return

^!F1::
	Send,{F1}
return





$!F1::
	
	if winactive("pygdocseditor")|| winactive("pygdocdiary"){
		WinMinimize
	}
	else{
		Send !{F4}
	}
	SetCapsLockState , AlwaysOff

return

!F2::
	Send {Del}
return


#F4::

if WinActive("ahk_exe Explorer.EXE")||WinActive("ahk_exe doublecmd.exe")|| WinActive("ahk_class TTOTAL_CMD"){
	Send, +{F10}
	Send, {a}
	Send, {Enter}

}
return



$!5:: 
	FormatTime, CurrentDateTime,, yy_MMdd_
	SendInput %CurrentDateTime%	
return



!+5:: 
	FormatTime, CurrentDateTime,, yy_MMdd_HHmm_
	SendInput %CurrentDateTime%
return

$!6:: 
	FormatTime, CurrentDateTime,, yyyy-MM-dd
	Send %CurrentDateTime%
return



Numpad0::
MouseClick, left 
return



$^g::
if WinActive("ahk_class OpusApp") || WinActive("ahk_class PPTFrameClass") || WinActive("ahk_exe EXCEL.exe"){
	Keywait, Ctrl
	Send !{h}
	Send {f}
	Send {c}
	Send {Up}{Up}{Up}{Up}
	Send {Enter}
}
else if WinActive("ahk_exe Hwp.exe"){
	Send ^{m}
	Send {r}
}
else{
	Send, ^{g}
}
return

$^+g::
if WinActive("ahk_class OpusApp") || WinActive("ahk_class PPTFrameClass") || WinActive("ahk_exe EXCEL.exe"){
	Keywait, Ctrl
	Keywait, Shift
	Send !{h}
	Send {f}
	Send {c}
	Send {Right}
	Send {Enter}

}

else if WinActive("ahk_exe Hwp.exe"){
	Send ^{m}
	Send {k}
}
else{
	send, ^+{g}
}
return


#IfWinActive, ahk_class IEFrame 
+WheelUp:: ; scroll right 
	BlockInput On
	CoordMode, Pixel, Client
	
	WinGetPos, X1, Y1, Width1, Height1, A
	Height2:=Height1-20

	Loop, 1{
		MouseClick, left, 20, Height2
	}

	
	BlockInput Off
	SendInput, {Shift Up}
	

return 

+WheelDown:: ; scroll left 
	BlockInput On
	CoordMode, Pixel, Client
	
	WinGetPos, X1, Y1, Width1, Height1, A
	Width2:=Width1-40
	Height2:=Height1-20

	Loop, 1{
		MouseClick, left, Width2, Height2
	}
	
	BlockInput Off
	SendInput, {Shift Up}
return


#IfWinActive

!+a::
DetectHiddenWindows, On
SetTitleMatchMode, 2
If WinExist("Jungyong's Record"){
	WinActivate, ahk_exe ahkgui.exe
}
else if WinExist("pygdocseditor2"){
	WinActivate, pygdocseditor2
}
else if WinExist("Edit Gdocs address"){
	WinActivate, Edit Gdocs address
}
else{
run, run_pygdocs.ahk
}
return




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;IMEI check;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

hangulMode(){
    if(imeCheckWintitle() = "0")
    {
        Send, {vk15sc138}   
        sleep, 500
    }
}

 
englishMode(){
    if(imeCheckWintitle() <>"0")
    {
        Send, {vk15sc138}   
     }
}

imeCheckWintitle(WinTitle="")
{
    if(WinTitle="") 
           WinTitle:="A"
    WinGet,hWnd,ID,%WinTitle%
   return imeCheckHWND(hWnd)
   
}

imeCheckHWND( hWnd )
{
    Return Send_ImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"")
}

 
ImmGetDefaultIMEWnd(hWnd)
{
    return DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
}
Send_ImeControl(DefaultIMEWnd, wParam, lParam)
{
    detectSave := A_DetectHiddenWindows       
    DetectHiddenWindows,ON                    
    SendMessage 0x283, wParam,lParam,,ahk_id %DefaultIMEWnd%
    if (detectSave <> A_DetectHiddenWindows)
        DetectHiddenWindows,%detectSave%
    return ErrorLevel
}

