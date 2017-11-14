	.MODEL SMALL
	.STACK 100H
	.DATA
		MSGA DB 'Number of Inputs: $'
		MSGB DB 'Enter Number: $'
		MSGC DB 'Averege: $'
		TEMP DW ?
		COUNT DW ?
		LEN DW ?
		SUM DW 0
		AVERAGE DW 0 

	.CODE
	MAIN PROC
		MOV AX, @DATA
		MOV DS, AX

		LEA DX, MSGA			;Print 'Number of Inputs:'
		MOV AH,9
		INT 21H 

	GET_INPUT:
		MOV AH,1
		MOV BX,0
		INT 21H

		CMP AL,0DH	
		JE END_INPUT			;If Enter

		INER_LOOP_1:	
			MOV AH,0			;Use full 16 bits of AX  
			SUB AX,48					

			MOV TEMP,AX
			MOV AX,10
			MUL BX				;AX = AX*BX
			MOV BX,AX
			ADD BX,TEMP

		MOV AH,1				;Input new digit
		INT 21H
		CMP AL,0DH
		JNE INER_LOOP_1  		;If Enter           

		END_INPUT:
			MOV COUNT,BX
			MOV LEN,BX 

		LEA DX, MSGB			;Print 'Enter Number'
		MOV AH,9
		INT 21H 
		
		MOV AH,2
		MOV DL,0DH
		INT 21H					;New line
		MOV DL,0AH
		INT 21H	
			
		MOV DX,0
		MOV TEMP,0

	OUT_LOOP:
		MOV AH,1
		MOV BX,0
		INT 21H

		CMP AL,0DH	
		JE LAST_INPUT			;If Enter

		INER_LOOP_2:	
			MOV AH,0			;Use full 16 bits of AX 
			SUB AX,48				

			MOV TEMP,AX
			MOV AX,10
			MUL BX				;AX = AX*BX
			MOV BX,AX
			ADD BX,TEMP

		MOV AH,1				;Input new digit
		INT 21H
		CMP AL,0DH
		JNE INER_LOOP_2  		;If Enter           

		LAST_INPUT:
			ADD SUM,BX
			DEC COUNT
			CMP COUNT,0
			JNE OUT_LOOP
			
	GET_AVERAGE:
		MOV BX,0 
		MOV BX,LEN
		MOV AX,SUM
		DIV BX
		MOV AVERAGE,AX
		
	PRINT_START:
		LEA DX, MSGC			;Print 'Averege'
		MOV AH,9
		INT 21H 

		MOV CX,0				;Or XOR CX,CX
		MOV AX,AVERAGE
		MOV BX,10

	STOR_STACK:
		MOV DX,0
		DIV BX					;AX = AX/BX
		PUSH DX					;Reminder(DX) in stack
		INC CX
		CMP AX,0
		JNE STOR_STACK 

	PRINT:
		MOV AH,2
		POP DX
		ADD DL,48    			;Pop stack by DX and DX = DL
		INT 21H

		DEC CX
		CMP CX,0
		JNZ PRINT

		MOV AH,4CH
		INT 21H

	MAIN ENDP
		END MAIN