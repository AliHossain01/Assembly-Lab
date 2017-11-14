;11984
;Thermal change



org 100h
.model small
.stack 100h
.data
    
    
    i db 0
    
.code
main proc
    
    mov ah,1
    int 21h
    sub al,48 
    mov bl,al 
    
    start:
    cmp i,bl
    jg exit   
    inc i
    
      ;;; float !!! :-(
     
    
    jmp start   

exit:
main endp
mov ah,4ch
int 21h
end main