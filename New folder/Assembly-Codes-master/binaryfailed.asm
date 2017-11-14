; Binary to decimal
; Author: SHAHiD 
; Date: 26 Sep 16
org 100h
.model small
.stack 100h
.data
    digit dw 0
    i dw 1
    pc dw ?
.code
main proc
   
    input:
    mov ah,1
    int 21h
    
    cmp al,13
    je exit
    sub ax,30h
    push ax
    inc digit
    jmp input
    
    exit:
      
    call binaryToDecimal  
    
    call Output_function
      
main endp
mov ah,4ch
int 21h
  
  binaryToDecimal proc  
      pop pc 
      xor bx,bx    
       
      mov cx,digit 
      xor ax,ax
      count:
      pop ax
      mul i 
      add bx,ax
      shl i,1
      loop count
      push bx
      push pc
    
     ret
    
  binaryToDecimal endp 
  
  output_function proc
     pop pc 
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
      
      push pc
    ret
    output_function endp
end main       
