; GCD function      (Full Functional)
; Author: SHAHiD 
; Date: 28 Sep 16
org 100h
.model small
.stack 100h
.data
    
    a dw 40
    b dw 20
    pc dw ?
    temp dw 0
.code
main proc
      
      push b
      push a
      call gcd
      
      pop dx
      or dx,30h
      mov ah,2
      int 21h
     
      
main endp
mov ah,4ch
int 21h
gcd proc
    pop pc 
    
    pop ax
    pop bx
    
    
    cmp ax,0
    je gcd_b
    
    cmp bx,0 
    je gcd_a
    
    looping:
    cmp bx,0
    je gcd_found
    
    mov temp,bx
    div bl
    mov bl,ah
    mov ax,temp
    jmp looping
    
    gcd_found:
    push ax
    jmp end  
    
    gcd_b:
    push bx
    jmp end
    
    gcd_a:
    push ax
    
    end:
         
    push pc
    ret
gcd endp

end main       
