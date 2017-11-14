.model small
.stack 100h
.data

m1 db 'Enter the number of rows n : $'
m2 db 'Enter the number of columns m : $'
m3 db 'the result : $'

temp1 dw ?
temp2 dw ?
nn dw ?
ll dw ?
rr dw ?
count dw ?

.code
main proc

 

mov ax,@data
mov ds,ax

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

cmp al,'^'      ; jodi r input nite na cay then press ^
je exit

mov bx,0

further1:
and ax,000fh      ;ascii code convart ..sub o kora jai
mov temp1,ax      ;jodi ami 12 input nite cay tahole ax=1 , temp=ax
mov ax,10         ; pura number ta nibar jonno 10 die gun kore last add krte hbe
mul bx            ;ax=ax*bx
mov bx,ax
add bx,temp1 
mov nn ,bx       

mov ah,1
int 21h
cmp al,0dh
jne further1 

   
mov ah,2
mov dl,0dh       ;new line er jonno
int 21h
mov dl,0ah       ;cursor point 1st e anar jnno
int 21h


lea dx,m2        ;message paoa
mov ah,9         ;string display function call kora
int 21h          ;display

mov ah,1
int 21h
cmp al,0dh
je further2
mov bx,0

further2:
and ax,000fh      ;ascii code convart ..sub o kora jai
mov temp2,ax      ;jodi ami 12 input nite cay tahole ax=1 , temp=ax
mov ax,10         ; pura number ta nibar jonno 10 die gun kore last add krte hbe
mul bx            ;ax=ax*bx
mov bx,ax
add bx,temp2
mov ll,bx      

mov ah,1
int 21h
cmp al,0dh
jne further2 

   
mov ah,2
mov dl,0dh       ;new line er jonno
int 21h
mov dl,0ah       ;cursor point 1st e anar jnno
int 21h

mov ax,nn        ;x=n*m        
mov bx,ll
mul bx
mov cx ,1
;mov ax,cx
sub ax,cx
mov rr,ax 

;eksathe 2 digit print possible na so div kore remember nie display 

printDiff:
lea dx,m3
mov ah,9
int 21h
mov cx , 0
mov ax , rr ;jaha print kore taha ax e rakhe :)
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

jmp rerun

exit :


mov ah,4ch
int 21h
main endp
end main




