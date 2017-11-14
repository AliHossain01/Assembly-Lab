;10071
;Back to high school physics

org 100h
.model small
.stack 100h
.data 
 x db 2
.code

main proc
    
    mov ah,1
    int 21h
    sub al,48
    mov bl,al
    
    mov ah,1
    int 21h
    sub al,48  
    
    
    
    mul bl
    mul x
    
    mov ah,2  
    add ax,48
    mov dx,ax
    int 21h
    
    
endp
mov ah,4ch
int 21h
end main
    