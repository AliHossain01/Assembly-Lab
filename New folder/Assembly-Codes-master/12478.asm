org 100h
.model small
.stack 100h
.data

  m db "KABIR$"


.code

  mov ah,9   ;string output
  lea dx,m   ; lea points data address of m
  int 21h 
              
  mov ah,2
  mov dl,0dh
  int 21h
  mov dl,0ah
  int 21h
    
