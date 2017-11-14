; multiple digit input and output

.model small
.stack 100h
.code 

main proc
        
        ;for input
        and bx,0  ; bx =0 
        and cx,0  ; cx =0
        mov cl,10 ; cl =10
        
        input:
        mov ah,1
        int 21h 
        and dx,0  ; dx = 0
        mov dl,al ; dl = al 
        
        
        cmp al,13
        jne make_number  
        
        je take_memory
        
        make_number:
        sub dl,30h
        and ax,0
        mov ax,bx
        mul cl
        
        add ax,dx
        mov bx,ax
        
        jmp input
        
        take_memory:
        
        mov ax,bx ; ax = bx
        mov bx,0000h
        
        
        part_digit:
        
        
        
        div cl  ; ax/=cx
        
        
        
        mov [0000h+bx],ah 
        mov ah,0
        
        add bx,2h
        
        cmp al,0
        
        jne part_digit
        
          
        mov ah,2
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h  
          
        
        print:
        
        sub bx,2h
        
        mov ah,2
        
        mov dx,[0000h+bx] 
        
        add dx,30h
        
        int 21h
        
        cmp bx,0
        
        jne print 
                  
        
        
    
    main endp
end main