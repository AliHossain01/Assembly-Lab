.model small
.stack 100h
.data
result dw ?
arr dw 5 dup(?)
.code
main proc
mov ax,@data
mov ds,ax

mov cx,5
xor bx,bx
input:
;xor ax,ax
mov ah,1
int 21h
mov ah,0
sub ax,48
mov arr[bx],ax
add bx,2
loop input

;lea si,arr
xor dx,dx
xor bx,bx
mov cx,5
add_:
add dx,arr[bx]
add bx,2
loop add_

;output
xor cx,cx
mov ax,dx
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