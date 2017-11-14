.model small
.stack 100h
.data
msg db 'b and p $'
msg2 db 'answer $'
count db 2
temp dw ?
b dw ?
p dw ?
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

;inputs
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
mov p,bx             
jmp next2
next:      
mov b,bx             
next2:                   
dec count            
cmp count,0
jne repeats          


calculate:          
mov cx,p             
mov bx,b             
mov ax,1             

loopSart:
mul bx               
loop loopSart
mov bx,ax            

;Print
printing:
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
