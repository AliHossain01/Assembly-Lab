.model small
.stack 100h
.code

main proc 
    
    mov ah,1
    int 21h
    

   
    add ax,1
   
    
   
    mov dx,ax
    mov ah,2
    int 21h
    