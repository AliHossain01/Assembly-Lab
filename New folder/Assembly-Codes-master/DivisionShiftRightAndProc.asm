; Division by shiftriht && proc
; Author: SHAHiD 
; Date: 25 Sep 16
org 100h
.model small
.stack 100h
.data
   
    
.code
main proc
         
         mov ax,400
         push ax
         
         call Division   
         
         pop ax
         push ax
         
         call output_func
         
         
       
          
main endp
mov ah,4ch
int 21h

Division proc 
    
    pop cx
    pop ax 
    shr ax,3  ; divide by 8 (2^3 = 8)  
    ; sar ax,3 also
    ; sar = shift arithmatic operand1 right
    ; shr = shitf operand1 left
    
    push ax  
    push cx
        
    ret
Division endp 

output_func proc 
      pop cx    ; clear instruction 
      
      pop bx    ; mov bx,ax
       
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
