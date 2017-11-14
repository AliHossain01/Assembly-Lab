;1727
;Cost Cutting
org 100h
.model small
.stack 100h
.data
     newline db 10,13,"$"
     
     a db 0
     b db 0
     c db 0
.code
main proc
      
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
      
      ; compare a and b 
      mov bl,a 
      cmp bl,b
      jg aGb 
      jl bGa
      jmp exit:
      
      aGb:
      ;compare b and c  (a>b)
      mov bl,b
      cmp bl,c
      jg abc
      jl cGb  
      jmp exit
      
      
       
      cGb:
      ;compare a and c (a>b , c>b) 
      mov bl,a
      cmp bl,c
      jg acb
      jl cab
      
      jmp exit 
      
      
      bGa:
      ;compare a and c  (b>a)
      mov bl,a
      cmp bl,c
      jg bac
      jl cGa  
      jmp exit
                 
      cGa:
      ;compare b and c  (c>a)
      mov bl,b
      cmp bl,c
      jg bca
      jl cba  
      jmp exit
                 
      
      abc:    
      ; mid = b
      mov ah,2
      mov dl,b 
      add dl,48
      int 21h  
      
      jmp exit  
       
      acb:
      ; mid = c
      mov ah,2
      mov dl,c 
      add dl,48
      int 21h  
      
      jmp exit 
      
      bac:  
      ;mid = a
      mov ah,2
      mov dl,a 
      add dl,48
      int 21h  
      
      jmp exit 
         
      bca:  
      ; mid = c
      mov ah,2
      mov dl,c 
      add dl,48
      int 21h  
      
      jmp exit   
       
      
      cab:
      ; mid = a
      mov ah,2
      mov dl,a 
      add dl,48
      int 21h  
      jmp exit 
       
      cba:  
      ;mid = b
      mov ah,2
      mov dl,b 
      add dl,48
      int 21h  
      
      jmp exit 
              
      
    exit:  

main endp
mov ah,4ch
int 21h
end main