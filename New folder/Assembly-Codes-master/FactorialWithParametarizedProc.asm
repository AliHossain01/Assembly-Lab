; Factorial of a given number 
; Author: SHAHiD
; Date: 25 Sep 16                
org 100h
.model small
.stack 100h
.data
  
.code
main proc

     mov ax,5
     push ax
     call factorial

main endp
mov ah,4ch
int 21h          

factorial proc 
     pop cx
      
     pop bx 
     mov ax,bx
     for:  
     
     sub bx,1
     cmp bx,1
     je end
     
     mul bx
     jmp for
     
     end:
      
     push ax
     call output_function
    
    ret
factorial endp

output_function proc
    xor ax,ax
    xor bx,bx
    pop cx
    pop bx
    
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
    
    inc cx
    or ax,ax
    jne repeat
     
     
    mov ah,2
    display:
    pop dx           ;pop a value from stack to dx
    or dl,30h        ;convert decimal to ascii
    int 21h
    loop display     ;loop until cx!=0
    
    ret
    output_function endp
end main