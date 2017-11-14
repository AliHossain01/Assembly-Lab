                                   .model small
.stack 100h
.data
msg1 db 10,13,"Enter First Number : $"
msg2 db 10,13,"Enter Second Number : $"
msg3 db 10,13,"Enter third Number : $"
newln db 10,13,"$"
space db " $"
.code
main proc
        
        input:
        ;print String
        mov ax,@data
        mov ds,ax
        lea dx,msg1
        mov ah,9
        int 21h
        
        ;1st input
        
        mov ah,1
        int 21h
        mov bl,al
        ;print String
        mov ax,@data
        mov ds,ax
        lea dx,msg2
        mov ah,9
        int 21h
        ;2nd input
        mov ah,1
        int 21h
        mov bh,al
        ;print String
        mov ax,@data
        mov ds,ax
        lea dx,msg3
        mov ah,9
        int 21h
        ;3rd input
        mov ah,1
        int 21h
        mov cl,al
        
        ;check
        cmp bl,bh
        jle con1
        jge con3
        con1:
        cmp bl,cl
        jle con2
        jge con5
        con2:
        cmp bh,cl
        jle print1
        jg print2
        con3:
        cmp bl,cl
        jle con4
        jge con6
        con4:
        cmp bh,cl
        jle print3
        con5:
        cmp bh,cl
        jge print4
        con6:
        cmp bh,cl
        jge print5
        jle print6
        print1:
        mov ax,@data
        mov ds,ax
        lea dx,newln
        mov ah,9
        int 21h
        mov ah,2
        mov dl,bl
        int 21h
        mov ax,@data
        mov ds,ax
        lea dx,space
        mov ah,9
        int 21h
        mov ah,2
        mov dl,bh
        int 21h
        mov ax,@data
        mov ds,ax
        lea dx,space
        mov ah,9
        int 21h
        mov ah,2
        mov dl,cl
        int 21h
        jmp exit
        
        
        print2:
        mov ax,@data
        mov ds,ax
        lea dx,newln
        mov ah,9
        int 21h
        mov ah,2
        mov dl,bl
        int 21h
        mov ax,@data
        mov ds,ax
        lea dx,space
        mov ah,9
        int 21h
        mov ah,2
        mov dl,cl
        int 21h
        mov ax,@data
        mov ds,ax
        lea dx,space
        mov ah,9
        int 21h
        mov ah,2
        mov dl,bh
        int 21h
        jmp exit
        
        
        print3:
        mov ax,@data
        mov ds,ax
        lea dx,newln
        mov ah,9
        int 21h
        mov ah,2
        mov dl,bh
        int 21h
        mov ax,@data
        mov ds,ax
        lea dx,space
        mov ah,9
        int 21h
        mov ah,2
        mov dl,bl
        int 21h
        mov ax,@data
        mov ds,ax
        lea dx,space
        mov ah,9
        int 21h
        mov ah,2
        mov dl,cl
        int 21h
        jmp exit
        
        
        print4:
        mov ax,@data
        mov ds,ax
        lea dx,newln
        mov ah,9
        int 21h
        mov ah,2
        mov dl,cl
        int 21h
        mov ax,@data
        mov ds,ax
        lea dx,space
        mov ah,9
        int 21h
        mov ah,2
        mov dl,bl
        int 21h
        mov ax,@data
        mov ds,ax
        lea dx,space
        mov ah,9
        int 21h
        mov ah,2
        mov dl,bh
        int 21h
        jmp exit
        
        
        print5:
        mov ax,@data
        mov ds,ax
        lea dx,newln
        mov ah,9
        int 21h
        mov ah,2
        mov dl,cl
        int 21h
        mov ax,@data
        mov ds,ax
        lea dx,space
        mov ah,9
        int 21h
        mov ah,2
        mov dl,bh
        int 21h
        mov ax,@data
        mov ds,ax
        lea dx,space
        mov ah,9
        int 21h
        mov ah,2
        mov dl,bl
        int 21h
        jmp exit
        
        
        print6:
        mov ax,@data
        mov ds,ax
        lea dx,newln
        mov ah,9
        int 21h
        mov ah,2
        mov dl,bh
        int 21h
        mov ax,@data
        mov ds,ax
        lea dx,space
        mov ah,9
        int 21h
        mov ah,2
        mov dl,cl
        int 21h
        mov ax,@data
        mov ds,ax
        lea dx,space
        mov ah,9
        int 21h
        mov ah,2
        mov dl,bl
        int 21h
        jmp exit
        
        
            exit:
            jmp input
            mov ah,4ch
            int 21h
            main endp
            end main
