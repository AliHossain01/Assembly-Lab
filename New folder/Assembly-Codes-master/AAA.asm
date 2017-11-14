; AAA instruction
; Author: SHAHiD 
; Date: 25 Sep 16
org 100h
.model small
.stack 100h
.data
   
    
.code
main proc
      
      mov ah,0        
      mov al,'8'      ;ax = 0038h
      add al,'2'      ;ax = 006Ah
      aaa             ;ax = 0100h
      or ax,3030h     ;ax = '10'
      
main endp
mov ah,4ch
int 21h

end main       
