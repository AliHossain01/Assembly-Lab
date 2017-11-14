.model small
.stack 100h
.data
.code
main proc
    mov cx, 3
loop_p:    
    mov ah, 1
    int 21h
    
    loop loop_P
    main endp
end main