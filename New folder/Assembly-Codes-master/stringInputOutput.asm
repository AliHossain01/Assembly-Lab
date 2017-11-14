
org 100h
.model small
.stack 100h
.data 
   PROMPT DB 'Type a line of text:',10,13,'$' 
   no_cap db 10,13, "No capital $"
   cap_msg db 10,13,"First capital = "
   first db ']'
          db "  Last capital = "
   last db '@ $' 
    
  

   
.code
main proc
  
  mov ax,@data
  mov ds,ax   
     
  mov ah,9
  lea dx,PROMPT
  int 21h  
   
   
  mov ah,1
  int 21h
    
  while:
  
  

  cmp al,0dh
  je end_while
   
  cmp al,'a'
  jl CapitalInput
  cmp al,'z'     
  jg end_if
  
  sub al,32
  
  CapitalInput:
   
  cmp al,'A'
  jnge end_if
  
  cmp al,'Z'
  jnle end_if
  
  
  cmp al,first
  jnl check_last
  
  mov first,al
  
  check_last:
  cmp al,last
  jng end_if
  
  mov last,al 
  
  
  end_if:
  
  int 21h
  jmp while
   
  end_while:
  
  mov ah,9
  cmp first,']'
  jne caps 

  
  lea dx,no_cap
  jmp display
  
  caps:
  lea dx,cap_msg
 
   display:
   int 21h
   
  
main endp
mov ah,4ch
int 21h
end main