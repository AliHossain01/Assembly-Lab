; nPr and nCr (here 5P3 and 5C3)  completely nuts !!!! :-(
; Author: SHAHiD
; Date: 25 Sep 16                
org 100h
.model small
.stack 100h
.data
     n dw ?
     r dw ?
     n_r dw ?
.code
main proc
     
     ;n!
     mov ax,5               
     push ax
     call factorial
     pop ax
     mov n,ax   
     
     ;r!
     mov ax,3
     push ax
     call factorial 
     pop ax
     mov r,ax
     
     ;n-r!
     mov ax,2
     push ax
     call factorial 

     pop ax
     mov n_r,ax  
     
     ;nPr
     mov ax,n
     mov bx,n_r
     
     push ax
     push bx
     call nPr 
     pop cx
     
     call output_function
     

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
     push cx  ; so that execute after the call instruction

     ret
factorial endp

nPr proc  
     
     pop cx
     pop bx
     pop ax
     ;bx = (n-r)!
     ;n!/(n-r)!
     div bx

     push bx
    
     push cx
    ret
nPr endp    


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