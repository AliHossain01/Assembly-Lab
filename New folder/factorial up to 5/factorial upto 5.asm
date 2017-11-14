; factorial

.model small
.stack 100h
.code

main proc 
    
    mov ah,1
    int 21h
    
    and cx,0
    mov cl,al   
    
    sub cl,30h
    and ax,0
    mov al,cl
    
    sub cl,1
    
    fac:
    mul cl
    loop fac
    
    mov bx,ax
    
    ;;;;print new line 
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h 
    
    
   ; and ax,0  
   
   mov cl,10 
   
   mov ax,bx 
   
   mov bx,0000h
    
    store:
    
    div cl
    
    
    
    mov [0000h+bx],ah
    add bx,2h 
    
    mov ah,0
    
    cmp al,0
    jne store
    
    
    
    
    print:
    
    sub bx,2h
    
    mov dx,[0000h+bx] 
    add dx,30h
    mov ah,2
    int 21h
    
    cmp bx,0
    jne print    
       
        
    
    main endp
end main