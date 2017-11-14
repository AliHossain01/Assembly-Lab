; Lab test 2.1: Input Output with procedure
; Author: SHAHiD 
; Date: 26 Sep 16
org 100h
.model small
.stack 100h
.data
    inpmsg dw "Input a number:$"
    outmsg dw 13,10,"Input number is:$" 
    errormsg dw 13,10,"Invalid number !$"
    
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
    
    call output_fucntion
      
     
      
main endp
mov ah,4ch
int 21h
  input_function proc
    jmp read
    
    error:
    lea dx,errormsg
    mov ah,9
    int 21h 
    jmp read
    
    read:
       xor bx,bx  
       xor cx,cx

       mov ah,1     
       int 21h
       cmp al,0dh
       je end
       
       input:
       cmp al,30h
       jl error
       cmp al,39h
       jg error
       
       and ax,000fh         ; convert to decimal digit
       
       push ax
       
       mov ax,10
       mul bx
       mov bx,ax
       
       pop ax
       
       add bx,ax
       
       mov ah,1
       int 21h
       
       cmp al,0dh
       jne input
       
       end:
     
     ret
  input_function endp
 
  output_fucntion proc
 
    mov ax,bx
    xor cx,cx
    mov bx,10
    
    repeat:
    xor dx,dx
    div bx          
    push dx          
    
    inc cx
    or ax,ax
    jne repeat
     
     
    mov ah,2
    display:
    pop dx           
    or dl,30h       
    int 21h
    loop display    
    
    ret
  output_fucntion endp 
  
end main       
