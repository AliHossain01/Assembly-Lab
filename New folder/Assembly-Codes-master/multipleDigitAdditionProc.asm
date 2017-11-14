; Multiple number add with proc 
; Author: SHAHiD
; Date: 25 Sep 16  
org 100h
.model small
.stack 100h
.data
  
.code
main proc

      
     call addition
      

main endp
mov ah,4ch
int 21h    

addition proc
    
    mov ax,10
    mov bx,5
   
    add ax,bx
    
    push ax   
    pop bx
    call output
    
    
   ret
addition endp
  
  
output proc
    
    cmp bx,0        
    jge print       ;skip - if flag is 0
    mov ah,2
    mov dl,'-'
    int 21h
    neg bx           ; 2's complement of bx
    
    print:
    mov ax,bx
    xor cx,cx
    mov bx,10
    
    repeat:
    xor dx,dx
    div bx           ;div ax(number) by dx (10)
    push dx          ;push dx onto the stack
    
    inc cx           ;push for digit count
    or ax,ax
    jne repeat
     
     
    mov ah,2
    display:
    pop dx           ;pop a value from stack to dx
    or dl,30h        ;convert decimal to ascii
    int 21h
    loop display     ;loop until cx!=0
    
    ret
    output endp  
end main