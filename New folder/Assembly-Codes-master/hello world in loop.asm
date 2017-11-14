org 100h
.stack 
.model small
.data

m db "hello world $"

.code 
main proc
    first:
    mov ah,9
    lea dx,m
    int 21h
    jmp first           
    
    
    