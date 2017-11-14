include 'emu8086.inc'
.model small
.stack 100h
.code
main proc  
    
    printn 'Enter your first input '
    printn 'Enter your first input '
    
    
    mov ah, 4ch
    int 21h
    main endp
end main