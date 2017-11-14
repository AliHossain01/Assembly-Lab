
org 100h
.model small
.stack 100h
.data
  
.code
main proc

     mov ax,2
     shl ax,3

     push ax
     
     
     mov ah,2
     
     print:             ;pop top to dx
     pop dx                            
     or dl,30h          ;convert decimal to ascii
     int 21h   
     loop print         ;loop in cx!=0

main endp
mov ah,4ch
int 21h
end main