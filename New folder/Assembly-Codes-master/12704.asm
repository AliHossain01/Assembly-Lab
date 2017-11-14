;Little master
;12704
;incomplete

org 100h
.model small
.stack 100h
.data
    db i 0
.code
main proc

    mov ah,1
    int 21h
    sub al,48
    mov bl,al
    
    repeat:
    mov ah,1      ;input x
    int 21h
    sub al,48
    mov cl,al 
    
     mov ah,1     ;input y
    int 21h
    sub al,48
    mov ch,al
    
     mov ah,1     ;input r
    int 21h
    sub al,48
    mov bl,al
     
        
        
        
        
        
        
        
        
    int i
    cmp bl,i
   
    jg exit
    jmp repeat







exit:
endp
mov ah,4ch
int 21h
end main