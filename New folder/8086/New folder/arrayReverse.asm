.model small
.stack 100h
.data
result dw ?
arr dw 4,3,9,8,5
.code
main proc
mov ax,@data
mov ds,ax

lea si,arr
xor bx,bx
mov cx,5
input:
mov bx,[si]
push bx
add  si,2
loop input

xor cx,cx
mov cx,5
output:
pop dx
mov ah,2 
add dl,48
int 21h
dec cx
cmp cx,0
jne output

mov ah,4ch
int 21h
main endp
end main

