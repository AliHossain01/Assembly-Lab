.model small
.stack 100hmount
.data
	temp db ?
.code
main proc

initialize:
	mov ax, @DATA
 	mov ds,ax

input:
	mov ah, 1
	int 21h
	move bl, al

	mov ah, 1
	int 21h
	move bh, al
 	
	mov ah, 1
	int 21h
	move cl, al

;assending
	mov temp,bl
	cmp bh,temp	
	jg stp1		;jump if greter
        jmp stp3

stp1:
	mov temp,bh
	cmp cl,temp
	jg step2	;jump if greater
	jmp step3
	
stp2:
	mov temp,cl
	mov ah,2
	mov dl,temp
	int 21h
	jmp end
stp3:
	jup end

end:
	mov ah,4ch
	int 21h

main endp
	end main