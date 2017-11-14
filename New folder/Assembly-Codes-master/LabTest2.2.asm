; Lab test 2.2: Series summation with loop
; Author: SHAHiD 
; Date: 26 Sep 16
org 100h
.model small
.stack 100h
.data
    inpmsgs dw 13,10,"Input starting number:$"
    inpmsgd dw 13,10,"Input difference:$"
    inpmsgt dw 13,10,"Input number of terms:$"
    outmsg dw 13,10,"Seris Summation is:$" 
    errormsg dw 13,10,"Invalid number !$" 
    starting dw ?
    difference dw ?
    term dw ?
    pc dw ?
    looptime dw ? 
    res dw ?
    
.code
main proc
    
    xor ax,ax
    xor bx,bx
    xor cx,cx
      
    mov ax,@data
    mov ds,ax
    
    lea dx,inpmsgs
    mov ah,9
    int 21h
    
    call input_function 
   ; pop cx
    pop starting
     
    lea dx,inpmsgd
    mov ah,9
    int 21h
    
    call input_function
    ;pop cx 
    pop difference
    
    lea dx,inpmsgt
    mov ah,9
    int 21h
    
    call input_function 
    ;pop cx
    pop term 
    
    
    
    
    push starting
    push difference
    push term
    
    call seriesSummation
    ;pop pc
    pop res
    
    
     
    lea dx,outmsg
    mov ah,9
    int 21h     
    
    push res
    call output_fucntion
      
     
      
main endp
mov ah,4ch
int 21h   


input_function proc
    pop pc
    jmp read
    
    error:
    lea dx,errormsg
    mov ah,9
    int 21h 
    jmp read
    
    read:
       xor bx,bx  
       xor cx,cx
       
       
       input:
       mov ah,1     
       int 21h
       cmp al,0dh
       je end
       
       
       cmp al,30h
       jl error
       cmp al,39h
       jg error
       
       and ax,000fh         ; convert to decimal digit
       
       push ax
       
       mov ax,10
       mul bx
       mov bx,ax
       
       pop ax
       
       add bx,ax
     
       jmp input
       
       end: 
       
       push bx 
       push pc
       
     ret
  input_function endp
 
  output_fucntion proc
    pop pc 
    pop bx
    mov ax,bx
    xor cx,cx
    mov bx,10 
    
    
    
    repeat:
    xor dx,dx
    div bx          
    push dx          
    
    inc cx
    or ax,ax
    jne repeat
     
     
    mov ah,2
    display:
    pop dx           
    or dl,30h       
    int 21h
    loop display    
     
    push pc
    ret
  output_fucntion endp 
   
   
  seriesSummation proc 
    
    pop pc 
   
    pop looptime
    pop bx
    pop ax 
    
    add ax,bx
    looping:
    
    
    cmp looptime,1
    jle exit 
    add ax,bx  
    add bx,difference
    
    dec looptime
    jmp looping 
     
    exit: 
  
    push ax
    push pc
    ret
    
   seriesSummation endp
end main       
