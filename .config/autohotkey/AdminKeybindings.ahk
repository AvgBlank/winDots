#Requires AutoHotkey v2.0
#SingleInstance Force

; Disable Win+L locking (must be run as admin)
InstallKeybdHook
SetLock(enabled) {
    RegWrite(
        enabled,
        "REG_DWORD",
        "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System",
        "DisableLockWorkstation"
    )
}
SetLock(1)


; -------------- AutoHotkey Related --------------
; --- Reload Script ---
#+r::Reload


; -------------- Glaze WM Related --------------
;; Rebinding Workspaces to Win + Num
; #1::Send #!1
; #2::Send #!2
; #3::Send #!3
; #4::Send #!4
; #5::Send #!5
; #6::Send #!6
; #7::Send #!7
; #8::Send #!8
; #9::Send #!9
; #0::Send #!0
;
;
; ;; Rebinding Moving Windows to Win + Shfit + Num
; #+1::Send !+1
; #+2::Send !+2
; #+3::Send !+3
; #+4::Send !+4
; #+5::Send !+5
; #+6::Send !+6
; #+7::Send !+7
; #+8::Send !+8
; #+9::Send !+9
; #+0::Send !+0
;
; ;; Rebinding Moving between Windows
; #h::Send("{LWin down}{Alt down}{h down}")
; #h up::Send("{h up}{Alt up}{LWin up}")
;
; #j::Send("{LWin down}{Alt down}{j down}")
; #j up::Send("{j up}{Alt up}{LWin up}")
;
; #k::Send("{LWin down}{Alt down}{k down}")
; #k up::Send("{k up}{Alt up}{LWin up}")
;
; #l::Send("{LWin down}{Alt down}{l down}")
; #l up::Send("{l up}{Alt up}{LWin up}")
;
;
; -------------- Komorebi Related --------------
; --- Komorebic Function ---
Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

; --- Move across workspaces ---
#1::Komorebic("focus-workspace 0")
#2::Komorebic("focus-workspace 1")
#3::Komorebic("focus-workspace 2")
#4::Komorebic("focus-workspace 3")
#5::Komorebic("focus-workspace 4")
#6::Komorebic("focus-workspace 5")
#7::Komorebic("focus-workspace 6")
#8::Komorebic("focus-workspace 7")
#9::Komorebic("focus-workspace 8")
#0::Komorebic("focus-workspace 9")
#^,::Komorebic("cycle-workspace previous")
#^.::Komorebic("cycle-workspace next")

; --- Move windows across workspaces ---
#+1::Komorebic("move-to-workspace 0")
#+2::Komorebic("move-to-workspace 1")
#+3::Komorebic("move-to-workspace 2")
#+4::Komorebic("move-to-workspace 3")
#+5::Komorebic("move-to-workspace 4")
#+6::Komorebic("move-to-workspace 5")
#+7::Komorebic("move-to-workspace 6")
#+8::Komorebic("move-to-workspace 7")
#+9::Komorebic("move-to-workspace 8")
#+0::Komorebic("move-to-workspace 9")

; --- Send windows across workspaces ---
#^1::Komorebic("send-to-workspace 0")
#^2::Komorebic("send-to-workspace 1")
#^3::Komorebic("send-to-workspace 2")
#^4::Komorebic("send-to-workspace 3")
#^5::Komorebic("send-to-workspace 4")
#^6::Komorebic("send-to-workspace 5")
#^7::Komorebic("send-to-workspace 6")
#^8::Komorebic("send-to-workspace 7")
#^9::Komorebic("send-to-workspace 8")
#^0::Komorebic("send-to-workspace 9")

; --- Monitor Related ---
#+,::Komorebic("cycle-move-to-monitor previous")
#+.::Komorebic("cycle-move-to-monitor next")

; --- Window Modifications ---
#+w::Komorebic("close")
#+m::Komorebic("minimize")
#+c::Send("!{F4}")

; --- Focus windows ---
#h::Komorebic("focus left")
#j::Komorebic("focus down")
#k::Komorebic("focus up")
#l::Komorebic("focus right")
#+[::Komorebic("cycle-focus previous")
#+]::Komorebic("cycle-focus next")

; --- Move windows ---
#+h::Komorebic("move left")
#+j::Komorebic("move down")
#+k::Komorebic("move up")
#+l::Komorebic("move right")

; --- Resize windows ---
#=::Komorebic("resize-axis horizontal increase")
#-::Komorebic("resize-axis horizontal decrease")
#+=::Komorebic("resize-axis vertical increase")
#+_::Komorebic("resize-axis vertical decrease")

; --- Manipulate windows ---
#+t::Komorebic("toggle-float")
#+f::Komorebic("toggle-monocle")

; --- Window manager options ---
!+r::Komorebic("retile")
!+p::Komorebic("toggle-pause")
#+q::Komorebic("stop")

; --- Layouts ---
!+x::Komorebic("flip-layout horizontal")
!+y::Komorebic("flip-layout vertical")


; -------------- Misc --------------
; --- App Runner ---
#+Enter::Send("!{Space}")

; --- Arrow Keys (Alt + h/j/k/l) ---
!h::Send("{Left down}")
!h up::Send("{Left up}")
!j::Send("{Down down}")
!j up::Send("{Down up}")
!k::Send("{Up down}")
!k up::Send("{Up up}")
!l::Send("{Right down}")
!l up::Send("{Right up}")

; --- Ctrl + Alt + h/j/k/l ---
!^h::Send("^{Left down}")
!^h up::Send("^{Left up}")
!^j::Send("{PgDn down}")
!^j up::Send("{PgDn up}")
!^k::Send("{PgUp down}")
!^k up::Send("{PgUp up}")
!^l::Send("^{Right down}")
!^l up::Send("^{Right up}")

; --- Keybindings Documentation ---
#+/:: {
    FilePath := A_MyDocuments "\AutoHotkey\Keybindings.html"
    Run(FilePath)
}

; --- Other ---
CapsLock::Send("{Delete}")
+CapsLock::Send("+{Delete}")
^CapsLock::Send("^{Delete}")


; -------------- Power Menu --------------
#+x::{
    SingleKey := InputHook("L1", "{Esc}")
    SingleKey.Start()
    SingleKey.Wait()
    key := SingleKey.Input
    switch key {
        case "u":
            Shutdown(1)
        case "r":
            Shutdown(2)
        case "h":
            DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)
        case "s":
            Shutdown(0)
        case "l":
            SetLock(0)
            DllCall("LockWorkStation")
            Reload
    }
}

