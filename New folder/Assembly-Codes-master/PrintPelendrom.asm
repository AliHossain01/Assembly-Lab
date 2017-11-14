org 100h

jmp start 
str0 db 0
str1 db 'lazy dog'
str2 db 0

start:  
mov bx, offset str1            
p1:
mov al, [bx]
cmp al, 0
jz p2
inc bx         
mov ah, 0Eh       
int 10h
jmp p1
     
     
p2:      
mov bx, offset str2 
dec bx     
p3:
mov al, [bx] 
cmp al, 0
jz p4
dec bx         
mov ah, 0Eh       
int 10h
jmp p3

 
p4: 
ret
