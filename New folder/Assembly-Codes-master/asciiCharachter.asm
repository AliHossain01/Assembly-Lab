org 0x100
.model small
.stack 100h
.data
 i db 65

.code
main proc
    
       start:
        
        
        mov ah,2
        mov dl,i
        int 21h
        mov dl,' '
        int 21h 
        inc i
        
        cmp i,90
        
        jg end
        jmp start
        
        end:
        
endP
mov ah,4ch
int 21h
end main
   