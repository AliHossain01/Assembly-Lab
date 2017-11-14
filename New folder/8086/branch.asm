.model small
.stack 100h
.data
 ma db 13,10,'first name$'
.code
main proc

mov ax,@data
mov ds,ax
	mov ah,9
	lea dx,ma
	int 21h
	;branching
	mov ax,5
	mov bx,6
	cmp ax,bx
	jg DIS_BIG
	;jl IDS_SML
DIS_BIG:
	mov ah,2
	mov dx,bx
	add dx,48
	int 21h
	
	mov ah,4ch
	int 21h
	
IDS_SML: 
	mov ah,2
	mov dx,ax
	int 21h
	mov ah,4ch
	int 21h

	

     
 main endp
        end main
