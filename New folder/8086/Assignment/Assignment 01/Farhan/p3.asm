.model small
.stack 100h
.data
msg db 'Enter n: $'
temp dw ?
temp1 dw ?
temp2 dw ?
n dw ?
.code
main proc
mov ax,@data
mov ds,ax
lea dx,msg
mov ah,9
int 21h                    ;print message

;Taking input n
xor dx,dx                 ;set cx=0
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
mov dl,0
add dl,48     
mov ah,2
int 21h                    
mov dl,32                  
int 21h                    
dec n                      
cmp n,0
je ending                  

mov dl,1
add dl,48
int 21h                    
mov dl,32                  
int 21h                    
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
;print the number
xor cx,cx                  
mov ax,dx                  
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
dec n                      
mov dl,32                 
int 21h                   
jmp repeat

ending:
mov ah,4ch
int 21h
main endp
end main