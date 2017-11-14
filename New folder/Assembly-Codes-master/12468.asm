;12468
;Zapping
org 100h
.model small
.stack 100h
.data
    line db 10,13,"$"
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
    jg albl
    jle blal
    jmp exit:
    
    albl:
    sub al,bl
    cmp al,5
    jg  minus
    jle print
    jmp exit 
    
    blal:
    sub bl,al 
    mov al,bl
    cmp al,5
    jg  minus
    jle print
    jmp exit
    
    minus:
    mov cl,10
    sub cl,al
    jmp print
    jmp exit:
    
    print: 
    mov ah,9
    lea dx,line
    int 21h
    
    mov ah,2 
    add cl,48
    mov dl,cl
    int 21h

exit: 
main endp
mov ah,4ch
int 21h
end main