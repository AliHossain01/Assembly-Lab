.model small
.stack 100h
.data
n db 1
.code
main proc
mov cx,5
mov bl,0             
mov ah,2

StartingLoop:           
inc bl               
mov n,bl             
Internal:            
mov dl,35            
int 21h              
dec n
cmp n,0
jne Internal         
mov dl,0dh
int 21h
mov dl,0ah
int 21h              
loop StartingLoop

mov ah,4ch
int 21h
main endp
end main