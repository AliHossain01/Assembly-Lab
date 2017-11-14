;PROBLEM 10
;Binary search program for a given sorted array
.model small
.stack 100h
.data
msg db 'Enter the number you want to find (single digit):$'
arr dw 0,2,4,6,8
x dw ?
msg1 db 0dh,0ah,'Found$'
msg2 db 0dh,0ah,'Not Found$'
.code
main proc
mov ax,@data
mov ds,ax
lea dx,msg
mov ah,9
int 21h                   ;display first message
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h                   ;new line
mov ah,1
int 21h                   ;take input for the number to be find
mov ah,0       
sub ax,48                 ;convert to integer and set ah to 0 

mov x,ax
mov bx,0                  ;let first index = 0
mov dx,5                  ; and take last index 5

start: 
cmp bx,dx
ja notFound               ;first index>last index. hence not found
mov ax,bx
add ax,dx
shr ax,1                  ;ax=ax/2. where ax=(first index+last index)/2
mov si,ax
add si,si                 ;si=si+si, doubles the value of si. So actual index is found. because arr is dw type.
mov cx,x
cmp cx,arr[si]            ;compare the number with arr[middle] element
jae forward     
dec ax
mov dx,ax                 ;dx is the new last index
jmp start
forward:   
je found 
inc ax                    
mov bx,ax                 ;bx is the new first index                
jmp start

found:
mov ah,9
lea dx,msg1
int 21h
jmp finish
notFound: 
lea dx,msg2
mov ah,9
int 21h
  
finish:  
mov ah,4ch
int 21h
main endp
end main
