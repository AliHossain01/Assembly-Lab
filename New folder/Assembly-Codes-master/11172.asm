; 11172   
org 100h
.model small
.stack 100h
.data
   a db 0
   i db 0
   
   l db 13,10,"<$"  
   g db 13,10,">$"
   e db 13,10,"=$"
.code
main proc
         
         mov ah,1
         int 21h  
         sub al,48
         mov bl,al 
         
         start:
         
         cmp bl,i
         jl exit
         inc i
         
         mov ah,1
         int 21h
         sub al,48
         mov a,al
         
         mov ah,1
         int 21h
         sub al,48
         mov cl,al
         
         cmp a,cl
         jl less
         je equal
         jg greater
         
         less:
         mov ah,9
         lea dx,l
         int 21h 
         jmp start 
         
          greater:
         mov ah,9
         lea dx,g
         int 21h
         jmp start 
         
          equal:
         mov ah,9
         lea dx,e
         int 21h
         jmp start  
           
    exit:
main endp
mov ah,4ch
int 21h
end main