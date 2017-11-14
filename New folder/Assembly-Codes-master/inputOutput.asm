.model small
.stack 100h
.code    
       
mov ah,1
int 21h 
 

mov dl,al
mov ah,2
int 21h