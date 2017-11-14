; hasmot the brave warrior
org 100h
.model small
.stack 100h
.data



.code

main proc
    
    mov ah,1
    int 21h 
    sub al,48
    mov bl,al
    
    
    mov ah,1
    int 21h
    sub al,48
  
    cmp al,bl
    jg alisgreater
    jl blisgreater
    
    alisgreater:
    sub al,bl
    add al,48
    mov ah,2
    mov dl,al
    int 21h
    jmp end
    
    
    blisgreater:
     sub bl,al       
    add bl,48
    mov ah,2
    mov dl,bl
    int 21h
    jmp end
           
    end:       
  endp
mov ah,4ch
int 21h
end main    