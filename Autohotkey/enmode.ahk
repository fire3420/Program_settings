

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

