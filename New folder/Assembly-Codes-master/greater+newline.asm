org 100h
.model small
.stack 100h
.data  

m db "1st input is greater $"
.code


main proc
    mov ah,1
    int 21h
    sub al,48
    mov bl,al
    
    
    mov ah,1
    int 21h
    sub al,48
    
    
    
    cmp bl,al
    jg grater
    jmp exit
    
    grater: 
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    mov ah,9
    lea dx,m
    int 21h
 
    
    exit:
    
endP
mov ah,4ch
int 21h
end main