.model small
.stack 100h
.data

m1 db ' input number N: $'
m3 db 'the result : $'

temp1 dw ?
nn dw ?
rr dw ?
s dw ?
p dw ?
t dw ?
count dw ?

.code
main proc

mov ax,@data
mov ds,ax

mov ah,1
int 21h
mov ah,0
sub al,30h
mov count,ax
mov si ,0

Rerun:
inc si
cmp si,count 
je exit

lea dx,m1        ;message paoa
mov ah,9         ;string display function call kora
int 21h          ;display


mov ah,1
int 21h
cmp al,0dh
je further1

cmp al,'^'      ;; jodi r input nite na cay then press ^
je exit

mov bx,0

further1:
and ax,000fh      ;ascii code convart ..sub o kora jai
mov temp1,ax      ;jodi ami 12 input nite cay tahole ax=1 , temp=ax
mov ax,10         ; pura number ta nibar jonno 10 die gun kore last add krte hbe
mul bx            ;ax=ax*bx
mov bx,ax
add bx,temp1 
     

mov ah,1
int 21h
cmp al,0dh
jne further1 
mov nn,bx  
   
mov ah,2
mov dl,0dh       ;new line er jonno
int 21h
mov dl,0ah       ;cursor point 1st e anar jnno
int 21h

mov bx,2
add bx,nn
mov s,bx
mov ax,s
mov bx,nn
mul bx
mov p,ax
mov dx,0
mov bx,2
mov ax,p
div bx
mov rr,ax
mov bx,3
mov ax,rr
mul bx 
mov t,ax
mov bx,6
sub t,bx


;eksathe 2 digit print possible na so div kore remember nie display 

printDiff:
lea dx,m3
mov ah,9
int 21h
mov cx , 0
mov ax , t        ;ja print kore ta ax e rakhe :)
mov bx , 10
store_in_stack:
mov dx , 0
div bx
push dx
inc cx
cmp ax , 0
jne store_in_stack

ending:
mov ah,2
pop dx                ;pop
add dl,48
int 21h
loop ending

mov ah,2
mov dl,0dh       ;new line er jonno
int 21h
mov dl,0ah       ;cursor point 1st e anar jnno
int 21h


jmp Rerun

exit:

mov ah,4ch
int 21h
main endp
end main




