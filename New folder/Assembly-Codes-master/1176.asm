;1176
;A Benevolent Josephus

org 100h
.model small
.stack 100h
.data
  
.code
main proc

    start:  

    
    mov ah,1
    int 21h
    add al,3
    
  
    
    mov dl,al
    mov ah,2
    int 21h
   
    
    ;print new line
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    jmp start



main endp
mov ah,4ch
int 21h
end main