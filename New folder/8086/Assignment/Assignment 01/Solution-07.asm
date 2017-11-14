.MODEL SMALL
.STACK 100H
.DATA
 	MSGA DB 'Enter the Number to find Factorial(Max 5 Digit): $'
	MSGB DB 'Factorial of this Number is: $'
	TEMP DW ? 
	COUNT DW ?

.CODE
MAIN PROC
	MOV AX, @DATA
	MOV DS, AX

	LEA DX, MSGA			;Print 'Enter the Number to find Factorial(Max 5 Digit)'
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
		MOV CX,COUNT 
		INC COUNT 
		
	LEA DX, MSGB			;Print 'Factorial of this Number is: '
 	MOV AH,9
 	INT 21H 		
		
	CMP CX,0
	JNE GET_FACTORIAL
	
	MOV BX,1 
	JMP PRINT_START 

GET_FACTORIAL:
	MOV AX,1 
	MOV BX,1  
	
	DO_MUL:
		MUL BX 				;Multiply the number from 1 to Number
		INC BX 
		CMP BX,COUNT 
		JNE DO_MUL 
		
	MOV BX,AX 				;Assign the result in BX 
		

PRINT_START:
	MOV CX,0				;Or XOR CX,CX
	MOV AX,BX 
 	MOV BX,10

STOR_FACTORIAL:
	MOV DX,0
 	DIV BX					;AX = AX/BX
	PUSH DX					;Reminder(DX) in stack
 	INC CX
	CMP AX,0
 	JNE STOR_FACTORIAL

PRINT_FACTORIAL:
 	MOV AH,2
 	POP DX
 	ADD DL,48    			;Pop stack by DX and DX = DL
 	INT 21H

	DEC CX
	CMP CX,0
	JNZ PRINT_FACTORIAL

	MOV AH,4CH
 	INT 21H

MAIN ENDP
 	END MAIN