.model small
.stack 100h
.data
msg1 db 'Number of inputs: $'
msg2 db 'Answer: $'
temp dw ?
count db ?
result dw 0
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
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h


xor dx,dx                 ;See book 121 page
repeats:                 
mov ah,1
xor bx,bx
int 21h                                 
cmp al,0dh
je endNumber              

internalLoop:             
and ax,000fh              ;See book 120 page
mov temp,ax              
mov ax,10                               
mul bx                    ;See chapter 9 multiplication
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

;PRINT START HERE
lea dx,msg2
mov ah,9
int 21h                    
xor cx,cx                  
mov ax,result              
mov bx,10
print:
xor dx,dx                  
div bx                     ;See chapter 9 division
push dx                    ;Stack e push holo, See 168-169 page er program
inc cx
cmp ax,0
jne print

ending:
mov ah,2
pop dx                     ;pop
add dl,48
int 21h
loop ending                ;loop runs until cx is 0

mov ah,4ch
int 21h
main endp
end main