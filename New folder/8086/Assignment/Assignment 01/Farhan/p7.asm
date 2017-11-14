.model small
.stack 100h
.data
msg db 'The number: $'
msg2 db 'Factorial is: $'
.code
main proc
mov ax,@data
mov ds,ax
lea dx,msg
mov ah,9
int 21h              
mov ax,0             
mov ah,1
int 21h              
and ax,000fh         
cmp ax,0             
jne calculate
mov bx,1
jmp printing
calculate:          
mov cx,ax            
mov ax,1             

loopSart:
mul cx               
loop loopSart
mov bx,ax            


printing:
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h              
lea dx,msg2
mov ah,9
int 21h             
xor cx,cx            
mov ax,bx            
mov bx,10                  
print:
xor dx,dx            
div bx               
push dx              
inc cx
cmp ax,0
jne print

ending:
mov ah,2
pop dx               
add dl,48
int 21h
loop ending          

mov ah,4ch
int 21h
main endp
end main
