;character array change
.model small
.stack 100h
.data
msg db 'subset$'
msg2 db 'not subset$'
key db 0
x db 'khulna dhaka rajshahi$'
arr db 8 dup('$')
temp dw 0
temp2 dw 0
count db 0
;temp db '$'
.code
main proc
mov ax,@data
mov ds,ax

xor cx,cx
xor bx,bx
input:
mov ah,1
int 21h
cmp al,0dh
je finish
mov arr[bx],al
add bx,1
inc key
jmp input

finish:
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

mov cx,21
xor bx,bx
xor ax,ax
xor si,si
mov temp,0
mov temp2,0
loop_:
mov bx,temp
mov si,temp2
mov dl,arr[si]
cmp x[bx], dl
jne next
loop2:
inc bx
inc si
mov dl,arr[si]
inc count
cmp x[bx], dl
je loop2

mov dl,key
cmp count,dl
je break
mov count,0
next:
inc temp
mov temp2,0
loop loop_

lea dx,msg2
mov ah,9
int 21h
jmp ending
break:
lea dx,msg
mov ah,9
int 21h

ending:
mov ah,4ch
int 21h
main endp
end main       