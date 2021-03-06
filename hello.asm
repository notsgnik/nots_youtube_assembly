;------------------------------------------------------------------------------|\
;                                                              _____           |\
;      Autor: Notsgnik                                       /||   /           |\
;      Email: Labruillere gmail.com                         / ||  /            |\
;      website: notsgnik.github.io                         /  || /             |\
;      License: GPL v3                                    /___||/              |\
;                                                                              |\
;------------------------------------------------------------------------------|

;hello.asm

extern MessageBoxA : proc
extern ExitProcess : proc

.data
    text db 'Bonjour le Monde!', 0
    nom  db 'Boite',  0

.code

    main proc frame
        sub rsp, 28h
        .allocstack 28h
        .endprolog
        xor r9, r9
        lea r8, nom
        lea rdx, text
        xor rcx, rcx
        call MessageBoxA
        xor rcx, rcx
        call ExitProcess
        add rsp, 28h
    main endp
end

;ml64 hello.asm /link /subsystem:windows /defaultlib:kernel32.lib /defaultlib:user32.lib /entry:main
