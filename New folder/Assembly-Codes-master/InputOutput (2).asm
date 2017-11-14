;Input a decimal number and print
org 100h
.model small
.stack 100h
.data
    msginp db "Input a decimal number (-32768 to 32767): $"
    msgout db 13,10,"You have input:$ " 
    msgerror db 13,10,"Wrong $" 
    temp dw ?
.code
main proc
      
      mov ah,9
      lea dx,msginp
      int 21h  
      
      
      call input_func
      
      
      mov ah,9
      lea dx,msgout
      int 21h
      
      call output_func


main endp
mov ah,4ch
int 21h  

    
input_func proc  
     
    jmp read
    
    error:
    mov ah,9
    lea dx,msgerror
    int 21h
    
    read: 
    xor cx,cx           ;clear cx (flag)
    xor bx,bx           ;clear bx 
     
    mov ah,1
    int 21h
    cmp al,'-'          
    je minus  

    jmp input
    
    minus:
    mov cx,1             ;flag cx=1
    
    int 21h              ;first number input
    cmp al,0dh           ;compare if carriage return
    je end 
    
    input:
      
    cmp al,30h           ;error if not a digit (0-9)
    jl error
    
    cmp al,39h
    jg error
    
    and ax,000fh         ;convert ascii to decimal
    
    mov temp,ax          ;temp = ax
    mov ax,10            ;ax = 10
    mul bx               ;ax = ax*bx
    mov bx,ax            ;bx = ax
    mov ax,temp          ;ax = temp 
    add bx,ax            ;bx = bx+ax 
    
    mov ah,1
    int 21h
    
    cmp al,0dh
    je end
    jmp input

    end:
    or cx,cx             ;check cx=0 ?
    je exit              ;if(cx==0) exit
    neg bx               ;else negete cx
    
    exit:    
    ret
input_func endp 

output_func proc 
     
     cmp bx,0            ;if(bx>=0) print without (-)
     jge start            
     mov ah,2
     mov dx,'-'          ;else print a (-)
     int 21h
      
     neg bx              ;found -, now negate again
      
     start:
     xor cx,cx
     mov ax,bx
     mov bx,10
     
     repeat:            ;yelding ascii value from decimal number
     xor dx,dx
     div bx             ;ax = ax/bx
     push dx            ;store dx in stack
     inc cx             ;cx++ (digit counter)
     or ax,ax
     jne repeat         ;repeat untill zf = 1
      
      
     mov ah,2
     
     print:             ;pop top to dx
     pop dx                            
     or dl,30h          ;convert decimal to ascii
     int 21h   
     loop print         ;loop in cx!=0
     
    ret
output_func endp


end main