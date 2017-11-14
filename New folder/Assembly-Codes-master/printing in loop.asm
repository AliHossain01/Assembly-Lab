;Print 1 to 9
org 100h
.model small
.stack 100h
.data

    i dw 1
    
.code

main proc
    
    start:
   
   
   mov dx,i 
 
   mov ah,2
   int 21h
   add i,1
   

   
   cmp i,9
   jl start:  
   
   int 21h
   
   