;Odd or even

.org 100h
.model small 
.data


.code

mov ah,1
int 21h
sub al,'0'
and al,1


add al,'0'
jz even 
jnz odd

even:    
mov ah,2
mov dl,al
int 21h  


odd:
mov ah,2
mov dl,al
int 21h 