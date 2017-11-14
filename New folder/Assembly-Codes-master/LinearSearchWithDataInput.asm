; Linear search
; Author: SHAHiD 
; Date: 26 Sep 16
org 100h
.model small
.stack 100h
.data
    pc dw ?
    i dw 0 
    f db 10,13,"Found $" 
    n db 10,13,"Not Found $"
    
.code
main proc
        
        
      insert:
      cmp i,100
      jge exit
      
      
      push i 
      inc i
      jmp insert
      exit:
      
      push 122
      call search
      
      
main endp
mov ah,4ch
int 21h
       
search proc  
    
     pop pc
     pop bx
     
     mov i,0
     
     src:
     
     cmp i,10 
     jge end
     
     cmp i,bx
     je found
     
     inc i
     jmp src
     
     found:
     mov ah,9
     lea dx,f
     int 21h
     jmp return
     
     end:
     mov ah,9
     lea dx,n
     int 21h
      
      return:
     push pc
    ret
search endp    
       
       
       
end main       
