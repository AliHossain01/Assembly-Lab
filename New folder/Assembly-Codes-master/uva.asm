org 100h
.model small
.stack 100h
.data
   a db 0
   b db 0
   c db 0
   r1 db 0
   r2 db 0
   r3 db 0 
   c1 db 0
   c2 db 0
   c3 db 0 
   right db 13,10,"Right $"
   wrong db 13,10,"Wrong $"
.code
main proc

      start:        
      mov ah,1      ;input a
      int 21h
      sub al,48
      mov a,al  
      
      mov ah,1      ;input b
      int 21h
      sub al,48
      mov b,al
      
      mov ah,1      ;input c
      int 21h
      sub al,48
      mov c,al
      
      
      mov al,a      ; r1 = a*a
      mul a
      mov r1,al  
      
      mov al,b      ; r2 = b*b
      mul b
      mov r2,al
      
      mov al,c      ; r3 = c*c
      mul c
      mov r3,al
      
      mov bl,r3      ;c1 = r2+r3
      add bl,r2
      mov c1,bl   
      
      mov bl,r3      ;c2 = r1+r3
      add bl,r1
      mov c2,bl
      
      mov bl,r1      ;c3 = r2+r1
      add bl,r2
      mov c3,bl
      
      mov cl,r1      ;if(r1==c1) prinf("Right")
      cmp cl,c1
      je rt 
      
      
      
     
     
     
     
     
     
     rt: 
     call r
     
     wr: 
     call w
      



    
      


exit:  
main endp
mov ah,4ch
int 21h


r proc 
      mov ah,9
      lea dx,right
      int 21h
      jmp e
r endp
     
w proc
        mov ah,9
        lea dx,wrong
        int 21h 
        jmp e
w endp     


e:
end main 