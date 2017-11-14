org 100h
.model small
.stack 100h
.data

.code
main proc


   mov ah,1
   int 21h
   sub al,48
   mov bl,al
   
   
   mov ah,1
   int 21h
   sub al,48
   add al,bl
   add al,48
   
   mov ah,2
   mov dl,al
  
   
                   
   int 21h
   
   
   
endP  
mov ah,4ch
int 21h
end
   






