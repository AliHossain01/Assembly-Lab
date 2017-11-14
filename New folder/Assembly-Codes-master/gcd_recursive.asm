; GCD RECURCIVE !!   (Not full functional)
; Author: SHAHiD 
; Date: 28 Sep 16
org 100h
.model small
.stack 100h
.data
   pc dw ?
   a db 25
   b db 5 
.code
main proc
      
  call gcd 
  pop dx  
  add dx,30h
  mov ah,2
  int 21h 
      
main endp
mov ah,4ch
int 21h
      
gcd proc
    
    pop pc
    
     mov al,a
     mov bl,b
     
     div bl
     
     cmp ah,0
     je return
      
      mov bl,ah
      mov al,b
      
      call gcd
      
      return:
      push bx
    
    push pc
ret
gcd endp   
      
end main       
