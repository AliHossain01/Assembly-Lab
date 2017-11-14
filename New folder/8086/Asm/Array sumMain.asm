.model small
.stack 100h
.data
t dw ?
t1 dw ?
temp dw ?
result dw ?
arr dw 6 dup(?)
.code
main proc
mov ax,@data
mov ds,ax

mov cx,6
mov t,0

input:

repeats:                  
mov ah,1
xor bx,bx
int 21h                                
cmp al,0dh
je endNumber              

internalLoop:            
and ax,000fh             
mov temp,ax               
mov ax,10                                 
mul bx                    
mov bx, ax                
add bx,temp               

mov ah,1
int 21h                                  
cmp al,0dh
jne internalLoop

mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

endNumber:
mov ax,bx
mov bx,t
mov arr[bx],ax
inc t
inc t
loop input



xor dx,dx
xor bx,bx
mov cx,6 
 

mov result,0
mov t1,0

sumf:
mov bx,t1
mov ax,arr[bx]
add ax,result
mov result,ax
add t1,2
cmp t1 ,12
jne sumf

xor cx,cx
mov ax,result
mov bx,10
start1:
xor dx,dx
div bx
push dx
inc cx
cmp ax,0
jne start1



print1_:
mov ah,2
pop dx                     
add dl,48
int 21h
loop print1_






mov ah,4ch
int 21h
main endp
end main