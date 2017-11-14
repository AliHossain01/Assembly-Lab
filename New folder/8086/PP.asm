.model small
.stack 100h
.data
temp dw ?
msg1 db 'palindrom$'
msg2 db 'not palindrom$'
count dw 0
.code
main proc
mov ax,@data
mov ds,ax
;input
top:
mov ah,1
int 21h
mov bx,0
cmp al,0dh
je exit

inerloop:
and ax,000fh
mov temp,ax
mov ax,10
mul bx
mov bx,ax
add bx,temp
inc count

mov ah,1
int 21h
cmp al,0dh
jne inerloop

mov ax,count
mov temp,bx
mov bx,2
div bx
mov count,ax
mov ax,temp
repeat:
mov dx,0
mov bx,10
div bx
push dx
cmp ax,0
jne repeat
mov ax,temp
next:
cmp count,0
je print
mov dx,0
mov bx,10
div bx
mov cx,dx
mov dx,0
pop dx
dec count
cmp cx,dx
je next

lea dx,msg2
mov ah,9
int 21h
jmp exit

print:
lea dx,msg1
mov ah,9
int 21h

exit:
mov ah,4ch
int 21h

main endp
end main
