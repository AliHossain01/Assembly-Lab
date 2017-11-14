;Back to high school physics
;10071

org 100h
.model small
.stack 100h
.data
    t db 2
.code
main proc

    start:
    mov ah,1
    int 21h
    sub al,48 
    mov bl,al
     
    mov ah,1
    int 21h
    sub al,48
    mul bl
    mul t
          
    add al,48      
    mov dl,al
    mov ah,2
    int 21h
    
    mov dl,0h
    int 21h
    mov dl,0ah  
    
    ;print new line
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    jmp start

          
   jmp start 

main endp
mov ah,4ch
int 21h
end main