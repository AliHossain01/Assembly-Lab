]	.MODEL SMALL
	.STACK 100H
	.DATA
		MSGA DB 'Enter a Number: $'
		MSGB DB 'Palindrom !!! $'
		MSGC DB 'Opps! Not Palindrom !!! $' 
		MSGD DB 13,10,'$'
		TEMP DW ?
		COUNT DW 0
	
	.CODE
	MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
	
	RAND_IO:
		LEA DX,MSGA						
		MOV AH,9
		INT 21H 
	
	INPUTS:
		MOV AH,1
		INT 21H
		MOV BX,0
		CMP AL,0DH
		JE RAND_IO

		CON_TO_NUM:
			AND AX,000FH
			
			MOV TEMP,AX
			MOV AX,10
			MUL BX
			MOV BX,AX
			ADD BX,TEMP
			INC COUNT

			MOV AH,1
			INT 21H
			CMP AL,0DH
			JNE CON_TO_NUM 
	
	PAL_OR_NOT: 
		MOV AX,COUNT
		MOV TEMP,BX
		MOV BX,2
		DIV BX
		MOV COUNT,AX
		MOV AX,TEMP
	
		STACK_PUSH:
			MOV DX,0
			MOV BX,10
			DIV BX
			PUSH DX
			CMP AX,0
			JNE STACK_PUSH
			MOV AX,TEMP
		
		CHECK_PAL:
			CMP COUNT,0
			JE PRINT_OUTPUT
			
			MOV DX,0
			MOV BX,10
			DIV BX
			MOV CX,DX
			MOV DX,0
			POP DX
			DEC COUNT
			
			CMP CX,DX
			JE CHECK_PAL 

		LEA DX,MSGC
		MOV AH,9
		INT 21H
		
		LEA DX,MSGD
		MOV AH,9
		INT 21H
		INT 21H
		JMP RAND_IO

	PRINT_OUTPUT:
		LEA DX,MSGB
		MOV AH,9
		INT 21H
		
		LEA DX,MSGD
		MOV AH,9
		INT 21H
		INT 21H
		JMP RAND_IO

	MAIN ENDP
	END MAIN
