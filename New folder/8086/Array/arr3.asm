;character array change
.model small
.stack 100h
.data
key db ?
arr db 6 dup(?)
temp db '$'
.code
main proc
mov ax,@data
mov ds,ax

mov cx,6
xor bx,bx
input:
mov ah,1
int 21h
mov arr[bx],al
add bx,1
loop input

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

mov ah,1
int 21h
mov dh,al         ;eita change korbo
mov ah,1
int 21h
mov dl,al         ;eita diye
mov key,dl

mov cx,6
xor bx,bx
check:
cmp arr[bx],dh
jne Notchange
mov dl,key
xchg arr[bx],dl
Notchange:
inc bx
loop check

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

lea dx,arr
mov ah,9
int 21h


mov ah,4ch
int 21h
main endp
end main       