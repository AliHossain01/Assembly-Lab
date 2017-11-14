;12646
;Zero or One
org 100h
.model small
.stack 100h
.data
     a db 0
     b db 0
     c db 0 
     newline db 10,13,"$"
.code
main proc

      start:
      ;input first num
      mov ah,1
      int 21h
      sub al,48
      mov a,al 
      
      ;input second num
      mov ah,1
      int 21h
      sub al,48
      mov b,al   

      ;input third num
      mov ah,1
      int 21h
      sub al,48
      mov c,al 
      
      ;print a new line
      mov ah,9
      lea dx,newline
      int 21h   
      
   
      ;check b == c
      mov bl,b
      cmp bl,c
      je ab
      jne compare
      ab:  
      ;check a==b
      mov bl,a 
      cmp bl,b  
      je endOfLoop
      
      compare:
      ; compare a and b 
      mov bl,a 
      cmp bl,b 
      jne aNb  
      jne bNa     
      je CW
      jmp exit
   
        
      aNb:
      ;compare a and c
      mov bl,a
      cmp bl,c
      jne AW
      je bNa
      
      jmp exit
      
      bNa:
      ;compare b and c
      mov bl,b
      cmp bl,c
      jne BW
      je CW
      jmp exit:
       
      AW:
      mov ah,2
      mov dl,a
      add dl,48
      int 21h
      jmp exit:  
      
      BW:
      mov ah,2
      mov dl,b
      add dl,48
      int 21h
      jmp exit:
      
      CW:
      mov ah,2
      mov dl,c
      add dl,48
      int 21h
      jmp exit:
      
      
      
exit: 
mov ah,9
lea dx,newline
int 21h
jmp start  

endOFLoop:
main endp
mov ah,4ch
int 21h
end main