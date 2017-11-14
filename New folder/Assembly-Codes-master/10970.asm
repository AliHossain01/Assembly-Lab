;10970   
;Big chocolate
org 100h
.model small
.stack 100h
.data
     line db 10,13,"$"
.code
main proc
     
     start:   
     mov ah,1
     int 21h
     sub al,48 
     mov bl,al
     
     mov ah,1
     int 21h
     sub al,48
      

     mul bl
     sub al,1
     add al,48
      
     mov dl,al
     mov ah,2
     int 21h 
     
     mov ah,9
     lea dx,line
     int 21h
     
     jmp start
exit:
main endp
mov ah,4ch
int 21h
end main