TITLE PRG : Output Array Element

.MODEL SMALL
.STACK 100H

.DATA
A   DB  ?
LEN EQU 5 ;here if we change the number, the array size will be changed
MSG1 DB 'ENTER CHARACTERS: $'
MSG2 DB 0DH,0AH,'OUTPUT: $'

.CODE
	MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		
		;Showing Message_1
		MOV AH,9
		LEA DX,MSG1
		INT 21H
		
		;Taking Input & inserting it Into Array (A)
		MOV DI,0
		MOV CX,LEN
		MOV AH,1
	LABEL1:
		INT 21H
		MOV A[DI],AL ;Here inserting array element
		INC DI ;incrementing the index
		DEC CX
		CMP CX,0      ;comparing wheather it fulfils the lenght (LEN)
		
		
		
		JE NEXT ; jump if cx equals to 0
		JMP LABEL1
	
	NEXT:
		;Showing Message_2 with a newline
		
		mov ax,0
		mov ax,a+4
		xchg a+6,ax
		mov a+4,ax
		
		MOV AH,9
		LEA DX,MSG2
		INT 21H
	
		;showing output
		MOV DI,0
		MOV CX,LEN
		MOV AH,2
	LABEL2:
		MOV DL,A[DI]
		INT 21H
		mov ah,2
        mov dl,0dh       ;new line er jonno
        int 21h
        mov dl,0ah       ;cursor point 1st e anar jnno
        int 21h
        
		INC DI
		DEC CX
		CMP CX,0
		JE EXIT
		JMP LABEL2
	
	EXIT:
		MOV AH,4CH
		INT 21H
	MAIN ENDP
END MAIN