; Prime check with proc 
; Author: SHAHiD 
; Date: 25 Sep 16  ; completed in 26 Sep 16
org 100h
.model small
.stack 100h
.data
    
    flag db 1
    i db 2 
    pc dw ?
    
.code
main proc
     
     mov bx,27
     push bx
     call PrimeCheck


main endp
mov ah,4ch
int 21h

PrimeCheck proc
    
    ;initialize i each time


    mov i,2
    
    pop pc
    pop bx 
    

    for: 
    
    mov ax,bx
    cmp al,i
    je prime
     
    div i
    cmp ah,0
    je exit:
    inc i  
     
    jmp for
    
    prime:
    mov ah,2
    mov dx,'Y'
    int 21h
    jmp end
    
    exit:
    mov ah,2
    mov dx,'N'
    int 21h
    jmp end
    
    end:
      
      push pc
    ret
PrimeCheck endp


end main       
