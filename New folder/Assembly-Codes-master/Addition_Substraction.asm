; Addition and substraction

.model small
.stack 100h
.data
    n1 db ?
    n2 db ?
    sum db 0
.code
main proc
    
    mov ah,1
    int 21h 
    sub al,48
    mov n1,al 
    
    mov ah,1
    int 21h 
    sub al,48
    mov n2,al 
     
     
    mov al,n1
    add al,n2
    add al,48 
    mov sum,al
    
    
    
    mov dl,sum
    mov ah,2
    int 21h
    
    
mov ah,4ch
int 21h
end main    