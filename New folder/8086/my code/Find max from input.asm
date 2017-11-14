;find max number
.model small
.stack 100h
.data
	var db ?
	var1 db ?
.code
main proc

;initialize to ds
	mov ax,@data
	mov ds,ax

;input
	mov ah,1
	int 21h
	mov bl,al

	mov ah,1
	int 21h
	mov bh,al

	mov ah,1
	int 21h
	mov cl,al

;compare
	mov var,bl
	cmp bh,var	
	jg gre1		;jump if greter
        jmp gre3	;else go to gre3

gre1:
	mov var,bh
	cmp cl,var
	jg gre2		;jump if greater
	jmp gre5	;else
	
gre2:
	mov var,cl
	mov ah,2
	mov dl,var
	int 21h
	jmp end

gre3:
	cmp cl,var
	jg gre4
	jmp gre5

gre4:
	mov var,cl
	mov ah,2
	mov dl,var
	int 21h
	jmp end

gre5:
	mov ah,2
	mov dl,var
	int 21h

end:
	mov ah,4ch
	int 21h
	main endp
	end main
