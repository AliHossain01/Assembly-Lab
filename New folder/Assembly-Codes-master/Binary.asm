; Binary to decimal
; Author: SHAHiD 
; Date: 26 Sep 16
org 100h
.model small
.stack 100h
.data
   
      pc dw ? 
      i db 10,13,"Invalid Digit$"
.code
main proc
      xor bx,bx
      INPUT:
      mov ah,1 
      int 21h
      cmp al,13
      je ENd  
      cmp al,30h
      jl invalid
      cmp al,31h
      jg invalid
      and ax,0fh
      shl bx,1
      or bx,ax
      jmp INPUT 
      
      invalid:
      mov ah,9
      lea dx,i
      int 21h
      jmp exit
      
      
      END:  
      mov ah,2
      mov dl,10
      int 21h
      mov dl,13
      int 21h 
      push bx
      call output_function
      
      exit:
      
main endp
mov ah,4ch
int 21h
   
   
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
    
    ret
    output_function endp
end main       
