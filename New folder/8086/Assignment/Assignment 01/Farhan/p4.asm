.model small
.stack 100h
.data
msg db 'Inputs: $'
msg2 db 'Sum $'
temp dw ?
temp1 dw ?
temp2 dw ?
n dw ?
sum dw 0
.code
main proc
mov ax,@data
mov ds,ax
lea dx,msg
mov ah,9
int 21h       
     
                          ;Print Msg
                          ;Taking Input
						  
						  
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

;fibonacci series upto n
endNumber:
mov n,bx
cmp n,0
je ending                  
mov temp1,0                
mov temp2,1                
                          
dec n                      
cmp n,0
je ending                  

mov dx,1
add sum,dx                 
dec n                      

repeat:
cmp n,0
je ending                  
mov ax,temp1               
mov bx,temp2               
add ax,bx                  
mov dx,ax                  
mov ax,bx                  
mov bx,dx                  
mov temp1,ax               
mov temp2,bx               
add sum,dx                 
dec n                      ;
jmp repeat

;the number
ending:
lea dx,msg2
mov ah,9
int 21h                    
xor cx,cx                  
mov ax,sum                 
mov bx,10
print:
xor dx,dx                  
div bx                    
push dx                    
inc cx
cmp ax,0
jne print

printing:
mov ah,2
pop dx                     
add dl,48
int 21h
loop printing              

mov ah,4ch
int 21h
main endp
end main