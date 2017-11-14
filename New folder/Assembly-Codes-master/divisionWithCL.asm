; Successfull division with arguments
; Author: SHAHiD 
; Date: 25 Sep 16
org 100h
.model small
.stack 100h
.data
   
     res db ?
.code
main proc
   
   mov ax,300
   mov cl,4      ; divided by 2^4 = 16
                 ; what will if we want to divide by 3 ??
   shr ax,cl     ; only cl or value can be placed here
  
   push ax
   call output_function

   
main endp
mov ah,4ch
int 21h

 output_function proc
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
