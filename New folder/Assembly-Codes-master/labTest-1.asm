org 100h
.model small
.stack
.data
    negate db -1 
    Mx db ?
    x db ?
    My db ?
    y db ? 
    
    one db 10,13,"1st Qurdinate ",10,13,"+X,+Y$"
    two db 10,13,"2nd Qurdinate " ,10,13,"-X,+Y$"
    three db 10,13,"3rd Qurdinate " ,10,13,"-X,-Y$"
    four db 10,13,"4th Qurdinate " ,10,13,"+X,-Y$"  
    origin db 10,13,"Origin $"
.code

main proc
      
      checkX:
    
      mov ah,1
      int 21h 
   
      cmp al,'-'
      je  inpMx
      jne inpX
      jmp exit
      
      inpMx:
      mov ah,1
      int 21h
      sub al,48
      mov Mx,al 
      
      jmp checkY
      jmp exit
       
       
      inpX:  
      sub al,48
      mov x,al
      jmp checkY
      jmp exit
       
      
      checkY: 
      
      mov ah,2
      mov dl,' '
      int 21h
      
       
      mov ah,1
      int 21h
      cmp al,'-'
      je  inpMy
      jne inpY
      jmp exit 
       
      
      inpMy: 
      mov ah,1
      int 21h 
      sub al,48
      mov My,al 
     
      jmp minusY  
      
      inpY:
      sub al,48
      mov y,al
      jmp exit 
      
          
      exit: 
   
       
      mov bl,x
      cmp bl,0
      jne px
      je nxpy
      jmp end
       
      px:
      mov cl,y
      cmp cl,0
      jne pxpy
      je o
          
      jmp end
      
      
       pxpy:
       mov ah,9
       lea dx,one
       int 21h
       jmp end
       
       nx:
       mov cl,y
       cmp cl,0
       jne nxpy
       je o  
       jmp end
       
       nxpy:
       mov ah,9
       lea dx,two
       int 21h
       jmp end   
      
      
      
      
      
     
     
       o:
        
       mov ah,9
       lea dx,origin
       int 21h
       jmp end   
      
      
       minusY:
       mov cl,x
       cmp cl,0
       jne mypx  
      
       
       mov bl,Mx
       cmp bl,0
       jne mymx
       
       jmp end
        
        mypx:
        
       mov ah,9
       lea dx,four
       int 21h
       jmp end 
       
       mymx:
       
       mov ah,9
       lea dx,three
       int 21h
       jmp end 
       
       
       
    
  end: 
    

main endP
mov ah,4ch
int 21h
end main