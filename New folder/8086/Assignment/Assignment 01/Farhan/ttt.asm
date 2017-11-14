;Title: Print decimal number.
OUTDEC PROC
	PUSH AX			;Save registers
	PUSH BX
	PUSH CX
	PUSH DX

	OR AX,AX
	JGE @END_IF1

	PUSH AX			;Save number
	MOV DL,'-'
	MOV AH,2
	INT 21H
	POP AX			;Get AX back
	NEG AX			;AX = -AX 

@END_IF1:			;Get decimal number
	XOR CX,CX
	MOV BX,10D

@REPEAT1:
	XOR DX,DX
	DIV BX
	PUSH DX
	INC CX

	OR AX,AX		;until
	JNE @REPEAT1

	MOV AH,2		;convert decimal to charecter and print


@PRINT_LOOP:
	POP DX			
	OR DL,30H		;convert to charecter
	INT 21H
	LOOP @PRINT_LOOP

	POP DX
	POP CX
	POP BX
	POP AX
	
    	MOV AH,2		;New line
    	MOV DL,0DH
    	INT 21H
    	MOV DL,0AH
    	INT 21H
	RET

OUTDEC ENDP