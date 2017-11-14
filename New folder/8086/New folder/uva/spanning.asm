
.MODEL SMALL
 .STACK 100H
.data
a dw ?
b dw ?
msg db 'Case $'
msg1 db ': $'
.code
main proc
mov ax,@data
mov ds,ax
mov b,0  ;initialize b=0
while:
    call indec
    push ax
    mov a,ax    ;take first input
    cmp a,0      ;if a==0 then jmp end_while because terminate the program
    je end_while 
    mov ax,a   
    mov a,2    ;else ax=ax/2
    div a
    cwd 
    mov a,ax
    mov ah,9
    lea dx,msg   ;print msg
    int 21h
    inc b
    mov ax,b    ;increment the value b
    call outdec
    mov ah,9   ;print msg1
    lea dx,msg1
    int 21h
    mov ax,a
    call outdec  ;show the output value
    mov ah,2    ;print new line
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
jmp while
end_while:   ;end_while label
mov ah,4ch  ;dos exit
int 21h

main endp
  INCLUDE E:8086\PGM9_1.ASM
 INCLUDE E:8086\PGM9_3.ASM

 END MAIN
