; volume of a triangle

org 100h
.model small
.stack 200h
.data 
     n1 db "Enter First Number: $"
     n2 db "Enter Second Number: $"
.code


main proc
    mov ah,9        ; message for input one
    lea dx,n1 
    int 21h
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    mov ah,1        ; input number one
    int 21h
    sub al,48
    mov bl,al
    
    
    mov ah,9        ; message for number 2
    lea dx,n2 
    int 21h
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    mov ah,1        ; input number 2
    int 21h
    sub al,48
    
    mul bl          ; multiply and show
    add al,48
    mov ah,2
    mov dl,al
    int 21h   
    
endp
mov ah,4ch
int 21h
end main