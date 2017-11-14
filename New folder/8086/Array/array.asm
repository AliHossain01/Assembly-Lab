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
add_:
add bx,[si]
add si,2
loop add_

;output
xor cx,cx
mov ax,bx
mov bx,10
start:
xor dx,dx
div bx
push dx
inc cx
cmp ax,0
jne start


print_:
mov ah,2
pop dx                     
add dl,48
int 21h
loop print_

mov ah,4ch
int 21h
main endp
end main