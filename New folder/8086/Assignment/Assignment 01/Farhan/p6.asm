.model small
.stack 100h
.data
msg1 db 'Enter n: $'
msg2 db 'Maximum is: $'
msg3 db 'Minimum is: $'
max dw 0
min dw 65535
temp dw ?
count db ?
result dw 0
.code
main proc

mov ax,@data
mov ds,ax
lea dx,msg1
mov ah,9
int 21h                   

mov ah,1
int 21h
mov count,al
sub count,48
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h                  


xor dx,dx                 
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

endNumber:

cmp bx,max                 
jbe minimum                
mov max,bx                 

minimum:
cmp bx,min                 
jae another               
mov min,bx                 
another:              
dec count                  
cmp count,0
jne repeats                



lea dx,msg2
mov ah,9
int 21h                    
xor cx,cx                  
mov ax,max                 
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

mov dl,0dh
int 21h
mov dl,0ah
int 21h                   


lea dx,msg3
mov ah,9
int 21h                    
xor cx,cx                 
mov ax,min                 
mov bx,10
print2:
xor dx,dx                 
div bx                    
push dx                    
inc cx
cmp ax,0
jne print2

ending2:
mov ah,2
pop dx                     
add dl,48
int 21h
loop ending2                

mov ah,4ch
int 21h
main endp
end main