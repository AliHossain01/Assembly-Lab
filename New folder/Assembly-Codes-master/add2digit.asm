.model small
.stack 100h
.data


a db 0
b db 0


.code  

main proc

 mov ah,1
 int 21h
 mov a,al
   
 mov ah,1
 int 21h
 mov b,al
 
 add al,a
 mov b,al  
 sub b,48 
 
 mov ah,2
 mov dl,b
 int 21h
      
      
      
      mov ah,4ch
      int 21h
      main endp
      end main
                
                