;136
;Ugly Numbers 
org 100h
.model small
.stack 100h
.data
     
     ugly db "1500th's ugly number is 859963392.$"
     line db 10,13,"$"
.code
main proc

    mov ah,9
    lea dx,ugly
    int 21h
    lea dx,line
    int 21h

main endp
mov ah,4ch
int 21h
end main