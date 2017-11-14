; factorial

.model small
.stack 100h
.code

main proc 
    
    mov ah,1
    int 21h
    
    and cx,0
    mov cl,al   
    
    sub cx,30h
    and ax,0
    mov ax,cx
    
    cmp ax,0
    jne jump_to_1
    
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    mov dl,31h
    int 21h
    
    jmp exit
    
    jump_to_1:
    cmp ax,1
    
    jne dec_cx
    
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    mov dl,31h
    int 21h
    
    jmp exit
    
        
    
    dec_cx:
    dec cx
    
    fac:
    mul cx
    loop fac
    
    mov bx,ax
    
    ;;;;print new line 
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h 
    
    
   and ax,0 
   
   mov ax,bx 
   
   and cx,0
   
   
   mov cx,10
   
   and dx,0 
   
   mov bx,0000h
    
    store:
    
    div cx
    
    mov [0000h+bx],dx 
    
    add bx,2h 
    
    mov dx,0
    
    cmp ax,0
    jne store
    
    
    
    
    print:
    
    sub bx,2h
    
    mov dx,[0000h+bx] 
    add dx,30h
    mov ah,2
    int 21h
    
    cmp bx,0
    jne print    
    
     
    exit: 
     
    mov ah,4ch
    int 21h
       
        
    
    main endp
end main