; Binary to decimal
include 'emu8086.inc'
.model small
.stack 100h
.data

.code
main proc
    mov ax, @data
    mov ds, ax
    
    xor bx, bx  ; clear bx register
    mov ah, 1
    for1:
        int 21h
        cmp al, 0dh
        je end_for1
        sub al, 48
        shl bx, 1
        or bl, al
        jmp for1
     end_for1:
        printn
        mov ah, 2
        mov dl, bl
        add dl, 48
        int 21h
        
        mov ah, 4ch
        int 21h 
        
    
    main endp
end main