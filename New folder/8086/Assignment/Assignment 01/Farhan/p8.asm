.model small
.stack 100h
.data
msg db 'Enter two numbers separate by new line: $'
msg2 db 'GCD is $'
count db 2           
x dw ?
y dw ?
temp dw ?
.code
main proc

mov ax,@data
mov ds,ax
lea dx,msg
mov ah,9
int 21h              
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h              

;two inputs
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
cmp count,1
jne next
mov y,bx             
jmp next2
next:      
mov x,bx             
next2:             
dec count            
cmp count,0
jne repeats          

;GCD
mov cx,y             
mov bx,x             
cmp bx,cx
jb GCD               
xchg bx,cx           

GCD:
xor dx,dx                       
mov ax,cx
div bx               
cmp dx,0             
je printing
mov cx,bx            
mov bx,dx            
jmp GCD

;Print
printing:
lea dx,msg2
mov ah,9
int 21h                    
mov ax,bx                  
xor cx,cx                  
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