include 'emu8086.inc'
.model small
.stack 100h
.data
.code
main proc
    
    call procedure_name
    
    exit:
    mov ax, 4ch
    int 21h
    
    main endp 

    ; new procedure
    
    procedure_name proc
                ; push for saving all value
        push ax
        push bx
        push cx
        push dx
        push si
        push di  
        
                printn "Procedure executed" 
                printn "Hello there"
                printn "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG"
                printn "this is an assembly program... this program is for learning procedure"
                printn "This is the last string"
                       
               ; pop for returning main proc's last value
        pop di
        pop si
        pop dx
        pop cx
        pop bx
        pop ax
            
            ret
        procedure_name endp

end main
