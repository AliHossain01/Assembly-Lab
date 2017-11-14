; odd even

org 100h
.model small
.stack 100h
.data
   
   ev db "Even $"
   od db "Odd $"
   
.code
main proc


     ; mov ah,1
     ; int 21h
     ; sub al,48  
     
     mov al,48
   
      and al,1
      jz even
      jnz odd
       
      
      
      even: 
      mov ah,2
      mov dl,0dh
      int 21h 
      mov dl,0ah
      int 21h
      
      mov ah,9
      lea dx,ev
      int 21h
      jmp end
      
      odd:
       mov ah,2
      mov dl,0dh
      int 21h 
      mov dl,0ah
      int 21h
      
      mov ah,9
      lea dx,od
      int 21h
      jmp end
     

      end:
      
endp
mov ah,4ch
int 21h
end main


