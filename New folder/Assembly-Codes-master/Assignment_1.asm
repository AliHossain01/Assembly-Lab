;input and output a big number
 
org 100h
.model small
.stack 100h
.data
      inpmsg db "Enter a decimal number (-32767 to 32768):$"
      outmsg db 13,10,"Input number is: $"
      errormsg db 13,10,"Not a decimal digit $" 
      temp dw ?
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,inpmsg
    mov ah,9
    int 21h
    
    call input_function
    
    lea dx,outmsg
    mov ah,9
    int 21h
    
    call output_function
    
   
main endp
mov ah,4ch
int 21h  


input_function proc
    jmp read
    
    error:
    lea dx,errormsg
    mov ah,9
    int 21h
    
    read:
       xor bx,bx    ;clear register
       xor cx,cx

       mov ah,1
       int 21h
       
       cmp al,'-'
       je minus
       
       cmp al,'+'
       je plus
       
       jmp input 
       
       minus:
       mov cx,1
       
       plus:
       int 21h
       cmp al,0dh
       je end
       
       input:
       cmp al,30h
       jl error
       cmp al,39h
       jg error
       
       and ax,000fh
       
       mov temp,ax
       
       mov ax,10
       mul bx
       mov bx,ax
       
       mov ax,temp
       
       add bx,ax
       
       mov ah,1
       int 21h
       
       cmp al,0dh
       jne input
       
       end:
       or cx,cx  ;check cx 0 or not
       je exit
       neg bx
      
      exit:
      ret
      input_function endp


output_function proc
    
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