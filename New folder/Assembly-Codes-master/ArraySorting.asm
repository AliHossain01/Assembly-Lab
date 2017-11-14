; Array Sorting
; Author: SHAHiD 
; Date: 26 Oct 16
org 100h
.model small
.stack 200h
.data
   
   A db 5,2,1,3,4  
.code
main proc
      
      mov ax,@data
      mov ds,ax
      lea si,A
      mov bx,5
      
      call selection_sort
      call output
     
      

mov ah,4ch
int 21h
main endp 

selection_sort proc 
    push bx
    push cx
    push dx
    push si
    
    dec bx
    je end_sort
    mov dx,si
    
    sort_loop:
    mov si,dx
    mov cx,bx
    mov di,si
    mov al,[di]
    
    find_big:
    inc si
    cmp [si],al
    jne next
    mov di,si
    mov al,[di]
    
    next:
    loop find_big
    
    call swap
    dec bx
    jne sort_loop
    
    end_sort:
    pop si
    pop dx
    pop cx
    pop bx
    
    ret
selection_sort endp    
swap proc
    push ax
    mov al,[si]
    xchg al,[di]
    mov [si],al
    pop ax
    
    ret
swap endp    
output proc  
       
     mov bx,5  
     lea si,A
    
      
     mov ah,2
     loop_:
    
     mov dx,[si] 
     add dx,30h
     int 21h
     
     inc si
     dec bx
     
     jne loop_
     
     
    
    
    ret
output endp    
end main       
