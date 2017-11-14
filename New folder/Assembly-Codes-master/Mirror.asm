; Reverse a string using stack
; Author: SHAHiD 
; Date:25 Sep 16
org 100h
.model small
.stack 100h
.data
   
    
.code
main proc
     xor cx,cx    ; empty cx
     input:
     mov ah,1
     int 21h
     cmp al,0dh
     je exit
     push ax
     inc cx      ; counts input 
     jmp input       
      
     exit:
     mov ah,2  
     mov dx,0dh
     int 21h 
     mov dx,0ah
     int 21h
     display:
     pop dx
     int 21h
     loop display
     
     
main endp
mov ah,4ch
int 21h



end main       
