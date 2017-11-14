.model small
.stack 100h
.data
    msg db "Enter your Uppercase letter: $"
     msg2 db "Result lower case letter: $"
.code
main proc
    
    mov ax, @data
    mov ds, ax
              ; displaying msg
   lea dx, msg
    mov ah, 9
    int 21h
                ; first input from user
    mov ah, 1
    int 21h
    add al, 32
    mov cl, al  
               ; dispaying newline + cret
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    mov ah,2 
    int 21h
              ; displaying second msg
    lea dx, msg2
    mov ah, 9
    int 21h              
    
    ; displaying result
    
    mov dl, cl
    mov ah, 2
    int 21h
    
    mov ah, 4ch
    int 21h
    main endp
end main