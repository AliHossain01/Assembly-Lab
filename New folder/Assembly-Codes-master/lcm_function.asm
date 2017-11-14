; LCM function
; Author: SHAHiD 
; Date: 28 Sep 16
org 100h
.model small
.stack 100h
.data
   
    pc dw ?
    a dw 100
    b dw 4 
    i dw 0
    
.code
main proc
      
       

       call lcm
       
       pop dx
       or dx,30h
       mov ah,2
       int 21h
       
       
      
main endp
mov ah,4ch
int 21h

lcm proc  
   
    pop pc 
    mov ax,a
    mov i,ax 
    mov dx,ax     ; reserve to operate later
    mov bx,b
    while:
    
    div bl       ; Never forget to divide by low register or a data
    cmp ah,0
    je break
    
    add dx,i 
    mov ax,dx
    jmp while
    
    
     break:
     push dx
       
    push pc
    ret
lcm endp     
 
end main       
