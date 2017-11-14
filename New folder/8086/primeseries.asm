.model small
.stack 100h 
.data  
msg1 db 'The Prime Series is :$'  
temp dw ?
temp1 dw ?
n dw ?
.code  
main proc
mov ax,@data
mov ds,ax
xor dx,dx
mov n,2   

lea dx,msg1
mov ah,9
int 21h 

cmp n,2 
mov temp,2
jmp prime  

loop_1: 
inc n
mov ax,n
mov temp,ax
mov temp1,ax
xor ax,ax
dec temp1
mov cx,temp1
loop_2:
xor dx,dx
mov ax,temp
mov bx,cx
div bx
cmp dx,0
je not_prime
dec cx
cmp cx,1
jne loop_2
  
prime:
mov ax,temp
mov bx,10
xor cx,cx
pushstuck:
xor dx,dx
div bx
push dx
inc cx
cmp ax,0
jne pushstuck

mov ah,2
mov dl,32
int 21h
popstuck:
pop dx
add dl,48
int 21h
loop popstuck
jmp condition
not_prime:
condition:
cmp n,50
jne loop_1

mov ah,4ch
int 21h

main endp
end main
