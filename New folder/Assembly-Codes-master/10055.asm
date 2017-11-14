;Prolem No: 10055
;Hasmot the brave worrior
org 100h
.model small
.stack 100h
.data
     newline db 10,13,"$"
.code
main proc

        mov ah,1
        int 21h
        sub al,48
        mov bl,al
        
        
        mov ah,1
        int 21h
        sub al,48
        
       
        
        cmp bl,al
        jg blal
        jle albl
        jmp exit
        
        
        blal: 
        
        sub bl,al
        mov ah,2
        mov dl,bl
        add dl,48
        int 21h 
        jmp exit 
        
        albl:
        sub al,bl
        mov ah,2
        mov dl,al
        add dl,48
        int 21h 
        jmp exit
        
       
exit:
main endp
mov ah,4ch
int 21h
end main