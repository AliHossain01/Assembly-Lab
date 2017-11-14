

.model small 
.stack 100h 
.data 
v1 dw ?
.code

main proc
    
      
      mov ax,-5961
      
      call print_int
      
      mov v1,ax
      
      inc v1
      
      mov ah,2
      mov dl,0ah
      int 21h
      mov dl,0dh
      int 21h
      
      mov ax,v1
      
      call print_int
      
      
      mov ah,2
      mov dl,0ah
      int 21h
      mov dl,0dh
      int 21h
      
     neg v1
     
     mov ax,v1
     
     call print_int 
        
      
      mov ah,4ch
      int 21h
      
      
    
    main endp
    
    print_int proc
       
       ;input is in ax resister
       
       push ax
       push dx
       push bx
       push cx
       
       
       
       ; if ax<0
       
       or ax,ax
       jge @end_if1
       
       
       ; then
       
       push ax 
       mov dl,'-'
       
       mov ah,2
       int 21h
       
       pop ax
       
       
       neg ax  ; ax*=(-1)
       
       
       @end_if1:
       
       ; get decimal degits
       
       and cx,0
       mov bx,10d
       
       
       @reapt1:
       
       and dx,0
       div bx
       push dx
       inc cx
       
       ;untill
       
       or ax,ax
       
       jne @reapt1
       
       ;convert digit into character
       
       mov ah,2
       
       @print_loop:
       
       pop dx
       or dl,30h
       int 21h
       
       loop @print_loop
       
       pop cx
       pop bx
       pop dx
       pop ax
              
       
       
            
        ret
        print_int endp



end main