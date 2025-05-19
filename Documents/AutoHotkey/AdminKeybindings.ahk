#SingleInstance
;;;;;;;;;;;! Key Bindings ;;;;;;;;;;;
;;;;? Glaze WM ;;;;
;; Rebinding Workspaces to Win + Num
#1::Send #!1
#2::Send #!2
#3::Send #!3
#4::Send #!4
#5::Send #!5
#6::Send #!6
#7::Send #!7
#8::Send #!8
#9::Send #!9
#0::Send #!0


;; Rebinding Moving Windows to Win + Shfit + Num
#+1::Send !+1
#+2::Send !+2
#+3::Send !+3
#+4::Send !+4
#+5::Send !+5
#+6::Send !+6
#+7::Send !+7
#+8::Send !+8
#+9::Send !+9
#+0::Send !+0


;;;;? Power Toys ;;;;
#+Return::Send !{Space} ;* Launch flow launcher ==> Win + Shift + Return

;;;;? Arrow Keys ;;;;
!h::Send {Left}
!j::Send {Down}
!k::Send {Up}
!l::Send {Right}
!^h::Send ^{Left}
!^j::Send ^{Down}
!^k::Send ^{Up}
!^l::Send ^{Right}

;;;;? Window Modifications ;;;;
#+c::Send !{F4} ;* Close a program ==> Win + Shift + C
#+w::Send !{F4} ;* Close a program ==> Win + Shift + W
#+,::Send #+{Left} ;* Send window to left screen ==> Win + Shift + ,
#+.::Send #+{Right} ;* Send window to right screen ==> Win + Shift + .
#^,::Send #^{Left} ;* Swap to left desktop
#^.::Send #^{Right} ;* Swap to right desktop

;;;;? Miscelanious ;;;;
CapsLock::Delete ;* Map Caps Lock to Delete
#+/:: ;* Open a file listing all the keybindings. ==> Win + Shift + /
    FilePath := A_MyDocuments "\AutoHotkey\Keybindings.html"

    Run, %FilePath%
return
