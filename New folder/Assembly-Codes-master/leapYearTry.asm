; Leap year testing
; Author: SHAHiD 
; Date: 28 Sep 16
org 100h
.model small
.stack 100h
.data
     pc dw ?
     year dw 800
     four dw 4
     fourH dw 400
     H dw 100 
     yesleapyear dw "Leap Year $"
     notleapyear dw "Not Leap Year $"
    
.code
main proc
      
   call leapYear
     
      
main endp
mov ah,4ch
int 21h
      
leapYear proc
    pop pc 
       
     
    mov ax,year
    div four
    cmp ah,0
    jne end
    
    mov ax,year
    div fourH
    cmp ah,0
    je ok
    
    mov ax,year
    div H
    cmp ah,0
    je end
    
    ok:
    mov ah,9 
    lea dx,yesleapyear
    int 21h
    
    jmp exit
   
    end:
    mov ah,9
    lea dx,notleapyear
    int 21h
    
    exit:
       
    
    push pc
    ret
leapYear endp    
end main       
