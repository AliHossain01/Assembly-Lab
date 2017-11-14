.model small
.stack 200h
.data
msg1 db 'Inputs: $'
msg2 db 'Ans: $'
temp dw ?
count db ?
n db ?
result dw 0
average dw ?
.code
main proc

mov ax,@data
mov ds,ax
lea dx,msg1
mov ah,9
int 21h                   ;display first message

mov ah,1
int 21h
mov count,al
sub count,48
mov bl,count
mov n,bl                
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
add result,bx                                 
dec count                  
cmp count,0
jne repeats                


xor bx,bx                  
mov bl,n                  
mov ax,result
xor dx,dx                  
div bx                   
mov average,ax             

;Print Start here
lea dx,msg2
mov ah,9
int 21h                    
xor cx,cx                  
mov ax,average            
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