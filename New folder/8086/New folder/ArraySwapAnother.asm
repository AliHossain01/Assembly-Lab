.model small
.stack 100h
.data
a dw ?
b dw ?
c db ?
ar db 'kucseofcse$'
ar2 db ?
ar3 db ?
.code
main proc
mov ax,@data
mov ds,ax

mov a,10
lea si,ar
;lea di,ar1

mov ah,1
int 21h
mov ar2,al
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h
mov ah,1
int 21h
mov ar3,al
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h
while:
dec a
cmp a,0
jl end_while
mov bh,[si]
cmp bh,ar2
je equal
mov ah,2
mov dl,bh
int 21h
inc si
jmp while

equal:
mov ah,2
mov dl,ar3
int 21h
inc si
jmp while

end_while:
mov ah,4ch
int 21h

main endp
end main
