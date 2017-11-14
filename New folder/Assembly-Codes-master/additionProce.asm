; Function without parameter
org 100h
.model small
.stack 100h
.data
   dw a 7
   dw b 2
.code
main proc
       
     call addition 
       


main endp
mov ah,4ch
int 21h  


addition proc
    
    mov ax,7
    mov bx,2
    add ax,bx
    add ax,48
    
    mov dx,ax 
    mov ah,2
    int 21h
     
    ret
addition endp



end main